.data
timer_1s:   .word   100000000 @ 0x5F5E100
timer_2s:   .word   200000000
timer_5s:   .word   500000000

/* 50*4 to store 50 f(2) to f(51) results for dynamic programming*/
fibonacci_array: .zero 200 @ used by fibonacci

.text
.global _start
_start:


    /* Test case for the func_convert_seven_segment_byte */
    @bl test_func_convert_seven_segment_byte_1
    @bl test_func_convert_seven_segment_byte_2
    @bl test_func_convert_seven_segment_byte_3
    @bl test_func_convert_seven_segment_byte_4
    @bl test_func_convert_seven_segment_byte_5
    /* Test case for the func_convert_decimal */
    @bl test_func_conver_decimal_1
    @bl test_func_conver_decimal_2
    @bl test_func_conver_decimal_3
    @bl test_func_conver_decimal_4
    @bl test_func_conver_decimal_5
    /* Test case for the func_number_display */
    @bl test_func_number_display_1
    @bl test_func_number_display_2
    @bl test_func_number_display_3
    @bl test_func_number_display_4
    @bl test_func_number_display_5
    @bl test_func_number_display_6
    @bl test_func_number_display_7
    @bl test_func_number_display_8
    @bl test_func_number_display_9
    @bl test_func_number_display_10
    /* Test case for the timer code */
    @bl test_func_timer_1
    @bl test_func_timer_2
    @bl test_func_timer_3
    /* Test case for the fibonacci calculating code */
    @bl test_func_fibonacci_dynamic_programming_1
    @bl test_func_fibonacci_dynamic_programming_2
    @bl test_func_fibonacci_dynamic_programming_3
    @bl test_func_fibonacci_dynamic_programming_4
    @bl test_func_fibonacci_dynamic_programming_5
    @bl test_func_fibonacci_dynamic_programming_6
    @bl test_func_fibonacci_dynamic_programming_7

@ --------------------------------------------
@ Test: Test the result of func_fibonacci_dynamic_programming
@
@ Description:
@   test_1: 0 @ ret = 0
@   test_2: 1 @ ret = 1
@   test_3: 2 @ ret = 1
@   test_4: 3 @ ret = 2
@   test_5: 4 @ ret = 3
@   test_6: 10 @ ret = 55
@
@ --------------------------------------------
test_func_fibonacci_dynamic_programming_1:
    push {r4, r5, r6, r7, lr}
    mov r0, #0
    bl func_fibonacci_dynamic_programming

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

test_func_fibonacci_dynamic_programming_2:
    push {r4, r5, r6, r7, lr}
    mov r0, #1
    bl func_fibonacci_dynamic_programming

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

test_func_fibonacci_dynamic_programming_3:
    push {r4, r5, r6, r7, lr}
    mov r0, #2
    bl func_fibonacci_dynamic_programming

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

test_func_fibonacci_dynamic_programming_4:
    push {r4, r5, r6, r7, lr}
    mov r0, #3
    bl func_fibonacci_dynamic_programming

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

test_func_fibonacci_dynamic_programming_5:
    push {r4, r5, r6, r7, lr}
    mov r0, #4
    bl func_fibonacci_dynamic_programming

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

test_func_fibonacci_dynamic_programming_6:
    push {r4, r5, r6, r7, lr}
    mov r0, #10
    bl func_fibonacci_dynamic_programming

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

test_func_fibonacci_dynamic_programming_7:
    push {r4, r5, r6, r7, lr}
    mov r0, #20
    bl func_fibonacci_dynamic_programming

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

@ --------------------------------------------
@ Function: func_fibonacci_dynamic_programming
@
@ Description:
@   This function accepts a n number to calculate the 
@
@ Inputs:
@   R0 - Input number for fibonacci algorithm
@
@ Outputs:
@   R0 - Output Result
@
@ Note:
@   This subroutine use dynamic programming, which will need extra storage
@
@--------------------------------------------
func_fibonacci_dynamic_programming:
    push {r4, r5, r6, r7, lr}

    cmp r0, #0 @ if the input if 0
    beq label_input_0
    cmp r0, #1 @ if the input if 0
    beq label_input_1

    @ Get 4 bytes at index [n-2] of the fibonacci_array
    ldr r4, =fibonacci_array
    mov r1, r0
    sub r1, #2 @ [n-2]
    lsl r1, #2 @ multiply by 4 to calculate bytes offset
    add r4, r1
    ldr r2, [r4]

    cmp r2, #0
    bne label_saved_value @ cached value

    @ new value, then calculate n-2 recursively
    push {r0} @ save the original input first
    sub r0, #2 @ n-2
    bl func_fibonacci_dynamic_programming
    @ resotre from the recursive function
    mov r7, r0 @ save the return value first
    pop {r0} @ restore the original input

    @ new value, then calculate n-1 recursively
    push {r0} @ save the original input first
    sub r0, #1 @ n-2
    bl func_fibonacci_dynamic_programming
    @ resotre from the recursive function
    mov r6, r0 @ save the return value first
    pop {r0} @ restore the original input

    @ Get 4 bytes at index [n-2] of the fibonacci_array
    ldr r4, =fibonacci_array
    mov r1, r0
    sub r1, #2 @ [n-2]
    lsl r1, #2 @ multiply by 4 to calculate bytes offset
    add r4, r1

    add r0, r6, r7
    str r0, [r4]
    pop {r4, r5, r6, r7, lr}
    bx lr @ return to the caller

label_input_0:
    mov r0, #0
    pop {r4, r5, r6, r7, lr}
    bx lr @ return to the caller

label_input_1:
    mov r0, #1
    pop {r4, r5, r6, r7, lr}
    bx lr @ return to the caller

label_saved_value:
    mov r0, r2 @ save the value to the r0 fo return
    pop {r4, r5, r6, r7, lr}
    bx lr @ return to the caller

.equ led_control_adr, 0xff200000
@ --------------------------------------------
@ Test: Test the result of func_timer
@
@ Description:
@   test_1: led will light up for 1s
@   test_2: led will light up for 2s
@   test_3: led will light up for 5s
@
@ --------------------------------------------
test_func_timer_1:
    push {r4, r5, r6, r7, lr}
    @ set led light
    ldr r4, =led_control_adr
    mov r5, #1
    str r5, [r4]

    ldr r1, =timer_1s
    ldr r0, [r1]
    bl func_timer

    @ clear led light
    ldr r4, =led_control_adr
    mov r5, #0
    str r5, [r4]

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

test_func_timer_2:
    push {r4, r5, r6, r7, lr}
    @ set led light
    ldr r4, =led_control_adr
    mov r5, #1
    str r5, [r4]

    ldr r1, =timer_2s
    ldr r0, [r1]
    bl func_timer

    @ clear led light
    ldr r4, =led_control_adr
    mov r5, #0
    str r5, [r4]

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

test_func_timer_3:
    push {r4, r5, r6, r7, lr}
    @ set led light
    ldr r4, =led_control_adr
    mov r5, #1
    str r5, [r4]

    ldr r1, =timer_5s
    ldr r0, [r1]
    bl func_timer

    @ clear led light
    ldr r4, =led_control_adr
    mov r5, #0
    str r5, [r4]

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

.equ internal_timer_status_adr, 0xff202000
.equ internal_timer_control_adr, 0xff202004
.equ internal_timer_counter_start_low_adr, 0xff202008
.equ internal_timer_counter_start_high_adr, 0xff20200c
.equ internal_timer_counter_snapshot_low_adr, 0xff202010
.equ internal_timer_counter_snapshot_high_adr, 0xff202014
.equ internal_timer_control_mode_non_con, 0b0100
.equ internal_timer_control_mode_con, 0b0110
.equ internal_timer_control_mode_clear, 0b0000
@ --------------------------------------------
@ Function: func_timer
@
@ Description:
@   This function accepts time intervals and set up timer
@   with the specific time intervals
@
@ Inputs:
@   R0 - Input time intervals (100M-Hz)
@
@ Outputs:
@   none
@
@ Note:
@   This subroutine will return to it caller when it finished counting
@
@--------------------------------------------
func_timer:
    push {r4, r5, r6, r7, lr}

    @ initialize the timer count
    push {r0} @ save the r0 value
    ldr r4, =internal_timer_counter_start_low_adr
    str r0, [r4]
    lsr r0, #16 @ get the higher 16-bit
    ldr r4, =internal_timer_counter_start_high_adr
    str r0, [r4]
    pop {r0} @ restore the value of the r0 register

    @ initialize the control bit for the timer
    push {r2}
    ldr r4, =internal_timer_control_adr
    mov r2, #internal_timer_control_mode_non_con
    str r2, [r4]
    pop {r2}

wait_loop:
    @ using current count to control loop
    ldr r4, =internal_timer_counter_snapshot_low_adr
    str r1, [r4] @ write junk to register
    ldr r2, [r4]
    ldr r4, =internal_timer_counter_snapshot_high_adr
    ldr r3, [r4]
    add r2, r3, lsl #16

    cmp r2, #0
    bne wait_loop

    @ clear the control bit
    ldr r4, =internal_timer_control_adr
    mov r2, #internal_timer_control_mode_clear
    str r2, [r4]

    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

@ --------------------------------------------
@ Test: Test the result of func_number_display
@
@ Description:
@   test_1: 0x3210
@   test_2: 0x7654
@   test_3: 0xba98
@   test_4: 0xfedc
@   test_5: 0x543210
@   test_6: 0x04d2=1234
@   test_7: 0x162E=5678
@   test_8: 0x0=000000
@   test_9: 0x1e240=123456
@   test_10: 0x423f=999999
@
@ --------------------------------------------
test_func_number_display_1:
    push {lr}
    ldr r0, =0x3210
    ldr r1, =0x0
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_2:
    push {lr}
    ldr r0, =0x7654
    ldr r1, =0x0
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_3:
    push {lr}
    ldr r0, =0xba98
    ldr r1, =0x0
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_4:
    push {lr}
    ldr r0, =0xfedc
    ldr r1, =0x0
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_5:
    push {lr}
    ldr r0, =0x543210
    ldr r1, =0x0
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_6:
    push {lr}
    ldr r0, =0x04d2
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_7:
    push {lr}
    ldr r0, =0x162e
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_8:
    push {lr}
    ldr r0, =0x0
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_9:
    push {lr}
    ldr r0, =0x1e240
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_10:
    push {lr}
    ldr r0, =0x423f
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller


/* Address macro for 7-segment display registers word write only */
.equ L_display, 0xff200020 @Lower 4 digits address
.equ H_display, 0xff200030 @ Higher 2 digits address only 16-bit used
.equ mask_control_bit, 0x00000001 @ bit-0 "1" for decimal format
.equ mask_display_digits, 0x00ffffff @ mask the 6 digits
.equ mask_lower_16bits, 0x0000ffff @ mask the lower 4 digits
.equ mask_higher_8bits, 0x00ff0000 @ mask the higher 2 digits
@ --------------------------------------------
@ Function: func_number_display
@
@ Description:
@   This function display the number accepts on the 7-segment
@   displays
@
@ Inputs:
@   R0 - input hex value to be displayed
@   R1 - control bit of whether displyed in hex or decimal
@
@ Outputs:
@   none, number will be displayed
@
@ Note:
@   The control module will control the input limit
@   in case it overflows
@--------------------------------------------
func_number_display:
    push {r4, r5, r6, r7, lr}
    and r2, r1, #mask_control_bit
    cmp r2, #mask_control_bit
    /* we only has 6 7-segment displays */
    and r0, r0, #mask_display_digits
    bne label_hex_display

label_decimal_display:
    bl func_convert_decimal @ convert to special format for later display
    mov r0, r1

label_hex_display:
    /* calculate the lower 4 digits */
    ldr r6, =mask_lower_16bits
    and r1, r0, r6

    push {r0}

    push {r1}
    and r0, r1, #mask_lower_4bits
    bl  func_convert_seven_segment_byte
    mov r5, r1
    ror r5, #8 @rotate right 8 bits
    pop {r1}
    lsr r1, #4

    push {r1}
    and r0, r1, #mask_lower_4bits
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    pop {r1}
    lsr r1, #4

    push {r1}
    and r0, r1, #mask_lower_4bits
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    pop {r1}
    lsr r1, #4

    push {r1}
    and r0, r1, #mask_lower_4bits
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    pop {r1}
    lsr r1, #4

    pop {r0}

    /* calculate the higher 2 digits */
    and r1, r0, #mask_higher_8bits @ get the lower 16-bit
    lsr r1, #16

    push {r1}
    and r0, r1, #mask_lower_4bits
    bl  func_convert_seven_segment_byte
    mov r6, r1
    ror r6, #8 @rotate right 8 bits
    pop {r1}
    lsr r1, #4

    push {r1}
    and r0, r1, #mask_lower_4bits
    bl  func_convert_seven_segment_byte
    add r6, r1
    ror r6, #8 @rotate right 8 bits
    pop {r1}
    lsr r1, #4

    ror r6, #8 @rotate right 8 bits
    ror r6, #8 @rotate right 8 bits

    /* display */
    ldr r4, =L_display
    str r5, [r4]
    ldr r4, =H_display
    str r6, [r4]

    b label_exit_display

label_exit_display:
    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

.equ magic_number_divisor, 0xcccccccd @ (2^32)/10+1
@ --------------------------------------------
@ Function: func_convert_decimal
@
@ Description:
@   This function convert a input hex to special structure 
@   decimal digits, every 4-bit represent 1 decimal digit
@
@ Inputs:
@   R0 - input hex value to be converted
@
@ Outputs:
@   R1 - converted special decimal value
@
@--------------------------------------------
func_convert_decimal:
    push {r4, r5, r6, r7, r8, lr}
    ldr r4, =magic_number_divisor
    ldr r8, =0x8 @ loop control
    ldr r3, =10
    ldr r1, =0x0 @ clear the register r1

label_keep_convesion:
    @ udiv r5, r0, r4 @ r5 = r0/r4 not supported !
    umull r2, r5, r0, r4 @ low 32-bit in r2, high 32-bit in r5
    lsr r5, r5, #3

    mul r7, r5, r3
    sub r6, r0, r7 @ r0/r4 =r5 ... r6 (reminder)
    mov r0, r5 @ update the value

    add r1, r6
    ror r1, #4
    sub r8, #1
    cmp r8, #0
    bne label_keep_convesion

    pop {r4, r5, r6, r7, r8, lr}
    bx lr  @ return to the caller

@ --------------------------------------------
@ Test: Test the result of func_convert_decimal
@
@ Description:
@   test_1: 0x04d2=1234
@   test_2: 0x162e=5678
@   test_3: 0x0=000000
@   test_4: 0x1e240=123456
@   test_5: 0x423f=999999
@
@ --------------------------------------------
test_func_conver_decimal_1:
    push {lr}
    ldr r0, =0x04d2
    bl func_convert_decimal

    pop {lr}
    bx lr  @ return to the caller

test_func_conver_decimal_2:
    push {lr}
    ldr r0, =0x162e
    bl func_convert_decimal

    pop {lr}
    bx lr  @ return to the caller

test_func_conver_decimal_3:
    push {lr}
    ldr r0, =0x00
    bl func_convert_decimal

    pop {lr}
    bx lr  @ return to the caller

test_func_conver_decimal_4:
    push {lr}
    ldr r0, =0x1e240
    bl func_convert_decimal

    pop {lr}
    bx lr  @ return to the caller

test_func_conver_decimal_5:
    push {lr}
    ldr r0, =0x423f
    bl func_convert_decimal

    pop {lr}
    bx lr  @ return to the caller

/* map of digit to 7-segment byte representation */
.equ d_0, 0b00111111
.equ d_1, 0b00000110
.equ d_2, 0b01011011
.equ d_3, 0b01001111
.equ d_4, 0b01100110
.equ d_5, 0b01101101
.equ d_6, 0b01111101
.equ d_7, 0b00000111
.equ d_8, 0b01111111
.equ d_9, 0b01100111
.equ d_a, 0b01110111
.equ d_b, 0b01111100
.equ d_c, 0b00111001
.equ d_d, 0b01011110
.equ d_e, 0b01111011
.equ d_f, 0b01110001

.equ mask_lower_4bits, 0b1111
@ --------------------------------------------
@ Function: func_convert_seven_segment_byte
@
@ Description:
@   This function write a switch case function in assembly
@   to map the value to its representation in 7-segment display
@   byte.
@
@ Inputs:
@   R0 - 4-bit of value to be mapped to byte 7-segment representation
@
@ Outputs:
@   R1 - the byte representation
@
@--------------------------------------------
func_convert_seven_segment_byte:
    push {lr}
    and r0, #mask_lower_4bits   @ mask the lower 4-bit

    cmp r0, #0   @ case_0
    beq case_0
    cmp r0, #1   @ case_1
    beq case_1
    cmp r0, #2   @ case_2
    beq case_2
    cmp r0, #3   @ case_3
    beq case_3
    cmp r0, #4   @ case_4
    beq case_4
    cmp r0, #5   @ case_5
    beq case_5
    cmp r0, #6   @ case_6
    beq case_6
    cmp r0, #7   @ case_7
    beq case_7
    cmp r0, #8   @ case_8
    beq case_8
    cmp r0, #9   @ case_9
    beq case_9
    cmp r0, #0xa   @ case_a
    beq case_a
    cmp r0, #0xb   @ case_b
    beq case_b
    cmp r0, #0xc   @ case_c
    beq case_c
    cmp r0, #0xd   @ case_d
    beq case_d
    cmp r0, #0xe   @ case_e
    beq case_e
    cmp r0, #0xf   @ case_f
    beq case_f

default_case:
    ldr r1, =#0
    b end_switch

case_0:
    ldr r1, =d_0
    b end_switch
case_1:
    ldr r1, =d_1
    b end_switch
case_2:
    ldr r1, =d_2
    b end_switch
case_3:
    ldr r1, =d_3
    b end_switch
case_4:
    ldr r1, =d_4
    b end_switch
case_5:
    ldr r1, =d_5
    b end_switch
case_6:
    ldr r1, =d_6
    b end_switch
case_7:
    ldr r1, =d_7
    b end_switch
case_8:
    ldr r1, =d_8
    b end_switch
case_9:
    ldr r1, =d_9
    b end_switch
case_a:
    ldr r1, =d_a
    b end_switch
case_b:
    ldr r1, =d_b
    b end_switch
case_c:
    ldr r1, =d_c
    b end_switch
case_d:
    ldr r1, =d_d
    b end_switch
case_e:
    ldr r1, =d_e
    b end_switch
case_f:
    ldr r1, =d_f
    b end_switch

end_switch:
    pop {lr}
    bx lr  @ return to the caller

@ --------------------------------------------
@ Test: Test the result of func_convert_seven_segment_byte
@
@ Description:
@   test_1: 0x3210
@   test_2: 0x7654
@   test_3: 0xba98
@   test_4: 0xfedc
@   test_5: 0x543210
@
@ --------------------------------------------
test_func_convert_seven_segment_byte_1:
    push {lr}
    ldr r4, =L_display

    ldr r0, =0x0
    bl  func_convert_seven_segment_byte
    mov r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x1
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x2
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x3
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits to restore state
    str r5, [r4]

    pop {lr}
    bx lr  @ return to the caller

test_func_convert_seven_segment_byte_2:
    push {lr}
    ldr r4, =L_display

    ldr r0, =0x4
    bl  func_convert_seven_segment_byte
    mov r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x5
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x6
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x7
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits to restore state
    str r5, [r4]

    pop {lr}
    bx lr  @ return to the caller

test_func_convert_seven_segment_byte_3:
    push {lr}
    ldr r4, =L_display

    ldr r0, =0x8
    bl  func_convert_seven_segment_byte
    mov r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x9
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0xa
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0xb
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits to restore state
    str r5, [r4]

    pop {lr}
    bx lr  @ return to the caller

test_func_convert_seven_segment_byte_4:
    push {lr}
    ldr r4, =L_display

    ldr r0, =0xc
    bl  func_convert_seven_segment_byte
    mov r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0xd
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0xe
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0xf
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits to restore state
    str r5, [r4]

    pop {lr}
    bx lr  @ return to the caller

test_func_convert_seven_segment_byte_5:
    push {lr}
    ldr r4, =L_display

    ldr r0, =0x0
    bl  func_convert_seven_segment_byte
    mov r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x1
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x2
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x3
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits to restore state
    str r5, [r4]

    ldr r4, =H_display
    ldr r0, =0x4
    bl  func_convert_seven_segment_byte
    mov r5, r1
    ror r5, #8 @rotate right 8 bits
    ldr r0, =0x5
    bl  func_convert_seven_segment_byte
    add r5, r1
    ror r5, #8 @rotate right 8 bits
    ror r5, #8 @rotate right 8 bits
    ror r5, #8 @rotate right 8 bits to restore state
    str r5, [r4]

    pop {lr}
    bx lr  @ return to the caller
