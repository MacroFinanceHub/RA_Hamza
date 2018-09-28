*#################################################################################*
*																				  *
*THIS DO FILE DOES AN INITIAL DATA CLEAN & PREPARES DATASETS TO BE USED BY MATCHIT*				
*																				  *
*#################################################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

*****************************************
*		  Data from 1988-1998			*
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

cd "${SavePath}/statadata/yearlyminusUS"

local years 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 
 
foreach i in `years' {

	use "${SavePath}/statadata/WorldBillionaires1988-1998minusUS.dta" if Year == `i', clear 
	save WorldBillionaires`i'minusUS, replace
	
 }
 
*Prepping data for matchit, adding id variable and adding year to all variables
local years 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 
 
foreach i in `years' {

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
 
*****************************************
*		  Data from 1999-2015			*
*****************************************

*Importing data & creating and renaming variables so they match datasets from 1988-1989 and adding year to all variables for matchit
cd $DataPath 

local years 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 

foreach i in `years' {
	 
	import delimited "${DataPath}/billionaires`i'.csv", clear
	
	gen id_`i' = _n 
	rename year Year_`i' 
	rename name Name_`i' 
	rename country Country_`i' 
	rename age Age_`i' 

	rename net_worthrealtimemillions Wealth_Realtime_millions_`i'
	destring Wealth_Realtime_millions_`i', ignore("NA") replace
	 
	rename net_worthmillions Wealth_millions_`i' 
	destring Wealth_millions_`i', ignore("NA") replace 

	egen Wealth_`i' = rowmax(Wealth_Realtime_millions_`i' Wealth_millions_`i') 
	replace Wealth_`i' = Wealth_`i' * 1000000
	
	drop if Country_`i' == "United States" 
	
	keep id_`i' Year_`i' Name_`i' Country_`i' Age_`i' Wealth_Realtime_millions_`i' Wealth_millions_`i' Wealth_`i'
	
	cd ${SavePath}/statadata/yearlyminusUS
	
	save WorldBillionaires`i'minusUS, replace 

}


 









