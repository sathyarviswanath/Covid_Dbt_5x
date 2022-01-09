select location, sum(new_cases) as total_cases
from
{{ source('COVID_19_INDONESIA_SATHYANARAYANAN_CV','COVID_19_INDONESIA_SATHYANARAYANAN_CV')}}
group by 1;
