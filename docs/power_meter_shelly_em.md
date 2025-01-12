# Shelly EM Power Meter

This power meter is designed get power consumption directly from Shelly EM sensor.

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  power_meter:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/power_meter_shelly_em.yaml
```

This package needs to know Shelly EM IP address and emeter index to use to get the power consumption. This Shelly EM IP address and emeter index have to be defined by `power_meter_ip_address` and `emeter_index` into `substitutions` section of your configuration as in example ballow:

```yaml linenums="1"
substitutions:
  # Power meter source -----------------------------------------------------------
  # Define ip address of Shelly EM probe
  power_meter_ip_address: "192.168.1.26:8000"
  emeter_index: "0"
```

!!! note "HTTP Authentication Header"
    This power meter allow to define HTTP Authentication Header with the variable `power_meter_auth_header`.
    This variable can be set in `substitution` section.

This package is activated/deactivated with a global variable `power_meter_activated`. By default a power meter is deactivated at start. The activation switch determines if power meter has to be started or not. 

If this power meter is use inside a proxy it is required to activated in at start by setting `power_meter_activated_at_start` to `1` into you configuration yaml as in the example bellow:

```yaml linenums="1"
substitutions:
  power_meter_activated_at_start: "1"
```

!!! warning "Network dependency"
    This power meter require the network to gather information about energy exchanged with the grid.
