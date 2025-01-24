# Contribuer au développement

**Solar Router for [ESPHome](http://esphome.io)** est conçu pour être modulaire afin de faciliter la personnalisation pour divers compteurs d'énergie et régulateurs.  
Vous souhaitez contribuer ? Vous êtes le bienvenu et vous trouverez ci-dessous quelques recommandations pour le faire.

## Développer un **Matériel**

Vous pouvez proposer n'importe quel matériel basé sur vos besoins. Si ce nouveau matériel nécessite l'utilisation de GPIO, les broches utilisées par votre matériel doivent être configurées dans la section `substitution`.

Une documentation doit être ajoutée décrivant ce nouveau matériel et ses contraintes (Ex : fonctionnalité disponibles sur les GPIO). Voir le chapitre [mettre à jour la documentation](#mise-a-jour-de-la-documentation) ci-dessous.

## Développer un **Package logiciel**

### Configurer l'environnement de développement

Pour contribuer à **Solar Router for ESPHome**, développer une nouvelle fonctionnalité sur votre ordinateur et proposer une *Pull Request*, vous devez :

- Forker le [dépôt **Solar Router for ESPHome**](https://github.com/XavierBerger/Solar-Router-for-ESPHome) sur Github.
- Cloner votre dépôt forké sur votre PC.
- Créer une branche de développement à partir de **main**.
- [Créer et activer un environnement virtuel Python](https://docs.python.org/3/library/venv.html) :
    ```
    python -m venv venv
    venv/bin/activate
    ```
- Installer ESPHome CLI et autres dépendances du projet :
    ```
    pip install -r requirements.txt
    ``` 
- Installer et tester votre code sur votre appareil avec la commande `esphome` : 
    ```
    esphome run ma_configuration.yaml
    ```
- Mettre à jour le code et pousser les mises à jour sur votre dépôt.
- Proposer une *Pull Request* depuis votre fork vers le dépôt officiel.

### Développer un **Power Meter**

Un **Power Meter** est un composant conçu pour fournir et mettre à jour un sensor nommé `real_power`.

```yaml linenums="1"
sensor:
  # Sensor showing the actual power consumption
  - id: real_power
    platform: template
    name: "Real Power"
    device_class: "power"
    unit_of_measurement: "W"
    update_interval: 1s
```

!!! tip "Astuce : Voir les Power Meter déjà développés pour des exemples"

Ce capteur est utilisé par les **Engine** pour obtenir la valeur de la puissance échangée avec le réseau.

Si ce nouveau Power Meter nécessite une configuration spécifique, les paramètres requis doivent être ajoutés dans la section `substitution`.

Une documentation doit être ajoutée décrivant le Power Meter et comment le configurer. Voir le chapitre [mettre à jour la documentation](#mise-a-jour-de-la-documentation) ci-dessous.

### Développer un **Régulateur**

Un **Régulateur** doit gérer le pourcentage d'énergie envoyé à la charge en fonction de l'état du capteur `regulator_opening`. L'état de `regulator_opening` peut varier de 0 (où aucune énergie n'est envoyée à la charge) à 100 (où toute l'énergie possible est envoyée à la charge).

Le code suivant représente un exemple (extrait de [regulator_triac.yaml](https://github.com/XavierBerger/Solar-Router-for-ESPHome/blob/main/solar_router/regulator_triac.yaml)) d'utilisation basé sur le composant `light` utilisant `brightness` pour contrôler l'énergie dérivée :

```yaml linenums="1"
script:
  # Apply regulation on triac using light component
  - id: regulation_control
    mode: single
    then:
      # Apply opening level on triac using light component
      - light.turn_on:
          id: dimmer_controller
          brightness: !lambda return id(regulator_opening).state/100.0;
```

!!! tip "Astuce : Voir les régulateurs déjà développés pour des exemples"

Si ce nouveau compteur électrique nécessite une configuration spécifique, les paramètres requis doivent être ajoutés dans la section `substitution`.

Une documentation doit être ajoutée décrivant le compteur électrique et comment le configurer. Voir le chapitre [mise à jour de la documentation](#mise-a-jour-de-la-documentation) ci-dessous.

## Mise à jour de la **Documentation**

La documentation est rédigée en utilisant [mkdocs](https://www.mkdocs.org/) et [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).

Pour installer `mkdocs`, vous devez installer [Python](https://python.org) puis :

- Créer un environnement virtuel (voir [documentation Python](https://docs.python.org/3/library/venv.html)).
- Installer le module requis avec la commande suivante `pip install -r requirements.txt`.

La documentation est stockée dans le répertoire `docs`. En anglais dans le répertoire `en` etn en français dans le répertoir `fr`. Pour voir vos modifications en temps réel dans votre navigateur, exécutez la commande `mkdocs serve` et naviguez sur [http://127.0.0.1:8000](http://127.0.0.1:8000)[6].

!!! note "Mise à jour du Changelog"
    Le Changelog n'est disponible que dans la [documentation](https://xavierberger.github.io/Solar-Router-for-ESPHome/changelog/) officiellement publiée.  
    Le Changelog est mis à jour manuellement après la publication d'une nouvelle version.

    Le Changelog est généré en utilisant `git-cliff`.  
    Les versions sont basées sur les tags.  
    Les lignes ajoutées dans le changelog sont basées sur les *messages de commit de fusion*.

    Le script `tools\update_documentation.sh` est conçu pour mettre à jour `changelog.md`, générer et publier la documentation `mkdocs` sur [github pages](https://xavierberger.github.io/Solar-Router-for-ESPHome/).  
    **Le script de mise à jour de la documentation est destiné à être utilisé uniquement par le mainteneur du dépôt.**

