# The Gossip Project - Terminal-based MVC App in Ruby

Bienvenue dans **The Gossip Project**, une application en ligne de commande construite en Ruby en suivant le pattern MVC (Model - View - Controller).

Ce projet permet de créer, afficher et supprimer des "gossips" (potins) à travers une interface textuelle simple.

## Fonctionnalités

* Créer un gossip avec un auteur et un contenu
* Voir la liste complète des gossips
* Supprimer un gossip

## Architecture du Projet

```
.
├── app.rb
├── Gemfile
├── Gemfile.lock
├── db
│   └── gossip.csv
└── lib
    ├── controller.rb
    ├── gossip.rb
    ├── router.rb
    └── view.rb
```

### 1. `app.rb`

Point d'entrée de l'application. Il initialise le routeur et lance l'application avec `Router.new.perform`.

### 2. `lib/router.rb`

Gère les interactions utilisateur. Présente les options disponibles et redirige vers les méthodes correspondantes du controller :

* Créer un gossip
* Afficher tous les gossips
* Supprimer un gossip
* Quitter l'application

### 3. `lib/controller.rb`

Fait le lien entre la view et le model. Contient les méthodes :

* `create_gossip`
* `index_gossips`
* `delete_gossip`

### 4. `lib/view.rb`

Affiche les menus, récupère les entrées utilisateur et affiche les résultats.

### 5. `lib/gossip.rb`

Le modèle représentant un gossip avec deux attributs : `author` et `content`. Gère l’interaction avec la base de données (fichier CSV).

* Méthode `save` : ajoute une ligne au fichier CSV
* Méthode `all` : retourne tous les gossips
* Méthode `delete` : supprime un gossip donné

### 6. `db/gossip.csv`

Base de données de l'application, contenant les gossips sous forme de lignes CSV.

## Installation

1. Cloner ce dépôt :

```bash
git clone <url-du-repo>
cd ts4a_ruby_POO
```

2. Installer les gems :

```bash
bundle install
```

3. Lancer l'application :

```bash
ruby app.rb
```

## Prérequis

* Ruby 3.x
* Bundler
* Gems : `csv`, `pry` (pour le debug si besoin)

## Exemple d'utilisation

```
BIENVENUE DANS THE GOSSIP PROJECT
Tu veux faire quoi jeune mouss' ?
1. Je veux créer un gossip
2. Je veux voir la liste des gossips
3. Je veux supprimer un gossip
4. Je veux quitter l'app
```

## Auteurs

Projet conçu dans le cadre d'un exercice pédagogique Ruby POO.

---
