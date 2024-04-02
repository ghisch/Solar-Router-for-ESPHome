# Hardware

The hardware used for development is the one proposed by [F1ATB.fr](https://f1atb.fr/fr/routeur-photovoltaique-realisation-materielle/) ![fr](images/france.png).

Here is the schematic of a solar router with a minimal number of component.


![hardware connection](images/hardware.drawio.png)

Bill of material:

* 1 x ESP32-dev board (Wroom-32U with external antenna)
* 1 x Green LED
* 1 x Yellow LED
* 1 x Triac from RobotDyn 24A
* 2 x resistor 470 Ohms for LEDs

On the photo bellow, as the heat dissipator provided by RobotDyn is under dimensionned, the triac has been unsoldered from the board and screwed into a big heat dissipator. Wires have been added to link the triac into the board.

In addition a 12V power supply is used in addition with a buck converter to power the system. The 12V may be used to power a fan in an event of an over heating.

![SolarRouteOpen](images/SolarRouterOpen.png)
![SolarRouteClose](images/SolarRouterClosed.png)

The router has been built to be connected to a frost protection system and then provide standard electricals sockets.