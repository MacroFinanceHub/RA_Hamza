*#######################################################################*
*							                                  			*
*THIS DO FILE CHECKS DROPOFFS & ENTRIES INTO THE WORLD BILLIONAIRES LIST*				
*							  							      			*
*#######################################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

use "${SavePath}/statadata/harmonized_names/harmonized_names2/88-18_final", clear

*Looking at number of observations per year* 
forval i = 1988/2018 {  

	count if year == `i' & prefillin == 1 

}

/* 
1988: N = 78
1989: N = 119
1990: N = 165
1991: N = 170
1992: N = 177
1993: N = 193
1994: N = 229
1995: N = 219
1996: N = 287
1997: N = 164 Have to have made it yourself, or you have to be actively managing it (limit to 200) 
1998: N = 138 Still earning or working with what they inherited (limit to 200) 
1999: N = 248 
2000: N = 270
2001: N = 269
2002: N = 245
2003: N = 254
2004: N = 310
2005: N = 350
2006: N = 422
2007: N = 531
2008: N = 656
2009: N = 434
2010: N = 608
2011: N = 798
2012: N = 801
2013: N = 984
2014: N = 1,153
2015: N = 1,290
2016: N = 1,270
2017: N = 1,478
2018: N = 1,623 
*/

*Checking dropoffs* 
tset id year, yearly

gen entry = missing(L.prefillin) & !missing(prefillin) 
gen dropoff = missing(prefillin) & !missing(L.prefillin)  


bysort year: egen yearlyentry = total(entry) 
bysort year: egen yearlydropoff = total(dropoff) 

//keep year yearlydropoff 
//duplicates drop year, force 

graph bar yearlydropoff, over(year, label(labsize(tiny))) title("Number of Dropoffs Per Year") b1title("Year") ytitle("Dropoffs")
graph save "${SavePath}/figures/YearlyDropoff", replace

graph bar yearlyentry, over(year, label(labsize(tiny))) title("Number of Entries Per Year") b1title("Year") ytitle("Entries") 
graph save "${SavePath}/figures/YearlyEntry", replace


/*
*Checking to see if wealth is transferred after dropoff* 
bysort familynameid id : gen nvals = _n == 1 
bysort familynameid: egen familymembers = total(nvals) 
keep if familymembers == 2

drop nvals

bysort id (year): keep if entry == 1 | dropoff == 1 | F.dropoff == 1 
gen beforedropoff = 1 if entry == 0 & dropoff == 0 

bysort familynameid: egen dropofftotal = total(dropoff)  
drop if dropofftotal == 0 

sort familynameid year id
drop lastname2 familymembers dropofftotal
*/

*Looking at country by country share of entry* 

collapse (sum) entry (sum) prefillin , by(countrymode) 
keep if prefillin >= 15 

gen shareentry = entry / prefillin 

sort shareentry 

graph bar shareentry, over(countrymode, label(labsize(tiny) angle(90)) sort(1)) ///
ytitle("Share of Entry", size(small)) ///
b1title("Countries", size(small)) ///
title("Share of Entry by Country", size(medium)) subtitle("If prefillin >= 15", size(medsmall)) 

graph save "${SavePath}/figures/ShareEntryByCountry", replace
