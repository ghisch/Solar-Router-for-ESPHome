# Proxy Client Power Meter

A **proxy client** is designed to get the power meter values from an other component. This component could be a dedicated device such as an ESP8266 running only one power meter package (See [proxy architecture](firmware.md#power-meter-proxy-configuration)) or it can be another solar router runing a power meter reading the real power exchanged with the grid (See [multiple solar router architecture](firmware.md#multiple-solar-router-configuration)).

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  power_meter:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/power_meter_proxy.yaml
```

This integration needs to know the IP address of the power meter proxy. This IP address has to be defined into `power_meter_ip_address` into `subtsitutions` section of your configuration as in example bellow:

```yaml linenums="1"
substitutions:
  # Power meter source -----------------------------------------------------------
  # Define ip address of Fronius inverter
  power_meter_ip_address: "192.168.1.21"
```

This integration is activated/deactivated with a global variable `power_meter_activated`. This variable can be modified by a switch inside Home Assistant.

!!! warning "Network dependency"
    This power meter require the network to gather information about energy exchanged with the grid.
