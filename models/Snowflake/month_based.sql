select * , round(overall_recovered/overall_cases,2)*100 as rate_of_recovered 
from (
  select concat(substring(TO_VARCHAR(TO_DATE(date,'MM/DD/YYYY'),'YYYYMMDD'),1,4),'-',substring(TO_VARCHAR(TO_DATE(date,'MM/DD/YYYY'),'YYYYMMDD'),5,2)) as month
  ,location, sum(distinct total_districts), sum(distinct total_cities),
 sum(new_active_cases) as total_new_active_cases, sum(new_cases) as total_new_cases, sum(total_cases) as overall_cases,
sum(total_deaths) as total_deaths, sum(new_deaths) as total_new_deaths, sum(new_recovered) as total_new_cases_recovered,
sum(total_recovered) as overall_recovered
  from
   "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_SATHYANARAYANAN_CV"
   group by 1,2
   )
  order by 1 desc, 10 desc 
