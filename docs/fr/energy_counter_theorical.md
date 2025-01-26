# Energy Counter Theorical

Le **energy counter theorical** est conçu pour calculer la quantité d'énergie détournée vers la charge. *Il s'agit d'un package optionnel.*

La quantité d'énergie détournée est calculée en fonction de la puissance de la charge déclarée (en `W`) et du niveau d'énergie détourné chaque seconde.

!!! attention "L'énergie économisée rapportée par ce compteur est à titre informatif uniquement"
    Rappelez-vous que les valeurs sont calculées et non mesurées.  
    Les valeurs présentées par ce capteur ne sont que des estimations de l'énergie détournée basées sur la configuration que vous avez faite dans Home Assistant.

Pour utiliser ce compteur, ajoutez les lignes suivantes à votre fichier de configuration.


```yaml
packages:
  counter:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/energy_counter_theorical.yaml
```
Ensuite, vous devez définir la puissance de charge (**Load power**)S dans l'interface `Control` de Home Assistant. La puissance saisie doit refléter la puissance de l'élément branché sur le routeur solaire.

![texte alternatif](images/SolarRouterEnergyCounterTheoricalConfiguration.png)

L'énergie instantanée et cumulée détournée est disponible dans l'interface `sensors` :

![texte alternatif](images/SolarRouterEnergyCounterTheoricalSensors.png)
