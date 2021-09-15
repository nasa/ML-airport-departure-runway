with base as (
    select
      gufi,
      "timestamp",
      sequence_id,
      coalesce(
          departure_stand_intended_time,
          departure_stand_earliest_time,
          departure_stand_airline_time,
          departure_stand_estimated_time,
          departure_stand_proposed_time,
          departure_stand_scheduled_time,
          departure_stand_initial_time
      ) as departure_stand_best_time
    from matm_flight_all
    where "timestamp" between :start_time and :end_time
      and departure_aerodrome_icao_name = :airport
      and departure_stand_actual_time is null
),
lagged as (
    select
      gufi,
      "timestamp",
      departure_stand_best_time,
      lag(departure_stand_best_time) over wnd as departure_stand_best_time_prev
    from base
    where departure_stand_best_time is not null
    window wnd as (partition by gufi order by "timestamp", sequence_id rows between unbounded preceding and unbounded following)
)
select
  gufi,
  "timestamp",
  departure_stand_best_time
from lagged
where departure_stand_best_time != departure_stand_best_time_prev
  or departure_stand_best_time_prev is null
