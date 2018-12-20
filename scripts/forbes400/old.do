
/***************************************************************************************************
Impute networth for indiduals that don't die but get out of the top
***************************************************************************************************/
use "$DatabasePath/data/Asset Pricing/Wealth/forbes400/phd-list-cleaned.dta", clear
collapse (min) networth_min = networth, by(year)
tsset year
gen networth_min_f = F.networth_min
merge 1:m year using "$DatabasePath/data/Asset Pricing/Wealth/forbes400/phd-list-cleaned.dta", nogen
tsset id year
drop r
gen r = F.networth / networth
gen r_c = r
/* NEXT: only take the one without bequest maybe?, i.e. with family == 0 etc */
replace r_c = networth_min_f / networth if missing(r) & (dropoff_reason != 1) & (dropoff_reason != 2)
tempfile temp
save `temp'

/* create pdf function */
drop if missing(r_c)
gen disappear = missing(r)
qui sum year
keep  year r_c disappear 
sorder year r_c disappear
gen nondisappear = 1 - disappear

/* check stata in  2000 and 2005 */
gen temp = -r_c + 100
stset temp if year == 2000, failure(nondisappear)
stci, rmean
di 100 - `=r(rmean)'
stset temp if year == 2005, failure(nondisappear)
stci, rmean
di 100 - `=r(rmean)'
drop temp


egen temp = min(r_c), by(year)
replace nondisappear = 1 if r_c == temp
drop temp
gen n = 1
collapse (sum) nondisappear n, by(r_c year)
/* people still living */
bys year (r_c): gen n_survive = sum(n)
/* probability of surviving given I'm <= r_c */
gen p_survive = (n_survive - nondisappear)  / n_survive if nondisappear > 0
gen logp_survive = log(p_survive+ 0.000001) 
gen or_c = - r_c
bys year (or_c): gen logcdf = sum(logp_survive) 
gen cdf = exp(logcdf)
by year: gen cdf2 = 1.0 if _n == 1
by year: replace cdf2 = cdf[_n-1] if _n > 1
by year: gen pdf = cdf2 - cdf2[_n+1]
by year: replace pdf =  cdf2 if _n == _N
sum r_c if year == 2000 [w=pdf]
sum r_c if year == 2005 [w=pdf]

/* to suppress maybe? */
*by year: gen temp = r_c[_n+1] 
*by year: replace temp = 0 if _n == _N
*drop r_c
*rename temp r_c
/* end of to suppress maybe */
by year: gen Er = sum(pdf * r_c)
keep year r_c Er 
tempfile temp3 
save `temp3'


/* given pdf function computed imputed values */
use `temp', clear
keep if missing(r) & !missing(r_c)
merge m:1 year r_c using `temp3', nogen
csipolate  Er r_c , gen(temp) by(year)
replace networth = networth * temp
replace rank = .
rename dropoff_reason dropoff_reason_l
replace dropoff_networth = .
replace year = year + 1
drop r r_c Er temp
drop if missing(id)
gen imputed = 1
replace r_permno_l = r_permno
replace r_permno = r_permno_f
drop r_permno_f
replace r_ff_ew_l = r_ff_ew
replace r_ff_vw_l = r_ff_vw
drop r_ff_ew r_ff_vw
/* oops at some point I forgot to keep networth. What did it mean? It meat that networth was systemically replaced by netwroth_min_f*/
keep year id name familyname r_permno* r_ff* imputed networth_min_f dropoff_reason_l networth family
append using "$DatabasePath/data/Asset Pricing/Wealth/forbes400/phd-list-cleaned.dta"
replace imputed = 0 if missing(imputed)
/* due to some rounding */
replace networth = networth_min_f - 1 if networth > networth_min_f & imputed == 1
tsset id year

/* not clean at all to do so. ireally need to put the guy that drop in 2001. But at least it says that if returns lower than average reutn of their companies, not due to dropouts 
gen networth2 = L.networth * (1 + L.r_permno) if imputed == 1
egen temp = mean(networth - networth2) if imputed == 1, by(year) 
drop temp
replace networth = networth2 if (networth2 < networth_min_f)
drop networth2
*/

bys id (year): gen period = imputed[_n-1]
bys id (year): replace period = sum(period)
egen id2 = group(id period)
drop period


tsset id year



drop networth_min networth_min_f
save "$SavePath/phd-list-imputed.dta", replace

