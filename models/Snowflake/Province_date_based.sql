select * , round(overall_recovered/overall_cases,2)*100 as rate_of_recovered 
from (
  select  date,location, location_level, 
  case when lower(island) != 'null' or island is not null then 'yes'
  else 'no' end as is_island,
 sum(new_active_cases) as total_new_active_cases, sum(new_cases) as total_new_cases, sum(total_cases) as overall_cases,
sum(total_deaths) as total_deaths, sum(new_deaths) as total_new_deaths, sum(new_recovered) as total_new_cases_recovered,
sum(total_recovered) as overall_recovered
  from
{{ source('COVID_19_INDONESIA_SATHYANARAYANAN_CV','COVID_19_INDONESIA_SATHYANARAYANAN_CV')}}
   group by 1,2,3,4
  )
  order by 1 desc, 12 desc 
