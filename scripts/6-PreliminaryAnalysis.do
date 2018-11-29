*#######################################################################*
*							                                  			*
*THIS DO FILE CHECKS DROPOFFS & ENTRIES INTO THE WORLD BILLIONAIRES LIST*				
*							  							      			*
*#######################################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

use "${SavePath}/statadata/harmonized_names/88-15_final", clear

*Looking at number of observations per year* 
forval i = 1988/2015 {  

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
1997: N = 165 Have to have made it yourself, or you have to be actively managing it (limit to 200) 
1998: N = 108 Still earning or working with what they inherited (limit to 200) 
1999: N = 330 This list different than the one actually published in Forbes, where did Matthieu get this data from?
2000: N = 330
2001: N = 265
2002: N = 223
2003: N = 275
2004: N = 287
2005: N = 269
2006: N = 336
2007: N = 432
2008: N = 525
2009: N = 404
2010: N = 608
2011: N = 801
2012: N = 802
2013: N = 984
2014: N = 1,153
2015: N = 1,291
*/

browse if year == 1999 & prefillin == 1 

























*Checking dropoffs* 
tset id Year, yearly 

*bysort id: gen index = _n 

gen run = .
bysort id: replace run = cond(L.run == ., 1, L.run + 1)

*bysort id: gen entry = run[_n] <= run[_n-1] & index[_n] != 1

bysort id: gen entry = run[_n] <= run[_n-1]
bysort id: gen dropoff = 
