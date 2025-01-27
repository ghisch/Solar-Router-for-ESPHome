# Regulator with 3 Channels Relay

This package implements the hardware interface for controlling three relays, with the third relay being connected to a regulator (TRIAC) for variable power control (for Engine 3 channels with bypass)

## Configuration

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  regulator:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/regulator_relay_3_channels.yaml
```

When this package is used it is required to define the following parameters in the `substitution` section as shown in the example below:

```yaml linenums="1"
substitutions:
  # Relay pins ----------------------------------------------------------------
  relay_1_pin: GPIO16  # First relay pin
  relay_2_pin: GPIO17  # Second relay pin
  relay_3_pin: GPIO18  # Third relay pin (with regulator)
```