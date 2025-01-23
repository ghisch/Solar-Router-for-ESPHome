# Routeur Solaire Autonome

Cette configuration du **Routeur Solaire** utilise le [compteur de puissance Fronius](power_meter_fronius.md), le [régulateur Triac](regulator_triac.md), et le [moteur variable](engine.md).

Les broches GPIO ont été définies pour correspondre à la configuration matérielle décrite [ici](hardware.md)

```yaml linenums="1"
--8<-- "esp32-standalone.yaml"
```