select location, sum(new_active_cases) as total_new_active_cases, sum(new_cases) as total_new_cases, sum(total_cases) as overall_cases,
sum(total_deaths) as total_deaths, sum(new_deaths) as total_new_deaths, sum(new_recovered) as total_new_cases_recovered,
sum(total_recovered) as overall_recovered
from
{{ source('COVID_19_INDONESIA_SATHYANARAYANAN_CV','COVID_19_INDONESIA_SATHYANARAYANAN_CV')}}
group by 1
