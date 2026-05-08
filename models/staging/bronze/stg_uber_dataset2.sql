-- Objectif :
-- - lire la source 2
-- - parser les dates (format européen : DD/MM/YYYY HH:MM)
-- - renommer les colonnes
-- - remplacer PURPOSE null par 'Unknown'
-- - filtrer les lignes invalides

with source_data as (

    select *
    from {{ source('raw_uber', 'UberDataset2') }}

)

select
    strptime("START_DATE", '%d/%m/%Y %H:%M') as start_date,
    strptime("END_DATE",   '%d/%m/%Y %H:%M') as end_date,
    "START"   as start_location,
    "STOP"    as stop_location,
    "MILES"   as distance,
    coalesce("PURPOSE", 'Unknown') as purpose
from source_data
where
    start_location != 'Unknown Location'
    and stop_location != 'Unknown Location'
    and regexp_matches(start_location, '^[A-Za-zÀ-ÿ\s\-]+$')
    and regexp_matches(stop_location,  '^[A-Za-zÀ-ÿ\s\-]+$')