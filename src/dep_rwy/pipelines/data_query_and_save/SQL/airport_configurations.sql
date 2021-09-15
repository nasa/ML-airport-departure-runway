select
  airport_id,
  datis_time,
  start_time as config_start_time,
  departure_runways,
  arrival_runways
from datis_parser_message
where airport_id = :airport
  and datis_time between (timestamp :start_time - interval '48 hours') and (timestamp :end_time + interval '24 hours')
  and start_time between (timestamp :start_time - interval '24 hours') and :end_time
