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
## Fichiers présents dans `data/`

- `UberDataset1.csv`
- `UberDataset2.csv`
- `cities_with_countries.csv`
note pour affichier les kpi via python python3 -c "
import duckdb
con = duckdb.connect('tp_uber.duckdb')
print(con.execute('SELECT * FROM mart_uber_kpis').df())
