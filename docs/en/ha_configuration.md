# Home Assistant configuration

**Power meters** and **energy sensors** are updated every secondes. 
By default, Home Assistant *recorder* is saving these informations in its database.  
To optimize data storage in Home Assistant, it's essential to configure databases appropriately.

* First **Identify the Target Sensor to filter out**  
  Power meter provides a sensor named `real_power`.  
  Energy counter provides a sensor named `theorical_energy_diverted`.  
  In your Home Assistant it should be prefixed with the name of your device and should then be identified with an id like `sensor.solarrouter_real_power` or `sensor.solarrouter_theorical_energy_diverted`.  
  Check your sensors to adapt the configuration.

* Then **Create a `recorder` configuration for Home Assistant**  
  Add the following lines in your `configuration.yaml` to filter out `real_power` and `theorical_energy_diverted` data:  

    ```yaml
    recorder:
      exclude:
        entities:
          - sensor.solarrouter_real_power
          - sensor.solarrouter_theorical_energy_diverted
    ```
!!! note "About recorder"
    Home Assistant `recorder` is constantly saves data in database. Refer to [recorder configuration](https://www.home-assistant.io/integrations/recorder/) for details.  
    **It is strongly advised to have a look to data produced by your solar router and adapt your configuration according to your needs.**


!!! warning "If you are using InfluxDB"
    If you are using InfluxDB, you should pay the same attention about data recording.  
    Refer to the [integration documentation](https://www.home-assistant.io/integrations/influxdb/) to exclude `real_power` and `theorical_energy_diverted` from your database.


