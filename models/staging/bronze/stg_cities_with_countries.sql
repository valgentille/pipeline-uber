-- Objectif :
-- nettoyer la table de correspondance villes -> pays si nécessaire

select
    -- TODO : sélectionner les colonnes utiles
    *
from {{ source('raw_uber', 'cities_with_countries') }}
