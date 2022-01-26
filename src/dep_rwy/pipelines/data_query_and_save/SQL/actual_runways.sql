select
  gufi,
  departure_runway_actual,
  departure_runway_actual_time
from runways
where departure_runway_actual_time between :start_time and :end_time
  and departure_aerodrome_iata_name = :airport
  and points_on_runway = :surf_surv_avail
