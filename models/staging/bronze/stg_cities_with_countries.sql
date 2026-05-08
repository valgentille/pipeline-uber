-- Objectif :
-- nettoyer la table de correspondance

select
    city,
    country
from {{ source('raw_uber', 'cities_with_countries') }}
