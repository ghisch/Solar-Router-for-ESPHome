# Power Meter

A power meter is designed to gather the power exchanged with the grid.  
Based on the value, the solar router engine will define the amount of energy to divert to minimise energy sent to the grid.

**Solar Router for ESPHome** provide different kind of power meters. 

* **[Home Assistant power meter](power_meter_home_assistant.md)** can get every Home Assistant sensor as source but may have a refreshing rate slower than native power meters.
* **Native power meter** directly get information from the probe and have a faster refreshing rate. Some power can also have the advantage to not depend network (ethernet or WiFi).

## Use power meter as a proxy

Every power meter can be used as a proxy. A proxy is can be placed near the measurment probe and deliver its measurment to other solar router over the network.

See [proxy example](proxy_example.md) to see how to implement it.

!!! important "ESP8266 and ESP8285"
    ESP8266 and ESP8285 has few memory but can be used a proxy if ssl support is disabled in `http_request`.

    ```yaml linenums="1"
    http_request:
      esp8266_disable_ssl_support: True
    ```
    See [HTTP Request component](https://esphome.io/components/http_request.html#esp8266-disable-ssl-support) for details