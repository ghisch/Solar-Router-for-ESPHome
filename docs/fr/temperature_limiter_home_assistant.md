# Limiteur de température Home Assistant

Ce package est conçu pour surveiller une température provenant d'un capteur dans Home Assistant et déterminer si un seuil de température a été atteint ou non.

Lorsque la limite de sécurité est atteinte, il est possible d'allumer une LED. La configuration de la LED doit être ajoutée dans la section `substitutions` comme expliqué ci-dessous.

!!! danger "AVERTISSEMENT : Effectuez des tests avant de laisser le système réguler seul"
    Cette surveillance de limite de température et la limite de sécurité peuvent comporter des bugs. Il est fortement conseillé de valider soigneusement le comportement de votre système avant de le laisser fonctionner de manière autonome.

Pour utiliser ce package, ajoutez les lignes suivantes à votre fichier de configuration :

```yaml linenums="1"
packages:
  temperature_limiter:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/temperature_limiter_home_assistant.yaml
```

Ce package doit connaître le capteur à utiliser pour obtenir la température à surveiller. Ce capteur doit être défini par `temperature_sensor` dans la section `substitutions` de votre configuration, comme dans l'exemple ci-dessous :

```yaml linenums="1"
substitutions:
  # Sensor in home assistant gathering the temperature
  temperature_sensor: sensor.hot_water_temperature
 # Safety limit LED configuration
  red_led_inverted: "False"
  red_led_pin: GPIO4
```

!!! warning "Disponibilité des données et taux de rafraîchissement"
    Ce limiteur de température dépend de Home Assistant pour récupérer la température. Il dépend également du taux de mise à jour du capteur. Si un capteur est mis à jour trop lentement, la régulation peut ne pas fonctionner comme prévu.

