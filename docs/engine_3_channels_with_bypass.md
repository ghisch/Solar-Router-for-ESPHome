# 3-Channels with Bypass Engine

This package implements the engine of the solar router which determines when and how much energy has to be diverted to three loads using three channels, or a single load with three channels like a water heater with three heating resistors, with the third channel having bypass functionality for maximum efficiency.

The engine uses three relays to control different loads, with the third relay having an additional regulator for fine-grained power control. The loads are activated sequentially as more power becomes available:

1. First channel: Relay 1 (On/Off control)
2. Second channel: Relay 2 (On/Off control)
3. Third channel: Relay 3 with regulator (Variable power control)

When power needs increase:
- First, the regulator on channel 3 gradually increases power
- When regulator reaches 33.33%, relay 1 activates
- When regulator reaches 66.66%, relay 2 activates
- When regulator reaches 100%, relay 3 activates and bypasses the regulator

**3-Channels with Bypass engine** calls every second the power meter to get the actual energy exchanged with the grid. If energy produced is greater than energy consumed and exceeds the defined exchange target, the engine will determine the appropriate combination of relays and regulator opening to reach the target.

Engine's automatic regulation can be activated or deactivated with the activation switch.

## How to wire the relay (Channel 1 & 2)

- Line on the Relay Common (COM)
- Normally Open (NO) of the Relay to the Load directly to the Load

## How to wire the bypass relay (Channel 3)

- Line on the Bypass Relay Common (COM)
- Normally Closed (NC) of the Relay to the Line Input of the Regulator
- Normally Open (NO) of the Relay to the Load Output of the Regulator (or directly to the Load)

This wiring ensures that:
- When relay 3 is on, the TRIAC doesn't receive energy (it's shortcutted by the relay)
- When relay 3 is off, only the TRIAC receives energy
- In case of energy outage, the "energy" is routed through the TRIAC, which should in theory be closed because of the lack of energy

## User feedback LEDS

The yellow LED is reflecting the network connection:

- ***OFF*** : solar router is not connected to power supply
- ***ON*** : solar router is connected to the network
- ***blink*** : solar router is not connected to the network and is trying to reconnect
- ***fast blink*** : An error occurs during the reading of energy exchanged with the grid

The green LED is reflecting the actual configuration of regulation:

- ***OFF*** : automatic regulation is deactivated
- ***ON*** : automatic regulation is active and is not diverting energy to any loads
- ***blink*** : solar router is currently sending energy to one or more loads

## Configuration

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  engine:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/engine_3_channels_with_bypass.yaml
```

This package requires the use of the Regulator Relay 3 Channels package AND a regulator package (TRIAC or SSR). Do not forget to also include them.

When this package is used it is required to define the following parameters in the `substitution` section as shown in the example below:

```yaml linenums="1"
substitutions:
  # LEDs -------------------------------------------------------------------------
  # Green LED is reflecting regulation status
  # Yellow LED is reflecting power meter status
  green_led_pin: GPIO19
  yellow_led_pin: GPIO18
```

!!! note "Power Distribution"
    The engine divides the total available power into three equal portions (33.33% each). This allows for smooth transitions between different power levels and efficient distribution of excess solar power across multiple loads. 