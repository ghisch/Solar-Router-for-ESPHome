# Fronius Power Meter

This power meter is designed to work with [Fronius Smart Meter](https://www.fronius.com/en-gb/uk/solar-energy/installers-partners/technical-data/all-products/system-monitoring/hardware/fronius-smart-meter/fronius-smart-meter-ts-100a-1) in conjunction with a [Fronius Inverter](https://www.fronius.com/en-gb/uk/solar-energy/installers-partners/technical-data/all-products/inverters/fronius-primo-gen24/fronius-primo-gen24-3-0).

Fronius is providing an *Open Inteface* named [Fronius Solar API](https://www.fronius.com/en-gb/uk/solar-energy/installers-partners/technical-data/all-products/system-monitoring/open-interfaces/fronius-solar-api-json-) which is allowing the quiery the inverter and **locally** get data.

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  power_meter:
    url: http://github.com/XavierBerger/ESPHome-Solar-Router/
    file: solar_router/power_meter_fronius.yaml
```

This package needs to know the IP address of the inverter. This IP address has to be defined by `power_meter_ip_address` into `subtsitution` section of your configuration as in example ballow:

```yaml linenums="1"
substitutions:
  # Power meter source -----------------------------------------------------------
  # Define ip address of Fronius inverter
  power_meter_ip_address: "192.168.1.21"
```

This package is activated/deactivated with a global variable `power_meter_activated`. This `globals` is provided by the [solar router engine](engine.md) package. If this power meter is use inside a proxy, it is required to add this `globals` into you configuration yaml as follow:

```yaml linenums="1"
globals:
  - id: power_meter_activated
    type: int
    initial_value: "1"
```

See [proxy example](proxy_example.md) to see how to implement it.


!!! important "ESP8266 and ESP8285"
    ESP8266 and ESP8285 has few memory but can be used a proxy if ssl support is disabled in `http_request`.

    ```yaml linenums="1"
    http_request:
      esp8266_disable_ssl_support: True
    ```
    See [HTTP Request component](https://esphome.io/components/http_request.html#esp8266-disable-ssl-support) for details