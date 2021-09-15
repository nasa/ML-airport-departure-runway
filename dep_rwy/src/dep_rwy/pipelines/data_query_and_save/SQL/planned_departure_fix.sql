select
  gufi,
  "timestamp",
  departure_fix_source_data,
  filed_flight
from matm_flight
where "timestamp" between :start_time and :end_time
  and departure_aerodrome_icao_name = :airport
  and departure_fix_source_data is not null
