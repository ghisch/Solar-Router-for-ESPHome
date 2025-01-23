# Client proxy pour compteur électrique

Un **client proxy** est conçu pour obtenir les valeurs du compteur électrique à partir d'un autre composant. Ce composant peut être un appareil dédié tel qu'un ESP8266 exécutant uniquement un package de compteur électrique (Voir [architecture proxy](firmware.md#configuration-proxy-du-compteur-electrique)) ou il peut s'agir d'un autre routeur solaire exécutant un compteur électrique qui lit la puissance réelle échangée avec le réseau (Voir [architecture avec plusieurs routeurs solaires](firmware.md#configuration-avec-plusieurs-routeurs-solaires)).

Pour utiliser ce package, ajoutez les lignes suivantes à votre fichier de configuration :

```yaml linenums="1"
packages:
  power_meter:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/power_meter_proxy.yaml
```

Cette intégration doit connaître l'adresse IP du proxy du compteur électrique. Cette adresse IP doit être définie dans `power_meter_ip_address` dans la section `substitutions` de votre configuration, comme dans l'exemple ci-dessous :

```yaml linenums="1"
substitutions:
  # Power meter source -----------------------------------------------------------
  # Define ip address of Fronius inverter
  power_meter_ip_address: "192.168.1.21"
```

Cette intégration est activée/désactivée avec une variable globale `power_meter_activated`. Cette variable peut être modifiée par un interrupteur dans Home Assistant.

!!! warning "Dépendance au réseau"
    Ce compteur électrique nécessite le réseau pour recueillir des informations sur l'énergie échangée avec le réseau.

