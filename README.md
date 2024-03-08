# Sensor_Network_and_Embedded_Systems

This repository is for Code for Sensor Network&Embedded Systems course.

The code is tested on a online simulator: https://cpulator.01xz.net/?sys=arm-de1soc

## Lab1

### Objective

This lab is about programming an ARM®Cortex-A9 on a DE1 SoC board in the ARMv7 assembly language. For
this lab, you can use an online simulator to test your code.
• The simulator is available at https://cpulator.01xz.net/?sys=arm-de1soc.
◦ This simulator runs in your browser and should work with any computer system.
◦ This simulator is not recommended for tablets, but might still work.
◦ This simulator is reported to run best in Firefox. If the emulator doesn’t seem to work well in your
browser of choice (Safari, Edge, Chrome, etc.), try Firefox first before complaining to me.
• Alternatively, if you have (or are willing to purchase) an actual ARM®Cortex-A9 and a suitable develop-
ment board, then by all means do so! Please take some pictures to include with your report.
The goal of this lab is to implement the following system:
Write the first 10 Fibonacci numbers to a seven segment display. Show each number on the dis-
play for one second (1 s) before showing the next. Your program should endlessly loop, cycling
through displaying these 10 numbers.
The Fibonacci numbers are defined as F n :
F 0 = 0, F 1 = 1, and F n = F n−1 + F n−2 for n > 1.

## Lab2

### Objective

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

