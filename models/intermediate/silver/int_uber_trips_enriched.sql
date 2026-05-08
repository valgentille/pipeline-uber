-- Objectif :
-- enrichir les trajets avec start_country et stop_country
-- supprimer les trajets dont le pays n'est pas déterminé

with trips as (

    select * from {{ ref('int_uber_trips_union') }}

),

cities as (

    select * from {{ ref('stg_cities_with_countries') }}

)

select
    t.*,
    start_c.country as start_country,
    stop_c.country  as stop_country
from trips t
left join cities start_c
    on t.start_location = start_c.city
left join cities stop_c
    on t.stop_location = stop_c.city
where start_c.country is not null
  and stop_c.country  is not null