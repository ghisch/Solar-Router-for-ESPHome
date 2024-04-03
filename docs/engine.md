
# Solar Router Engine

This package is implementing the engine of the solar router which is determine when and how many energy has to be diverted to the load.

**Solar router engine** calls every second the power meter to get the actual power consumed.

If power is bellow the target it will then channel the excess of produced energy to the load with the regulator.

To do this divertion, it calculates the percentage of the regulator "opening" and adjust it dynamically to reach the target.

Solar router engine's automatic regulation can be activated or deactivated with the activation switch.

## User feedbak LEDS

The yellow LED is reflecting the network connection:

- ***OFF*** : solar router is not connected to power supply.
- ***ON*** : solar router is connected to the network.
- ***blink*** : solar router is not connected to the network and is trying to reconnect.
- ***fast blink*** : An error occurs during the reading of energy exchanged with the grid.


The green LED is reflecting the actual configuration of regulation:

- ***OFF*** : automatic regulation is deactivated.
- ***ON*** : automatic regulation is active and is not diverting energy to the load.
- ***blink*** : solar router is currently sending energy to the load.

## Configuration

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  power_meter:
    url: http://github.com/XavierBerger/ESPHome-Solar-Router/
    file: solar_router/solar_router_engine.yaml
```

When this package is used it is required to define the following paramater is `substitution` section as show in the example bellow:

```yaml linenums="1"
substitutions:
  # LEDs -------------------------------------------------------------------------
  # Green LED is reflecting regulation status
  # Yellow LED is reflecting power meter status
  green_led_pin: GPIO19
  yellow_led_pin: GPIO18
```