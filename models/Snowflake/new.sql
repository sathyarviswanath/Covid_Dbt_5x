select location, count(1) as counts
from {{ source('COVID_19_INDONESIA_SATHYANARAYANAN_CV','COVID_19_INDONESIA_SATHYANARAYANAN_CV')}}
group by 1
