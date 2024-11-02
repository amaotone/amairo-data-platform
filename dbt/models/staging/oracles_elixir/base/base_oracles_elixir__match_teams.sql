select * from {{ ref("raw_oracles_elixir__matches") }} where position = 'team'
