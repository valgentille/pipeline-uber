-- Objectif :
-- réunir les deux sources nettoyées avec UNION ALL

select * from {{ ref('stg_uber_dataset1') }}

-- TODO : ajouter la seconde source avec UNION ALL
union all

select * from {{ ref('stg_uber_dataset2') }}