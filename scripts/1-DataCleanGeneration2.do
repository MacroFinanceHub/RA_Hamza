*#################################################################################*
*																				  *
*THIS DO FILE DOES AN INITIAL DATA CLEAN & PREPARES DATASETS TO BE USED BY MATCHIT*				
*																				  *
*#################################################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

*****************************************
*		  Data from 1988-1995			*
*****************************************

*Importing data
cd $DataPath 

import excel "${DataPath}/Forbes - The World's Billionaires 1988-1998_Hamza.xlsx", firstrow clear 

*Trimming spaces 
replace Date  = strtrim(Date)
replace Name = strtrim(Name)  
replace Country = strtrim(Country)
replace BestEstimatedWealth = strtrim(BestEstimatedWealth)  
replace Family = strtrim(Family)  

*Changing dates to years 
rename Date Year
label var Year "Year" 

replace Year = "1988" if Year == "7/25/1988 and online"  
replace Year = "1989" if Year == "7/24/1989" 
replace Year = "1990" if Year == "7/23/1990"   
replace Year = "1991" if Year == "7/22/1991"  
replace Year = "1992" if Year == "7/20/1992" 
replace Year = "1993" if Year == "7/5/1993" 
replace Year = "1994" if Year == "1994"
replace Year = "1995" if Year == "7/17/1995" 
replace Year = "1996" if Year == "1996 online"  
replace Year = "1997" if Year == "7/28/1997"  
replace Year = "1998" if Year == "7/6/1998"

destring Year, replace

*Dropping unnecessary variables & U.S. observations & renaming variables

drop Category CompanyNameIndustry Comments 

rename BestEstimatedWealth Wealth

drop if Country == "US" | Country == "United States"

replace Family = "1" if Family != ""
destring Family, replace  

*Standardizing some country names 
replace Country = "France/United Kingdom" if Country == "France/UK" 
replace Country = "Japan" if Country == "JApan" 
replace Country = "Saudi Arabia" if Country == "SAUDI ARABIA" 
replace Country = "Scandinavia" if Country == "Scandanavia" 
replace Country = "Taiwan" if Country == "Tawain" 
replace Country = "United Kingdom" if Country == "UK" 
replace Country = "United Arab Emirates" if Country == "UAE"  

*Saving dataset

cd "${SavePath}/statadata"
 
save "WorldBillionaires1988-1998minusUS.dta", replace  

*Saving yearly datasets 

cd "${SavePath}/statadata/yearlyminusUS2"

local years 1988 1989 1990 1991 1992 1993 1994 1995 
 
foreach i in `years' {

	use "${SavePath}/statadata/WorldBillionaires1988-1998minusUS.dta" if Year == `i', clear 
	save "`i'minusUS.dta", replace
	
 }
 
*Prepping data for matchit, adding id variable and adding year to all variables
local years 1988 1989 1990 1991 1992 1993 1994 1995 
 
foreach i in `years' {

	use "`i'minusUS.dta", clear
	
	replace Family = strpos(lower(Name), "family") > 0 if Family == . | Family == 0
	replace Family = strpos(lower(Name), "families") > 0 if Family == . | Family == 0
	replace Family = strpos(lower(Name), "brothers") > 0 if Family == . | Family == 0 
	replace Family = strpos(lower(Name), "daughters") > 0 if Family == . | Family == 0 
	replace Family = strpos(lower(Name), "wife") > 0 if Family == . | Family == 0

	replace Name = subinstr(Name, " and family", "", .) 
	replace Name = subinstr(Name, " and Family", "", .) 
	
	replace Name = subinstr(Name, " (and family)", "", .) 
	replace Name = subinstr(Name, " (and Family)", "", .)  
	
	replace Name = subinstr(Name, " And family", "", .) 
	replace Name = subinstr(Name, " And Family", "", .)  
	
	replace Name = subinstr(Name, " & family", "", .)  
	replace Name = subinstr(Name, " & Family", "", .)  
	
	replace Name = subinstr(Name, ", family", "", .) 
	replace Name = subinstr(Name, ", Family", "", .) 
	
	replace Name = subinstr(Name, " family", "", .) 
	replace Name = subinstr(Name, " Family", "", .)
	
	replace Name = subinstr(Name, ", families", "", .)
	replace Name = subinstr(Name, ", Families", "", .)
	
	replace Name = subinstr(Name, " families", "", .)
	replace Name = subinstr(Name, " Families", "", .)
	replace Name = subinstr(Name, "Families ", "", .)

	replace Name = subinstr(Name, " brothers", "", .)
	replace Name = subinstr(Name, " Brothers", "", .)
   	replace Name = subinstr(Name, "Brothers ", "", .)

	replace Name = subinstr(Name, " daughters", "", .)
	
	replace Name = subinstr(Name, " & wife", "", .)
	
	drop Year
	
	rename Name Name_`i' 
	rename Country Country_`i'
	rename Wealth Wealth_`i'
	rename Age Age_`i'
	rename Family Family_`i'
	
	destring Age_`i', replace force
	destring Wealth_`i', replace
	
	gen id_`i' = _n 
	
	save "`i'minusUS.dta", replace
	
} 
 
use "1992minusUS.dta", clear
replace Wealth_1992 = "3.2" if Name_1992 == "Garry and Galen Weston" 
destring Wealth_1992, replace 
save "1992minusUS.dta", replace 

use "1993minusUS.dta", clear
replace Wealth_1993 = "9" if Name_1993 == "Yoshiaki Tsutsumi" 
destring Wealth_1993, replace 
save "1993minusUS.dta", replace

*****************************************
*		  Data from 1996-2018			*
*****************************************

*Importing data
cd $DataPath 

forval i = 1996/2018 { 

	import delimited "${DataPath}/onlinebillionaires`i'.csv", clear 
	
	keep year name country wealth age 
	
	gen double wealth2 = wealth * 1000000000
	drop wealth
	rename wealth2 wealth
	
	order year name country wealth age 
	
	destring age, replace force
	replace name = strtrim(name) 
	replace country = strtrim(country) 
	
	gen family = strpos(lower(name), "family") > 0
	replace family = strpos(lower(name), "families") > 0 if family == . | family == 0 
	replace family = strpos(lower(name), "brothers") > 0 if family == . | family == 0 
	replace family = strpos(lower(name), "daughters") > 0 if family == . | family == 0 
	replace family = strpos(lower(name), "wife") > 0 if family == . | family == 0 

	
	replace name = subinstr(name, " and family", "", .) 
	replace name = subinstr(name, " and Family", "", .) 
	
	replace name = subinstr(name, " (and family)", "", .) 
	replace name = subinstr(name, " (and Family)", "", .)  
	
	replace name = subinstr(name, " And family", "", .) 
	replace name = subinstr(name, " And Family", "", .)  
	
	replace name = subinstr(name, " & family", "", .)  
	replace name = subinstr(name, " & Family", "", .)  
	
	replace name = subinstr(name, ", family", "", .) 
	replace name = subinstr(name, ", Family", "", .) 
	
	replace name = subinstr(name, " family", "", .) 
	replace name = subinstr(name, " Family", "", .) 
	
	replace name = subinstr(name, ", families", "", .)
	replace name = subinstr(name, ", Families", "", .)
	
	replace name = subinstr(name, " families", "", .)
	replace name = subinstr(name, " Families", "", .)
	replace name = subinstr(name, "Families ", "", .)

	replace name = subinstr(name, " brothers", "", .)
	replace name = subinstr(name, " Brothers", "", .)
   	replace name = subinstr(name, "Brothers ", "", .)

	replace name = subinstr(name, " daughters", "", .)
	
	replace name = subinstr(name, " & wife", "", .)
	
	replace country = "" if (country == "--" | country == "N/A") 
	replace country = "France/United Kingdom" if (country == "France/UK" | country == "FranceU.K.")
	replace country = "Germany" if country == "GERMANY" 
	replace country = "Saudi Arabia" if country == "Saudia Arabia" 
	replace country = "United Kingdom" if (country == "U.K." | country == "UK") 
	replace country = "United Arab Emirates" if (country == "UAE" | country == "United Arab Emi")
	replace country = "United States" if country == "USA" 
	replace country = "Switzerland" if country == "switzerland" 
	
	drop if country == "United States" 
	
	drop year
	gen id_`i' = _n
	
	
	rename name name_`i' 
	rename country country_`i'
	rename wealth wealth_`i'
	rename age age_`i'
	rename family family_`i'
	
	
	save "${SavePath}/statadata/yearlyminusUS2/`i'minusUS.dta", replace 
	
}

/*
*Doing this to check stuff in all the datasets* 
clear 

local filelist : dir "${SavePath}/statadata/yearlyminusUS2" files "*.dta"

foreach file of local filelist {

	append using "${SavePath}/statadata/yearlyminusUS2/`file'"
	
}

browse if strpos(lower(Name*), "family") > 0
*/
