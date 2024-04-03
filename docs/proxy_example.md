# Solar Router using a proxy

The configuration of the **Proxy client** is only using a [Fronuis power meter](fronius.md)

```yaml linenums="1"
--8<-- "esp8285-power-meter-proxy.yaml"
```

This configuration the **Solar Router** is using [Proxy client power meter](proxy_client.md), [Triac regulator](triac.md) and [Solar router engine](engine.md).

GPIO pins have been defined to match hardware configuration described [here](hardware.md)

```yaml linenums="1"
--8<-- "esp32-proxy-client.yaml"
```