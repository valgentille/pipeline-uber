-- Objectif :
-- créer un modèle exportable pour le reporting final

select *
from {{ ref('mart_uber_kpis') }}
