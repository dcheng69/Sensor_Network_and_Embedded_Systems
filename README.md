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

## Lab3

### Objective

Evaluating the Performance of a pseudo-randomly generated graph，as an abstraction of a wireless sensor network. The nodes information are listed in the `lab3/nodes.txt` file. The Sensor Coverage and Communication Range plots are described below:

One thing to notice, the 25 nodes given are not fully connected!

```bash
# nodes
0.439, 0.299
0.187, 0.239
# Communication Range
√((0.299−0.239)^2 + (0.439−0.187)^2) = 0.259L
```

So in order to make the graph fully connected, one node need to added to connect two sub-nets.

![RGG_overview](./Documentation/res/RGG_overview.png)

## Lab4

### Objective

Design a wireless sensor network to track an animal population and monitor environmental conditions in a given habitat.

The sociology and biology departments of the Brantford University of Teaching & Technology (BUTT) would like to study the distribution and behaviour of a particularly strange breed of animal: undergraduate engineering students. They have noticed that these students tend to cluster in the gloomy basements of the Engineering building. 

### Requirements

The sociology and biology departments have commissioned you to design a WSN to monitor the area to help
collect the following data:

* Your WSN should provide humidity sensors over the region. (Undergraduate engineering students have notoriously poor personal hygiene. Is this because they are sensitive to moisture?)
* Your WSN should provide light sensors over the region. (Undergraduate engineering students are often nocturnal. Is this because they are sensitive to light?)
* Your WSN will attempt to roughly track population migration by having pressure sensors on the floor that are triggered when someone steps on them. (Where do the undergraduate engineering students congregate? Are they social or antisocial within their own habitat?)
* Your WSN needs to provide its own wireless communication. It cannot use BUTT’s campus WiFi network.
* Your WSN nodes can only use external power if that node is at an existing power outlet. You can’t run an
  extension cord or rewire the power grid.
* Only one of the WSN nodes can connect to wired ethernet 
* Only a node that is located at an existing Ethernet outlet can use the Ethernet. You can’t run an ethernet cable across the floor. One node must be connected this way in order to transmit the WSN data to the relevant researchers.
* The sociology/biology researchers have little to no funding. Your WSN design has a budget of **$3000** for hardware (deployment cost is free)
* Your network must be fully connected.
* Your network should provide as much coverage as possible, within the cost constraints.
* Your network should have as long an operating lifespan as possible, within the cost constraints.
