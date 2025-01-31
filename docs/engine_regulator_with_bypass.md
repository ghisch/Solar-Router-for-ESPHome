# Regulator with Bypass Engine

This package implements the engine of the solar router which determines when and how much energy has to be diverted to the load, with a bypass function for maximum efficiency.

When the regulator is intensively used for an extended period, the regulator will tends to overheat. This engine is designed to avoid this issue by activating a bypass relay and turning off the regulator when the regulator is opened at 100% for an extended period. To avoid flickering, the bypass relay is activated only when the regulator is opened at 100% for a number of consecutive regulation.

**Regulator with Bypass engine** calls every second the power meter to get the actual energy exchanged with the grid. If energy produced is greater than energy consumed and exceeds the defined exchange target, the engine will determine the **percentage of regulator opening** and adjusts it dynamically to reach the target. When the regulator reaches 100% for an extended period, the bypass relay is activated for maximum efficiency.

Engine's automatic regulation can be activated or deactivated with the activation switch.

## How to wire the bypass relay

- Live on the Bypass Relay Common (COM) and on the Relay to the Live Input of the Regulator
- Normally Closed (NC) floating
- Normally Open (NO) of the Relay to the Load Output of the Regulator (or directly to the Load)

!!! Danger "Follow the wiring instructions"
    Do not plug the Regulator Live Input to the Normally Closed (NC) of the relay ! Your load would be de-energized while switching the relay, potentially creating arcs inside the relay.
    More info in this [discussion](https://github.com/XavierBerger/Solar-Router-for-ESPHome/pull/51#issuecomment-2625724543).

## User feedback LEDS

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
  engine:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/engine_regulator_with_bypass.yaml
```

When this package is used it is required to define the following parameters in the `substitution` section as shown in the example below:

```yaml linenums="1"
substitutions:
  # LEDs -------------------------------------------------------------------------
  # Green LED is reflecting regulation status
  # Yellow LED is reflecting power meter status
  green_led_pin: GPIO19
  yellow_led_pin: GPIO18
  
  # Bypass parameters ----------------------------------------------------------
  bypass_timer_threshold: "30"  # Number of consecutive regulations at 100% before activating bypass
```

!!! tip "Adjusting bypass_timer_threshold"
    The `bypass_timer_threshold` determines how many consecutive regulations at 100% are needed before activating the bypass relay. A lower value will make the bypass more reactive but might cause more frequent switching (flickering). Because there's roughly 1 regulation per second, `bypass_timer_threshold` can be approximated as the time in second with the regulator at 100% before which the the bypass relay is activated.
