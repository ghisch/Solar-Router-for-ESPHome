# Proxy client

A **proxy client** is designed to get the power meter values from an other component. This component could be a dedicated device such as an ESP8266 running only one power meter package (See [proxy architecture](firmware.md#power-meter-proxy-configuration)) or it can be another solar router runing a power meter reading the real power exchanged with the grid (See [multiple solar router architecture](firmware.md#multiple-solar-router-configuration)).

To use this package, add the following lines to your configuration file:

```yaml
packages:
  power_meter:
    url: http://github.com/XavierBerger/ESPHome-Solar-Router/
    file: solar_router/power_meter_proxy.yaml
```

This integration needs to know the IP address of the power meter proxy. This IP address has to be defined into `power_meter_ip_address` into `subtsitution` section of your configuration as in example ballow:

```yaml
substitutions:
  # Power meter source -----------------------------------------------------------
  # Define ip address of Fronius inverter
  power_meter_ip_address: "192.168.1.21"
```

This integration is activated/deactivated with a global variable `power_meter_activated`. This `globals` is provided by the [solar router engine](engine.md) package. If this power meter is use inside a proxy, it is required to add this `globals` into you configuration yaml as follow:

```yaml
globals:
  - id: power_meter_activated
    type: int
    initial_value: "1"
```

See [proxy example](proxy_example.md) to see how to implement it.