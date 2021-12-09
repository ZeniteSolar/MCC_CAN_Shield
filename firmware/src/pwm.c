#include "pwm.h"

#ifdef ENABLE_SWEEP
uint8_t sweep_periods;
#endif // ENABLE_SWEEP

// // pwm variables
uint8_t pwm_d_clk_div;

/**
 * @brief configura o PWM usando o timer TC1
 */
void pwm_init(void)
{
#ifdef PWM_ON
    TCCR1A = (0<<COM1A1) | (0<<COM1A0)
        | (1<<COM1B1) | (0<<COM1B0)
        | (0<<WGM11) | (0<<WGM10);
    TCCR1B = (0<<CS12) | (0<<CS11) | (1<<CS10)
        | (1<<WGM13) | (0<<WGM12);

    ICR1 = PWM_TOP;
    OCR1B = PWM_D_INITIAL;                              // set initial Duty Cycle

    set_bit(PWM_DDR, PWM);

#ifdef ENABLE_SWEEP
    sweep_completed = 0;
#endif // ENABLE_SWEEP
#ifdef ENABLE_ZERO_POWER_DETECTION
    zero_power_detection_counter = 0;
#endif // ENABLE_ZERO_POWER_DETECTION 
 
#endif // PWM_ON
}


/**
 * @brief reset pwm and its control buffers.
 */
inline void pwm_reset(void)
{
    set_pwm_off();
#ifdef MACHINE_ON
    control.D = 0;
#endif
    VERBOSE_MSG_PWM(usart_send_string("PWM turned off!\n"));
}

/**
 * @brief 
 */
inline void zero_power_detection(void)
{
#ifdef ENABLE_ZERO_POWER_DETECTION
    if(control.pi[0] < RUNNING_PANEL_POWER_MIN){
        if(++zero_power_detection_counter > ZERO_POWER_DETECTION_THRESHOLD){
            zero_power_detection_counter = 0;
#ifdef ENABLE_SWEEP
            sweep_completed = 0;
            sweep_periods = (PERIODS_TO_SWEEP -1);
            sweep_last_up = 0;
            sweep_updown = 0;
#endif // ENABLE_SWEEP 
#ifdef ENABLE_SOFT_START
            soft_start_completed = 0;
#endif // ENABLE_SOFT_START 
            control.D = PWM_D_MIN;
            VERBOSE_MSG_MACHINE(usart_send_string("\n>>> ZERO POWER DETECTED!\n"));
        }
    }else{
        zero_power_detection_counter = 0;
    }
#endif //ENABLE_ZERO_POWER_DETECTION
}

/**
 * @brief computs duty-cycle for PWM
 */
void pwm_compute(void)
{	
static uint8_t i=0;

if(i <= 0)
{
            i++;
            soft_start_completed = 0;
            sweep_completed = 0;
            sweep_periods = (PERIODS_TO_SWEEP -1);
            sweep_last_up = 0;
            sweep_updown = 0;
}

#ifdef MACHINE_ON
    // Compute derivates
    control.pi[0] = control.vi[0] * control.ii[0];
    control.dpi = control.pi[0] -control.pi[1];
    control.dvi = control.vi[0] -control.vi[1];

#ifdef CONVERTER_TEST_WITH_FIXED_DUTYCYCLE

    control.D_step = PWM_D_STEP;
    control.D = CONVERTER_TEST_WITH_FIXED_DUTYCYCLE_DT_VALUE;
    #ifdef ENABLE_SOFTWARE_BATTERY_VOLTAGE_LIMIT
    battery_voltage_limit();
    #endif // ENABLE_SOFTWARE_BATTERY_VOLTAGE_LIMIT

#else  // CONVERTER_TEST_WITH_FIXED_DUTYCYCLE

    #ifdef ENABLE_SWEEP
    #ifdef ENABLE_SOFT_START

    if(sweep_completed){

        if(!soft_start_completed){
            if(control.D < control.mpp_D){
                control.D += PWM_D_STEP;
                usart_send_string(" , d++, ");
            }else{
                soft_start_completed = 1;
                VERBOSE_MSG_MACHINE(usart_send_string("\n>>> SOFT START COMPLETED\n"));
            }
        }else{
            #ifdef ENABLE_PERTURB_AND_OBSERVE
            perturb_and_observe();
            #endif // ENABLE_PERTURB_AND_OBSERVE
            #ifdef ENABLE_ZERO_POWER_DETECTION
            zero_power_detection();
            #endif //ENABLE_ZERO_POWER_DETECTION 
        }
    }else{
        sweep();
    }
    #endif // ENABLE_SOFT_START
    #endif // ENABLE_SWEEP

    #ifdef ENABLE_SWEEP
    #ifndef ENABLE_SOFT_START

    if(sweep_completed){
            #ifdef ENABLE_PERTURB_AND_OBSERVE
    perturb_and_observe();
            #endif // ENABLE_PERTURB_AND_OBSERVE
            #ifdef ENABLE_ZERO_POWER_DETECTION
    zero_power_detection();
            #endif //ENABLE_ZERO_POWER_DETECTION 
    }else{
        sweep();
    }
    #endif // ENABLE_SOFT_START
    #endif // ENABLE_SWEEP

    #ifndef ENABLE_SWEEP
    #ifdef ENABLE_SOFT_START
    if(!soft_start_completed){
        if(control.D < PWM_D_NOMINAL){
            control.D += PWM_D_STEP;
        }else{
            soft_start_completed = 1;
            VERBOSE_MSG_MACHINE(usart_send_string("\n>>> SOFT START COMPLETED\n"));
        }
    }else{
            #ifdef ENABLE_PERTURB_AND_OBSERVE
        perturb_and_observe();
            #endif // ENABLE_PERTURB_AND_OBSERVE
            #ifdef ENABLE_ZERO_POWER_DETECTION
        zero_power_detection();
            #endif //ENABLE_ZERO_POWER_DETECTION        
    }
    #endif // ENABLE_SOFT_START
    #endif // ENABLE_SWEEP

    #ifndef ENABLE_SWEEP
    #ifndef ENABLE_SOFT_START
        #ifdef ENABLE_PERTURB_AND_OBSERVE
    perturb_and_observe();
        #endif // ENABLE_PERTURB_AND_OBSERVE
        #ifdef ENABLE_ZERO_POWER_DETECTION
    zero_power_detection();
        #endif //ENABLE_ZERO_POWER_DETECTION         
    #endif // ENABLE_SOFT_START
    #endif // ENABLE_SWEEP


#endif // CONVERTER_TEST_WITH_FIXED_DUTYCYCLE

    #ifdef ENABLE_PANEL_POWER_LIMIT
    panel_power_limit();
    #endif // ENABLE_PANEL_POWER_LIMIT
    #ifdef ENABLE_SOFTWARE_BATTERY_VOLTAGE_LIMIT
    battery_voltage_limit();
    #endif // ENABLE_SOFTWARE_BATTERY_VOLTAGE_LIMIT

    pwm_limit();
    set_pwm_duty_cycle(control.D);

    VERBOSE_MSG_PWM(usart_send_string("PWM computed as: "));
    VERBOSE_MSG_PWM(usart_send_uint16(OCR1A));
    VERBOSE_MSG_PWM(usart_send_char('\n'));

#ifdef ENABLE_IO_COMPUTATION
    control.io[0] = control.ii[0] * ((1 -control.D) / control.D);
#ifdef ENABLE_PO_COMPUTATION
    control.po[0] = control.vo[0] * control.io[0]; 
#endif // ENABLE_PO_COMPUTATION
#endif // ENABLE_IO_COMPUTATION

    // recycles
    control.pi[1] = control.pi[0];
    control.vi[1] = control.vi[0];
    control.ii[1] = control.ii[0];
    control.vo[1] = control.vo[0];
#ifdef ENABLE_IO_COMPUTATION
    control.io[1] = control.io[0];
#ifdef ENABLE_PO_COMPUTATION
    control.po[1] = control.po[0];
#endif // ENABLE_PO_COMPUTATION
#endif // ENABLE_IO_COMPUTATION


#endif // MACHINE_ON
}

/**
 * @brief apply some threshhold saturation limits 
 */
inline void pwm_limit(void)
{
    if(control.D > PWM_D_MAX)        control.D = PWM_D_MAX;
    else if(control.D < PWM_D_MIN)   control.D = PWM_D_MIN;
}


