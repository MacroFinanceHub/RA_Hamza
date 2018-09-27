*###########################################################*
*							                                *
*THIS DO FILE GENERATES YEAR-PAIRWISE DATASETS USING MATCHIT*				
*							  							    *
*###########################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

cd ${SavePath}/statadata

*Prepping data for matchit, adding id variable and adding year to name variable
local years 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 
 
foreach i of local years {

	use WorldBillionaires`i'minusUS, clear
	
	rename Year Year_`i'
	rename Name Name_`i' 
	rename Country Country_`i'
	rename Wealth Wealth_`i'
	rename Age Age_`i'
	rename Family Family_`i'
	
	gen id_`i' = _n 
	
	save WorldBillionaires`i'minusUS, replace
	
 }

*Using matchit to generate matched datasets* 

local yearsmaster 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 
local yearsusing 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 

foreach i of local yearsmaster {

	foreach j of local yearsusing {
		
		if `i' < `j' {
		
		use WorldBillionaires`i'minusUS, clear 
		
		matchit id_`i' Name_`i' using "WorldBillionaires`j'minusUS.dta", idusing(id_`j') txtusing(Name_`j')
		
		gsort -similscore
		
		joinby id_`i' using WorldBillionaires`i'minusUS 
		joinby id_`j' using WorldBillionaires`j'minusUS
		
		save "${SavePath}/statadata/matchit_pairwise/matchit_`i'_`j'"

		}	
	}
 }
 
 
