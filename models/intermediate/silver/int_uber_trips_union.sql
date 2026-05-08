-- Objectif :
-- réunir les deux sources nettoyées avec UNION ALL

select * from {{ ref('stg_uber_dataset1') }}

union all

select * from {{ ref('stg_uber_dataset2') }}