# Three-Digit counter

## Objective

This lab is about programming an ARM®Cortex-A9 on a DE1 SoC board. For this lab, you can use an online
simulator to test your code.

* The simulator is available at https://cpulator.01xz.net/?sys=arm-de1soc.
  *  This simulator runs in your browser and should work with any computer system.
  * This simulator is not recommended for tablets, but might still work.
  * This simulator is reported to run best in Firefox. If the emulator doesn’t seem to work well in your
    browser of choice (Safari, Edge, Chrome, etc.), try Firefox first before complaining to me.
* Alternatively, if you have (or are willing to purchase) an actual ARM®Cortex-A9 and a suitable develop-
  ment board, then by all means do so! Please take some pictures to include with your report.

The goal of this lab is to implement the following system:

**Create a three-digit decimal counter that accurately counts 1 s intervals. The count should be displayed as a decimal number on the 7-segment display. An interrupt-enabled push button should be used to reverse the direction of the counter. The count should roll over to zero after reaching 999 (if counting up), or vice versa if counting down.**

Your program should run in a **continuous loop**.
You **must** use interrupts to handle the push button input. You may continue to use interrupts with the timer to
handle the 1 s counter, or poll the timer for the 1 s interval. You must use the timer to count for 1 s.

## System Design

For the previous `lab1`, I have already created a 7-segment display driver to display numbers either in hex or decimal format. So I can reuse that `number display` module, and make some modifications to it. After that I will develop a new timer module with interrupt enabled. Then I will add `ISR` for the switch which controls the counting direction of the counter. Finally, I will write a control module which runs a infinite loop and controls the logic of the behaviour of the counter.

### Steps

1. Port and modify the 7-segment display driver developed in `lab1`
2. Develop a new timer module runs on interrupt
3. Implement an `ISR` for the switch which will set the control bit in memory indicating the counting direction.
4. Finally, implement the control logic and doing the testing.

## Number Display Module

### Porting from `Lab1`

https://github.com/dcheng69/Sensor_Network_and_Embedded_Systems/commit/c423fe358e2bb88a8656d3ca9126c54d4945f1fe

From the above `github` link I import the `func_number_display` along with it's test cases `test_func_number_display_1` to ``test_func_number_display_10`

The new submission link is listed as below to branch `lab2`

https://github.com/dcheng69/Sensor_Network_and_Embedded_Systems/commit/cc0f0e7b07afc75a8a2a69d5544260ae858d8a02

### Modifications

https://github.com/dcheng69/Sensor_Network_and_Embedded_Systems/commit/82766b559518784e8dd6f74dcfc486517772ff2c

Although the `func_number_display` works well, there are still some modifications to be made to make it better fulfil the requirement of this assignment.

1. `func_number_display` display number using all six 7-segment displays, below is an example of what it means, the parameters passed to this function is `0x3210`.

![image-20240308160235664](../Documentation/res/image-20240308160235664.png)

2. This assignment indicated that to display from `0` to `999` in decimal format, the format is already supported, we only need to make some modifications to the `func_number_display` to let it ignore these prefix `0` to make it looks better.

![image-20240308183828364](../Documentation/res/image-20240308183828364.png)

**Analysis:**

The reason why it displayed all the digits is that I used `rotate` to traverse every `4-bit` of the input number, and set the corresponding value to the registers.

To solve this problem, I will need to change the control logic. Instead of using `rotate`, I will have to use shift to achieve this goal, while keep the fact in mind that input number `0` always need to be  considered with extra condition codes.

And the flow chart after modification is listed below: the red components is the modification to the original function design

![Number_Display.draw.io-Page-2.drawio](../Documentation/res/Number_Display.draw.io-Page-2.drawio.png)

### Test

Add `test11` to `test_14` specially for the functionality of counting from `0` to `999`

```asm
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
```

