# TP dbt – Uber Trips

Ce dépôt contient le squelette complet du TP dbt.

## Objectif

Construire un pipeline dbt pour :

- ingérer deux CSV de trajets Uber
- nettoyer les données
- enrichir les trajets avec les pays
- produire des KPI finaux

## Arborescence

- `data/` : fichiers CSV sources
- `models/staging/bronze/` : modèles de staging
- `models/intermediate/silver/` : modèles intermédiaires
- `models/marts/gold/` : modèles finaux / KPI
- `models/sources.yml` : déclaration des sources
- `models/schema.yml` : tests dbt

## Démarrage rapide

```bash
uv venv

# Linux / macOS
source .venv/bin/activate

# Windows PowerShell
.venv\Scripts\Activate.ps1

uv pip install dbt-duckdb
dbt debug --profiles-dir .
dbt run --profiles-dir .
dbt test --profiles-dir .
```

## Consignes

Complétez les fichiers SQL marqués `TODO`.

Réalisez les étapes suivantes :

1. Lire les deux sources CSV.
2. Normaliser les dates.
3. Renommer les colonnes.
4. Remplacer les valeurs nulles de `PURPOSE` par `Unknown`.
5. Supprimer les lignes invalides :
   - `Unknown Location`
   - villes contenant autre chose que des lettres et des espaces
6. Réunir les deux sources.
7. Joindre la table `cities_with_countries`.
8. Ajouter `start_country` et `stop_country`.
9. Supprimer les trajets dont le pays n’est pas déterminé.
10. Produire les KPI finaux.
11. Exécuter les tests dbt.

## Fichiers présents dans `data/`

- `UberDataset1.csv`
- `UberDataset2.csv`
- `cities_with_countries.csv`
