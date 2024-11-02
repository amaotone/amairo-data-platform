{{ config(materialized="table") }}

select *
from read_csv_auto("../datasets/OraclesElixir/*.csv")
