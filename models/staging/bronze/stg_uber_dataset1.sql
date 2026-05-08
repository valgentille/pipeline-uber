-- Objectif :
-- - lire la source 1
-- - parser les dates (déjà TIMESTAMP, cast explicite)
-- - renommer les colonnes
-- - remplacer PURPOSE null par 'Unknown'
-- - filtrer les lignes invalides

with source_data as (

    select *
    from {{ source('raw_uber', 'UberDataset1') }}

)

select
    "START_DATE"::timestamp as start_date,
    "END_DATE"::timestamp   as end_date,
    "START"                 as start_location,
    "STOP"                  as stop_location,
    "MILES"                 as distance,
    coalesce("PURPOSE", 'Unknown') as purpose
from source_data
where
    "START" != 'Unknown Location'
    and "STOP" != 'Unknown Location'
    and regexp_matches("START", '^[A-Za-zÀ-ÿ\s\-]+$')
    and regexp_matches("STOP",  '^[A-Za-zÀ-ÿ\s\-]+$')