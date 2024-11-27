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

This package is activated/deactivated with a global variable `power_meter_activated`. By default a power meter is deactivated at start. The activation switch determines if power meter has to be started or not. 

If this power meter is use inside a proxy it is required to activated in at start by setting `power_meter_activated_at_start` to `1` into you configuration yaml as in the example bellow:

```yaml linenums="1"
substitutions:
  power_meter_activated_at_start: "1"
```

!!! warning "Network dependency"
    This power meter require the network to gather information about energy exchanged with the grid.
