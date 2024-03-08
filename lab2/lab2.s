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
    bl test_func_number_display_1
    bl test_func_number_display_2
    bl test_func_number_display_3
    bl test_func_number_display_4
    bl test_func_number_display_5
    bl test_func_number_display_6
    bl test_func_number_display_7
    bl test_func_number_display_8
    bl test_func_number_display_9
    bl test_func_number_display_10
    bl test_func_number_display_11
    bl test_func_number_display_12
    bl test_func_number_display_13
    bl test_func_number_display_14
    bl test_func_number_display_15

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
@   test_10: 0xf423f=999999
@   test_11: 0x9=9
@   test_12: 0xa=10
@   test_13: 0x63=99
@   test_14: 0x64=100
@   test_14: 0x3e7=999
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
    ldr r0, =0xf423f
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_11:
    push {lr}
    ldr r0, =0x9
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_12:
    push {lr}
    ldr r0, =0xa
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_13:
    push {lr}
    ldr r0, =0x63
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_14:
    push {lr}
    ldr r0, =0x64
    ldr r1, =0x1
    bl func_number_display

    pop {lr}
    bx lr  @ return to the caller

test_func_number_display_15:
    push {lr}
    ldr r0, =0x3e7
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
    cmp r0, #0 @ if the input is 0?
    beq label_display_one_zero
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
    mov r6, #0 @ bit to be left shifted
    mov r5, #0 @ result

label_convert_low_digits:
    push {r1}
    cmp r1, #0 @ whether the remaining is '0'
    beq label_exit_low_digits

    and r1, r1, #mask_lower_4bits
    mov r0, r1
    bl  func_convert_seven_segment_byte

    mov r2, r6
label_left_shift_low:
    cmp r2, #0
    beq label_left_shift_low_exit
    lsl r1, #8 @ shift left 8 bit a time, controled by value in r0
    subs r2, #1
    b label_left_shift_low

label_left_shift_low_exit:
    add r5, r1

    pop {r1}
    lsr r1, #4
    add r6, #1
    b label_convert_low_digits

label_exit_low_digits:
    pop {r1}
    pop {r0}
    push {r5} @ save the r5 value to stack

    /* calculate the higher 2 digits */
    and r1, r0, #mask_higher_8bits @ get the lower 16-bit
    lsr r1, #16

    mov r6, #0 @ bit to be left shifted
    mov r5, #0 @ result
label_convert_high_digits:
    push {r1}
    cmp r1, #0 @ whether the remaining is '0'
    beq label_exit_high_digits

    and r1, r1, #mask_lower_4bits
    mov r0, r1
    bl  func_convert_seven_segment_byte

    mov r2, r6
label_left_shift_high:
    cmp r2, #0
    beq label_left_shift_high_exit
    lsl r1, #8 @ shift left 8 bit a time, controled by value in r0
    subs r2, #1
    b label_left_shift_high

label_left_shift_high_exit:
    add r5, r1

    pop {r1}
    lsr r1, #4
    add r6, #1
    b label_convert_high_digits

label_exit_high_digits:
    pop {r1}

    /* display */
    ldr r4, =H_display
    str r5, [r4]
    ldr r4, =L_display
    pop {r5}
    str r5, [r4]

    b label_exit_display

label_exit_display:
    pop {r4, r5, r6, r7, lr}
    bx lr  @ return to the caller

label_display_one_zero:
    /* display */
    mov r5, #0
    ldr r4, =H_display
    str r5, [r4]

    mov r0, #0
    bl  func_convert_seven_segment_byte
    ldr r4, =L_display
    str r1, [r4]

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
