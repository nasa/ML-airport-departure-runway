select
  gufi,
  arrival_aerodrome_icao_name,
  departure_stand_actual_time,
  departure_runway_actual_time,
  aircraft_engine_class,
  aircraft_type,
  carrier
from matm_flight_summary
where (departure_runway_actual_time between :start_time and :end_time)
  and (departure_aerodrome_icao_name = :airport)
