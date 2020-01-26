#ifndef _CONTROL_H
#define _CONTROL_H

#include <avr/io.h>
#include "conf.h"
#include "../lib/bit_utils.h"
#include "usart.h"
#include "dbg_vrb.h"
#include "math.h"

volatile float dt, dt_max, dt_min, pi, vi, vo, ii, ii_max, vo_setpoint, vi_setpoint, ii_setpoint, pi_setpoint;
volatile union control_flags_t{
    struct{
        //uint8_t enable : 1;
        //uint8_t vi_safe_range : 1;
        //uint8_t vo_safe_range: 1;
        //uint8_t vi_stable : 1;
        //uint8_t dt_safe_range : 1;
        uint8_t updown : 1;
    };
    uint8_t all;
	float u_step;
}control_flags;

void control(void);
void control_init(void);
void control_feedback(void);

float sma_pi(float input);
float sa_pi(float input);
float peo(float dpi);
float piVo(float r, float y);
float piPi(float r, float y);
float piVi(float r, float y);
float piIi(float r, float y);

#endif /* ifndef _CONTROL_H */