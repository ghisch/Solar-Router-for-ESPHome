# Configuration du *Recorder* Home Assistant

Les **energy counter** et les **power meter** sont mis à jour toutes les secondes. 
Par défaut, le *recorder* de Home Assistant enregistre ces informations dans sa base de données.  
Pour optimiser le stockage des données dans Home Assistant, il est essentiel de configurer correctement les bases de données.

* Premièrement, **Identifiez le capteur cible à filtrer**  
  Le compteur de puissance fournit un capteur nommé `real_power`.  
  Le compteur d'énergie fournit un capteur nommé `theorical_energy_diverted`.  
  Dans votre Home Assistant, ces capteurs devraient être préfixés avec le nom de votre appareil et devraient être identifiés avec un ID comme `sensor.solarrouter_real_power` ou `sensor.solarrouter_theorical_energy_diverted`.  
  Vérifiez vos capteurs pour adapter la configuration.

* Ensuite, **Créez une configuration `recorder` pour Home Assistant**  
  Ajoutez les lignes suivantes dans votre `configuration.yaml` pour filtrer les données de `real_power` et `theorical_energy_diverted` :  

    ```
    recorder:
      exclude:
        entities:
          - sensor.solarrouter_real_power
          - sensor.solarrouter_theorical_energy_diverted
    ```

!!! note "À propos du recorder"
    Le `recorder` de Home Assistant enregistre constamment des données dans la base de données. Référez-vous à la [configuration du recorder](https://www.home-assistant.io/integrations/recorder/) pour plus de détails.  
    **Il est fortement conseillé d'examiner les données produites par votre routeur solaire et d'adapter votre configuration en fonction de vos besoins.**

!!! warning "Si vous utilisez InfluxDB"
    Si vous utilisez InfluxDB, vous devriez accorder la même attention à l'enregistrement des données.  
    Référez-vous à la [documentation de l'intégration](https://www.home-assistant.io/integrations/influxdb/) pour exclure `real_power` et `theorical_energy_diverted` de votre base de données.
