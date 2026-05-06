-- Objectif :
-- - lire la source 1
-- - parser les dates
-- - renommer les colonnes
-- - remplacer PURPOSE null par 'Unknown'
-- - filtrer les lignes invalides

with source_data as (

    select *
    from {{ source('raw_uber', 'UberDataset1') }}

)

select
    -- TODO : parser le format de date de la source 1
    -- TODO : START_DATE  -> start_date
    strptime("START_DATE*", '%m/%d/%Y %H:%M') as start_date,
    -- TODO : END_DATE    -> end_date
    strptime("END_DATE*", '%m/%d/%Y %H:%M') as end_date,
    -- TODO : START       -> start_location
    "START*" as start_location,
    -- TODO : STOP        -> stop_location
    "STOP*" as stop_location,
    -- TODO : MILES       -> distance
    "MILES*" as distance,
    -- TODO : PURPOSE     -> purpos
    -- TODO : remplacer les null par 'Unknown'
    coalesce("PURPOSE*", 'Unknown') as purpose,
    *
from source_data
Where
-- TODO : filtrer "Unknown Location"
   start_location != 'Unknown Location' 
    and stop_location != 'Unknown Location'
-- TODO : filtrer les villes contenant autre chose que des lettres et des espaces
    and regexp_matches(start_location, '^[A-Za-z\s]+$')
    and regexp_matches(stop_location, '^[A-Za-z\s]+$')