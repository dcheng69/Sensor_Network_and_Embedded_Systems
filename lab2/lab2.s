.data
timer_1s:   .word   100000000 @ 0x5F5E100
timer_2s:   .word   200000000
timer_5s:   .word   500000000
/* control variables for this program */
counter_val:        .word 0
counter_direction:   .word 0 @ 0 for couting up, 1 for counting down
counter_step_val:   .word 1 @ step value for couter to inc or dec after interval
.equ timer_control_var, timer_1s
.equ counter_threshold_inst_val, 999 @ counter threshold for counting

@ --------------------------------------------
@ Intialize the exception vector table
@ --------------------------------------------
.section .vectors, "ax"
    B   _start                  @ reset vector
    B   SERVICE_UND             @ undefined instruction vector
    B   SERVICE_SVC             @ software interrupt vector
    B   SERVICE_ABT_INST        @ aborted prefetch vector
    B   SERVICE_ABT_DATA        @ aborted data vector
    .word 0                     @ unused vector
    B   SERVICE_IRQ             @ IRQ interrupt vector
    B   SERVICE_FIQ             @ FIO interrupt vector


.equ IRQ_MODE_CPU_MASK, 0b11010010 @ CPU IRQ mode mask
.equ SVC_MODE_CPU_MASK, 0b11010011 @ CPU SVC mode mask
.equ IRQ_Stack_Start_ADR, 0xFFFFFFFF
.equ SVC_Stack_Start_ADR, 0x3FFFFFFF
.equ SVC_MODE_IRQ_E_CPU_MASK , 0b01010011

.text
.global _start
_start:
    /* Set up stack pointers for IRQ and SVC processor modes */
    mov r1, #IRQ_MODE_CPU_MASK
    msr CPSR_c, r1 @ change to IRQ mode
    ldr sp, =IRQ_Stack_Start_ADR - 3 @ set IRQ stack to A9 onchip memory

    /* Change to SVC supervisor mode with interrupts disabled*/
    mov r1, #SVC_MODE_CPU_MASK
    msr CPSR, r1
    ldr sp, =SVC_Stack_Start_ADR - 3 @ set SVC stack to the top of DDR3 memory

    bl Config_GIC
    bl Config_FPGA_Internal_Timer_Interrupt

    /* enable IRQ interrupts in the processor */
    mov r0, #SVC_MODE_IRQ_E_CPU_MASK
    msr CPSR_c, r0

    /* Display the Initial Counter Number */
    ldr r1, =counter_val
    ldr r0, [r1]
    ldr r1, =1 @ display in decimal format
    bl func_number_display

IDLE:
    b IDLE @ main program idles
    /* end of _start */

    /* Set up stack pointers for IRQ and SVC processor modes */
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
    @bl test_func_number_display_11
    @bl test_func_number_display_12
    @bl test_func_number_display_13
    @bl test_func_number_display_14
    @bl test_func_number_display_15
    /* Test case for FPGA_Internal_Timer_ISR */
    @bl test_FPGA_Internal_Timer_1
    @bl test_FPGA_Internal_Timer_2
    @bl test_FPGA_Internal_Timer_3
    @bl test_FPGA_Internal_Timer_4


.equ ICCIAR_ADR, 0xfffec10c @ address for Interrupt Acknowledge Register (ICCIAR)
.equ ICCEOIR_ADR, 0xfffec110 @ address for End of Interrupt Register (ICCEOIR)
.equ FPGA_INTERNAL_TIMER_IRQ_ID, 72 @ unique interrupt id for fpga internal timer
@ --------------------------------------------
@ Define the IRQ exception handlers here
@ --------------------------------------------
SERVICE_UND:
    B SERVICE_UND               @ pending until someone fix it
SERVICE_SVC:
    B SERVICE_SVC               @ we do not handle svc in this program
SERVICE_ABT_INST:
    B SERVICE_ABT_INST          @ we do not handle abort in this program
SERVICE_ABT_DATA:
    B SERVICE_ABT_DATA          @ we do not handle abort in this program
SERVICE_IRQ:
    push {r0-r7, lr}

    /* Read the ICCIAR from the CPU interface*/
    ldr r4, =ICCIAR_ADR
    ldr r5, [r4]

FPGA_Internal_Timer_CHECK:
    cmp r5, #FPGA_INTERNAL_TIMER_IRQ_ID
Unexpected:
    bne Unexpected @ if not Timer, then pending
    bl FPGA_Internal_Timer_ISR

Exit_IRQ:
    /* write to the end of ICCEOIR */
    ldr r4, =ICCEOIR_ADR
    str r5, [r4] @ write interrupt ID back to clear the state

    pop {r0-r7, lr}
    subs pc, lr, #4

SERVICE_FIQ:
    B SERVICE_FIQ               @ we do not handle FIQ in this program

.equ ICCPMR_ADR, 0xfffec104 @ address for Priority Mask Register (ICCPMR)
.equ Priority_Levels, 0xffff @ interrupts for all priorities levels
.equ ICCICR_ADR, 0xfffec100 @ address for CPU Interface Control Register (ICCICR)
.equ Enable_ICCICR_Bit, 0x1 @ Bit for Enable ICCICR
.equ ICDDCR_ADR, 0xfffed000 @ ICDDCR The Distributor Control Register
.equ Enable_ICDDCR_Bit, 0x1 @ Bit for Enable ICDDCR
@ --------------------------------------------
@ Function: Config_GIC
@
@ Description:
@   Config the Generic Interrupt Controller (GIC)
@
@ Note:
@   To configure the FPGA Inter Timer Interrupt ID 72
@   1. set the target to cpu0 in the ICDIPTRn register
@   2. enable the interrupt in the ICDISERn register
@--------------------------------------------
Config_GIC:
    push {lr}

    /* Config interrupt (int_ID (r0), CPU_Target (r1)) */
    mov r0, #FPGA_INTERNAL_TIMER_IRQ_ID
    mov r1, #1 @ bit-mask, bit 0 targets cpu0
    bl Config_Interrupt

    /* configure the GIC CPU Interface (ICCICR) */
    /* set interrupt priority mask register (ICCPMR) */
    ldr r0, =ICCPMR_ADR
    ldr r1, =Priority_Levels
    str r1, [r0]
    /* set enable bit in the CPU Interface Control Register (ICCICR) */
    ldr r0, =ICCICR_ADR
    ldr r1, =Enable_ICCICR_Bit
    str r1, [r0]

    /* set the enable bit in the ICDDCR */
    ldr r0, =ICDDCR_ADR
    ldr r1, =Enable_ICDDCR_Bit
    str r1, [r0]

    pop {pc}

.equ ICDISERn_ADR, 0xfffed100 @ ICDISERn address
.equ ICDIPTRn_ADR, 0xfffed800 @ ICDIPTRn address
@ --------------------------------------------
@ Function: Config_Interrupt
@
@ Description:
@   Config the Registers in the GIC for an individual Interrupt ID
@
@ Inputs:
@   R0 - Interrupt ID, N
@   R1 - CPU Target
@
@ Note:
@   To configure the FPGA Inter Timer Interrupt ID 72
@   1. Config ICDISERn
@   2. Config ICDIPTRn
@   3. Config defatult values used for other registers in the GIC
@--------------------------------------------
Config_Interrupt:
    push {r4-r5, lr}

    /* config interrupt set-enable registers (ICDISERn) */
    /*
    *   reg_offset = (N/32)*4
    *   value = 1 << (N mod 32)
    */
    lsr r4, r0, #3
    bic r4, r4, #3 @ r4 = reg_offset
    ldr r2, =ICDISERn_ADR
    add r4, r2, r4 @ r4 = address of ICDISER

    and r2, r0, #0x1f @ N mod 32
    mov r5, #1  @ enable
    lsl r2, r5, r2 @ r2 = value

    /*
    * set value in r2 to address in r4
    */
    ldr r3, [r4]
    orr r3, r3, r2
    str r3, [r4]

    /*
    * config Interrupt Processor Tragets Register (ICDIPTRn)
    *   reg_offset = (N/4)*4
    *   value = N mod 4
    */
    bic r4, r0, #3 @ r4 = reg_offset
    ldr r2, =ICDIPTRn_ADR
    add r4, r2, r4 @ r4 = word address of ICDIPTR
    and r2, r0, #0x3 @ r2 = N mod 4
    add r4, r2, r4 @ r4 = byte address in ICDIPTR

    /*
    * set input value in r1 to address in r4 by one byte
    */
    strb r1, [r4]

    pop {r4-r5, pc}

.equ internal_timer_control_adr, 0xff202004
.equ internal_timer_counter_start_low_adr, 0xff202008
.equ internal_timer_counter_start_high_adr, 0xff20200c
.equ internal_timer_control_mode_con_it, 0b0111
.equ internal_timer_control_mode_clear, 0b0000
@ --------------------------------------------
@ Function: Config_FPGA_Internal_Timer_Interrupt
@
@ Description:
@   Config the FPGA_Internal_Timer Interrupt and the time interval
@
@ Note:
@   1. set the time interval to be 1s
@
@--------------------------------------------
Config_FPGA_Internal_Timer_Interrupt:
    ldr r0, =timer_control_var
    ldr r1, [r0] @ time intervals

    ldr r0, =internal_timer_counter_start_low_adr
    str r1, [r0]

    lsr r1, r1, #16
    ldr r0, =internal_timer_counter_start_high_adr
    str r1, [r0]

    /* start the internal timer enable its interrupts */
    mov r1, #internal_timer_control_mode_con_it
    ldr r0, =internal_timer_control_adr
    str r1, [r0]

    bx lr



@ --------------------------------------------
@ Test: Test the ISR of fpga_internal_Timer
@
@ Description:
@   test_1: counting from 998 up to test wrap around with step 1
@   test_2: counting from 1 down to test wrap around with step 1
@   test_3: counting from 998 up to test wrap around with step 3
@   test_4: counting from 1 down to test wrap around with step 3
@
@ --------------------------------------------
test_FPGA_Internal_Timer_1:
    push {r4-r7, lr}

    /* set up the step val */
    ldr r7, =counter_step_val
    ldr r4, [r7]
    ldr r4, =1 @ step val 1
    str r4, [r7]

    /* set up the direction */
    ldr r7, =counter_direction
    ldr r4, [r7]
    ldr r4, =0 @ 0 for counting up
    str r4, [r7]

    /* set up the start point of counting */
    ldr r7, =counter_val
    ldr r4, [r7]
    ldr r4, =998
    str r4, [r7]

    /* manually trigger ISR for 3 times*/
    bl FPGA_Internal_Timer_ISR @ 999
    bl FPGA_Internal_Timer_ISR @ 0
    bl FPGA_Internal_Timer_ISR @ 1

    pop {r4-r7, lr}
    bx lr

test_FPGA_Internal_Timer_2:
    push {r4-r7, lr}

    /* set up the step val */
    ldr r7, =counter_step_val
    ldr r4, [r7]
    ldr r4, =1 @ step val 1
    str r4, [r7]

    /* set up the direction */
    ldr r7, =counter_direction
    ldr r4, [r7]
    ldr r4, =1 @ 1 for counting down
    str r4, [r7]

    /* set up the start point of counting */
    ldr r7, =counter_val
    ldr r4, [r7]
    ldr r4, =1
    str r4, [r7]

    /* manually trigger ISR for 3 times*/
    bl FPGA_Internal_Timer_ISR @ 0
    bl FPGA_Internal_Timer_ISR @ 999
    bl FPGA_Internal_Timer_ISR @ 998

    pop {r4-r7, lr}
    bx lr

test_FPGA_Internal_Timer_3:
    push {r4-r7, lr}

    /* set up the step val */
    ldr r7, =counter_step_val
    ldr r4, [r7]
    ldr r4, =3 @ step val 3
    str r4, [r7]

    /* set up the direction */
    ldr r7, =counter_direction
    ldr r4, [r7]
    ldr r4, =0 @ 0 for counting up
    str r4, [r7]

    /* set up the start point of counting */
    ldr r7, =counter_val
    ldr r4, [r7]
    ldr r4, =998
    str r4, [r7]

    /* manually trigger ISR for 3 times*/
    bl FPGA_Internal_Timer_ISR @ 1
    bl FPGA_Internal_Timer_ISR @ 4
    bl FPGA_Internal_Timer_ISR @ 7

    pop {r4-r7, lr}
    bx lr

test_FPGA_Internal_Timer_4:
    push {r4-r7, lr}

    /* set up the step val */
    ldr r7, =counter_step_val
    ldr r4, [r7]
    ldr r4, =3 @ step val 3
    str r4, [r7]

    /* set up the direction */
    ldr r7, =counter_direction
    ldr r4, [r7]
    ldr r4, =1 @ 1 for counting down
    str r4, [r7]

    /* set up the start point of counting */
    ldr r7, =counter_val
    ldr r4, [r7]
    ldr r4, =1
    str r4, [r7]

    /* manually trigger ISR for 3 times*/
    bl FPGA_Internal_Timer_ISR @ 998
    bl FPGA_Internal_Timer_ISR @ 995
    bl FPGA_Internal_Timer_ISR @ 992

    pop {r4-r7, lr}
    bx lr

.equ internal_timer_status_adr, 0xff202000
.equ counter_couting_up, 0x0
.equ counter_couting_down, 0x1
@ --------------------------------------------
@ Function: FPGA_Internal_Timer_ISR
@
@ Inputs:
@   memory: counter_val
@   memory: counter_direction
@   memory: counter_step_val
@   memory: counter_threshold_inst_val
@
@ Description:
@   ISR for FPGA_Internal_Timer, increase the number in memory
@   and then display
@
@ Note:
@   To test this ISR display a number on the Hex Display
@
@ --------------------------------------------
.global FPGA_Internal_Timer_ISR
FPGA_Internal_Timer_ISR:
    push {r4-r7, lr}
    ldr r1, =internal_timer_status_adr
    str r0, [r1] @ writing any value to status register to clear interrupt status

    /* read counter_val to r4 */
    ldr r7, =counter_val
    ldr r4, [r7]

    /* read counter_step_val to r5 */
    ldr r7, =counter_step_val
    ldr r5, [r7]

    /* read counter_direction to r6 */
    ldr r7, =counter_direction
    ldr r6, [r7]

    /* judging couting up or down */
    cmp r6, #counter_couting_up
    bne label_counting_down

label_counting_up:
    add r4, r5
    ldr r7, =counter_threshold_inst_val
    cmp r4, r7
    bgt label_overflow_reset
    b label_write_back_to_memory

label_counting_down:
    subs r4, r5
    bmi label_underflow_reset
    b label_write_back_to_memory

label_underflow_reset:
    ldr r7, =counter_step_val
    ldr r4, [r7]
    ldr r7, =counter_val
    ldr r6, [r7] @ load the val before sub
    sub r4, r4, r6 @ save the result to r4
    sub r4, #1 @ counting from '0'
    ldr r6, =counter_threshold_inst_val
    sub r4, r6, r4
    b label_write_back_to_memory

label_overflow_reset:
    ldr r6, =counter_threshold_inst_val
    subs r4, r4, r6
    sub r4, #1 @ counting from '0'
    b label_write_back_to_memory

label_write_back_to_memory:
    ldr r7, =counter_val
    str r4, [r7]

label_write_to_display:
    mov r0, r4
    ldr r1, =1 @ display in decimal format
    bl func_number_display

label_exit_fpga_timer_isr:
    pop {r4-r7, lr}
    bx lr

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
