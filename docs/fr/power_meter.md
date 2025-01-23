# Compteur d'énergie

Un compteur d'énergie est conçu pour mesurer la puissance échangée avec le réseau électrique.  
Sur la base de cette valeur, le moteur du routeur solaire déterminera la quantité d'énergie à détourner pour minimiser l'énergie envoyée au réseau.

**Solar Router for ESPHome** propose différents types de compteurs d'énergie.

* Le **[compteur d'énergie Home Assistant](power_meter_home_assistant.md)** peut utiliser n'importe quel capteur Home Assistant comme source, mais peut avoir un taux de rafraîchissement plus lent que les compteurs d'énergie natifs.
* Les **compteurs d'énergie natifs** obtiennent directement les informations de la sonde et ont un taux de rafraîchissement plus rapide. Certains compteurs peuvent également avoir l'avantage de ne pas dépendre du réseau (Ethernet ou WiFi).

## Utiliser un compteur d'énergie comme proxy

Chaque compteur d'énergie peut être utilisé comme proxy. Un proxy peut être placé près de la sonde de mesure et transmettre ses mesures à d'autres routeurs solaires via le réseau.

Consultez l'[exemple de proxy](proxy_example.md) pour voir comment le mettre en œuvre.

!!! important "ESP8266 et ESP8285"
    Les ESP8266 et ESP8285 ont peu de mémoire mais peuvent être utilisés comme proxy si le support ssl est désactivé dans `http_request`.

    ```
    http_request:
      esp8266_disable_ssl_support: True
    ```
    Voir [Composant HTTP Request](https://esphome.io/components/http_request.html#esp8266-disable-ssl-support) pour plus de détails
