*#######################################################################*
*							                                  			*
*THIS DO FILE CHECKS DROPOFFS & ENTRIES INTO THE WORLD BILLIONAIRES LIST*				
*							  							      			*
*#######################################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

use "${SavePath}/statadata/harmonized_names/88-15_final", clear

*Checking dropoffs* 

tset id Year, yearly 

*bysort id: gen index = _n 

gen run = .
bysort id: replace run = cond(L.run == ., 1, L.run + 1)

*bysort id: gen entry = run[_n] <= run[_n-1] & index[_n] != 1

bysort id: gen entry = run[_n] <= run[_n-1]
bysort id: gen dropoff = 
