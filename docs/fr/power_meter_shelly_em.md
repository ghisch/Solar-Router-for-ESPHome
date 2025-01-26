# Power meter Shelly EM

Ce *power meter* est conçu pour obtenir la consommation d'énergie directement à partir du capteur Shelly EM.

Pour utiliser ce package, ajoutez les lignes suivantes à votre fichier de configuration :

```yaml linenums="1"
packages:
  power_meter:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/power_meter_shelly_em.yaml
```

Ce package doit connaître l'adresse IP du Shelly EM et l'index de l'emeter à utiliser pour obtenir la consommation d'énergie. L'adresse IP du Shelly EM et l'index de l'emeter doivent être définis par `power_meter_ip_address` et `emeter_index` dans la section `substitutions` de votre configuration, comme dans l'exemple ci-dessous :

```yaml linenums="1"
substitutions:
  # Power meter source -----------------------------------------------------------
  # Define ip address of Shelly EM probe
  power_meter_ip_address: "192.168.1.26:8000"
  emeter_index: "0"
```

!!! note "En-tête d'authentification HTTP"
    Ce *power meter* permet de définir l'en-tête d'authentification HTTP avec la variable `power_meter_auth_header`.
    Cette varialbe peut être définie dans la section `substitution`.

Ce package est activé/désactivé avec une variable globale `power_meter_activated`. Par défaut, un *power meter* est désactivé au démarrage. L'interrupteur d'activation détermine si le *power meter* doit être démarré ou non.

Si ce *power meter* est utilisé à l'intérieur d'un proxy, il est nécessaire de l'activer au démarrage en définissant `power_meter_activated_at_start` à `1` dans votre fichier de configuration yaml, comme dans l'exemple ci-dessous :

```yaml linenums="1"
substitutions:
  power_meter_activated_at_start: "1"
```

!!! warning "Dépendance réseau"
    Ce *power meter* nécessite le réseau pour recueillir des informations sur l'énergie échangée avec le réseau électrique.

