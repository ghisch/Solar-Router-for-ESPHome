# Home Assistant Power Meter

This power meter is designed get power consumption directly from Home Assistant sensor.

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  power_meter:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/power_meter_home_assistant.yaml
```

This package needs to know the sensor to use to get the power consumption. It is expected for this sensor to be in Watt (W), to be positive (>0) when electricity is used from the grid and negative (<0) when electricity is sent to the grid. This sensor has to be defined by `main_power_sensor` into `subtsitutions` section of your configuration as in example ballow:

```yaml linenums="1"
substitutions:
  # Power meter source -----------------------------------------------------------
  # Sensor in home assistant gathering the power consumption
  main_power_sensor: sensor.main_power
```
!!! warning "Data availability and refresh rate"
    This power meter rely on Home Assistant to gather the value of energy exchanged with the grid. It also depends on the rate of sensor update. If a sensor is updated too slowly, the regulation may not work as expected.

    Contrary to Home Assistant power meter, native power meters are autonomous and can continue to regulate even is Home Assistant is offline. Some power meter can have a direct access to the measure and may even be independent to the network.
