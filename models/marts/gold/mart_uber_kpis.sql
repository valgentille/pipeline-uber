-- Objectif :
-- produire les KPI finaux sur des données propres et enrichies

with trips as (

    select * from {{ ref('int_uber_trips_enriched') }}

)

select
    -- TODO : total_trips
    -- TODO : total_distance
    -- TODO : avg_distance
    -- TODO : avg_duration_minutes
    1 as dummy_kpi
from trips
