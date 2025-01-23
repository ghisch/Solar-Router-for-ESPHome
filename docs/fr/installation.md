# Installation et Configuration

Pour installer votre routeur solaire, vous devez définir l'architecture de votre solution entre une installation [autonome](firmware.md#standalone-configuration), une installation fonctionnant avec un [proxy](firmware.md#power-meter-proxy-configuration) ou une installation avec [plusieurs routeurs solaires](firmware.md#multiple-solar-router-configuration).

### Étape 1 : Installer et configurer le firmware ESPHome

Installez [ESPHome](https://esphome.io) sur votre ESP comme décrit dans la documentation [Ready-Made Project](https://esphome.io/projects/).  
Sélectionnez **"Empty ESPHome device"**.

Adoptez-le dans [Home Assistant](https://home-assistant.io).

!!! important "Reconnexion Wifi"
    Supprimez `ap:` et `captive_portal:`.  
    *Cela pourrait empêcher le routeur solaire de se connecter au WiFi en cas de perte de connexion*

### Étape 2 : Sélectionner les packages

Un **routeur solaire** nécessite 3 packages : un **compteur de puissance**, un **régulateur** et le **moteur**.

Un **proxy** n'a besoin que d'1 package de **compteur de puissance**

#### Étape 2.1 : Sélectionner un Compteur de Puissance

* [Fronius](power_meter_fronius.md)  
    Obtenir les données de puissance de l'onduleur Fronius (Testé sur Gen24 Primo)
* [Home Assistant](power_meter_home_assistant.md)  
    Obtenir les données de puissance du capteur Home Assistant
* [Client Proxy](power_meter_proxy_client.md)  
    Obtenir les données de puissance de l'extérieur du routeur solaire

!!! abstract "Contribuer"
    Vous êtes développeur et votre compteur de puissance manque dans cette liste, référez-vous à la section [contribuer](contributing.md) pour voir comment contribuer à ce projet.

#### Étape 2.2 : Sélectionner un Régulateur

* Pour les régulateurs pouvant être contrôlés de 0% à 100%
    * [Triac](regulator_triac.md)  
    Réguler l'énergie avec un Triac
    * [Relais Statique](regulator_solid_state_relay.md)  
    Réguler l'énergie avec un Relais Statique
* Pour les régulateurs qui ne peuvent être que allumés/éteints
    * [Relais mécanique](regulator_mecanical_relay.md)  
    Réguler l'énergie avec un relais mécanique

!!! abstract "Contribuer"
    Vous êtes développeur et votre régulateur manque dans cette liste, référez-vous à la section [contribuer](contributing.md) pour voir comment contribuer à ce projet.

#### Étape 2.3 : Ajouter un Moteur

* [Moteur Variable](engine.md)  
  Lire l'échange de puissance avec le réseau, déterminer et appliquer le pourcentage d'ouverture du régulateur.

* [Moteur ON/OFF](engine_on_off.md)  
  Lire l'échange de puissance avec le réseau, et commencer à détourner l'énergie si un seuil est atteint et arrêter si un autre seuil est atteint.

#### Étape 2.4 : Ajouter un Compteur d'Énergie (*Optionnel*)

* [Compteur d'Énergie Théorique](energy_counter_theorical.md)  
  Calculer l'énergie économisée basée sur l'énergie détournée et la puissance de charge.

### Étape 3 : Configurer votre routeur solaire

Chaque package nécessite une configuration qui se fait dans la section `substitution`.  
*Référez-vous à la documentation des packages sélectionnés et ajoutez la configuration à la fin de votre fichier yaml.*

Vous pouvez vous référer aux exemples pour voir comment configurer votre yaml pour une installation [autonome](standalone_example.md) ou une installation [basée sur un proxy](proxy_example.md).

!!! example "Plus d'exemples sont disponibles sur [github](https://github.com/XavierBerger/Solar-Router-for-ESPHome)"

### Étape 4 : Téléverser le firmware

Installez le Routeur Solaire sur votre ESP en utilisant OTA depuis Home Assistant.
