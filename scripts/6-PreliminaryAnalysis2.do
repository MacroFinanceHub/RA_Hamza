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

gen dropoff = missing(wealth) & !missing(L.wealth) 
gen entry = missing(L.wealth) & !missing(wealth) 
 
bysort year: egen yearlydropoff = total(dropoff) 
bysort year: egen yearlyentry = total(entry) 

//keep year yearlydropoff 
//duplicates drop year, force 

graph bar yearlydropoff, over(year, label(labsize(tiny))) title("Number of Dropoffs Per Year") b1title("Year") ytitle("Dropoffs")
graph bar yearlyentry, over(year, label(labsize(tiny))) title("Number of Entries Per Year") b1title("Year") ytitle("Entries") 


