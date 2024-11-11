# Home Assistant configuration

**Power meters** are reading energy exchanged with the grid every secondes.  
By default, Home Assistant *recorder* is saving this information in its database.  
To optimize data storage in Home Assistant, it's essential to configure databases appropriately.

* First **Identify the Target Sensor**  
  Power meter provides a sensor names `real_power`.  
  In your Home Assistant it should be prefixed with the name of your device and should then be identified with an id like `sensor.solarrouter_real_power`.  
  Check you sensor to adapt the configuration.

* Then **Create a `recorder` configuration for Home Assistant**  
  Add the following lines in your `configuration.yaml` to filter out `real_power` data:  

    ```yaml
    recorder:
      exclude:
        entities:
          - sensor.solarrouter_real_power
    ```
!!! note "About recorder"
    Home Assistant `recorder` is constantly saves data in database. Refer to [recorder configuration](https://www.home-assistant.io/integrations/recorder/) for details.


!!! warning "If you are using InfluxDB"
    If you are using InfluxDB, you should pay the same attention about data recording.  
    Refer to the [integration documentation](https://www.home-assistant.io/integrations/influxdb/) to exclude `real_power` from your database.


