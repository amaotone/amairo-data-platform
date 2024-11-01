with
    source as (
        select season, date, event, patch, blue_team, red_team, winner
        from {{ ref("matches_stats") }}
    ),
    renamed as (select * from source)

select *
from renamed
