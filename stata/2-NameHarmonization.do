*#############################################################*
*							                                  *
*THIS DO FILE GENERATES NAME-HARMONIZED DATASETS USING MATCHIT*				
*							  							      *
*#############################################################*

/*Start with data from 2015, matchit with data 2014, harmonize, and then repeat 
(matchit the harmonized data with 2013) until we have a completely harmonized 
dataset!*/

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

cd ${SavePath}/statadata/yearlyminusUS

*****************
*2014-2015 merge*
*****************

use WorldBillionaires2015minusUS, clear 

matchit id_2015 Name_2015 using "WorldBillionaires2014minusUS.dta", idusing(id_2014) txtusing(Name_2014)

gsort -similscore

joinby id_2014 using WorldBillionaires2014minusUS 
joinby id_2015 using WorldBillionaires2015minusUS

order id_2015 id_2014 Name_2015 Name_2014 similscore Age_2015 Age_2014 Wealth_2015 Wealth_2014 ///
Family_2015 Family_2014 Country_2015 Country_2014 Wealth_millions_2015 Wealth_millions_2014 

bys Name_2014 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-14", replace

*Changes in 2014 name variable 
use WorldBillionaires2014minusUS, clear

replace Name_2014 = "Erika Pohl-Stroeher" if Name_2014 == "Erika Pohl-Stroher"

*Merging with 2015 data
rename Name_2014 Name_2015 //only doing this so that I can merge!
rename Country_2014 Country_2015
rename Wealth_millions_2014 Wealth_millions_2015 
nearmrg Name_2015 Country_2015 using WorldBillionaires2015minusUS, nearvar(Wealth_millions_2015) genmatch(Wealth_millions_2015_real) roundup

*Renaming variables to clean dataset, use for next merge 
rename Name_2015 Name 
rename Country_2015 Country 
rename Wealth_millions_2015 Wealth_millions_2014 
rename Wealth_millions_2015_real Wealth_millions_2015 

order Name Country id_2014 id_2015 Age_2014 Age_2015 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2014 Wealth_2015 Family_2014 Family_2015  

sort Name
gen id_201415 = _n 
drop _merge 

replace Wealth_millions_2014 = 0 if Wealth_millions_2014 == . 

save "${SavePath}/statadata/harmonized_names/15-14", replace

*******************
*201415-2013 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-14"

matchit id_201415 Name using "WorldBillionaires2013minusUS.dta", idusing(id_2013) txtusing(Name_2013)

gsort -similscore

joinby id_201415 using "${SavePath}/statadata/harmonized_names/15-14"
joinby id_2013 using WorldBillionaires2013minusUS

order id_201415 id_2015 id_2014 id_2013 Name Name_2013 similscore Age_2015 Age_2014 Age_2013 Wealth_2015 Wealth_2014 Wealth_2013 ///
Family_2015 Family_2014 Family_2013 Country Country_2013 Wealth_millions_2015 Wealth_millions_2014 Wealth_millions_2013

bys Name_2013 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit_15-13", replace

*Changes in 2013 name variable 
use WorldBillionaires2013minusUS, clear

replace Name_2013 = "Alejandro Santo Domingo" if Name_2013 == "Alejandro Santo Domingo Davila"
replace Name_2013 = "Hubert d'Ornano" if Name_2013 == "Hubert D'Ornano"
replace Name_2013 = "Gina Rinehart" if Name_2013 == "Georgina Rinehart"
replace Name_2013 = "Gina Rinehart" if Name_2013 == "Georgina Rinehart"

rename Name_2013 Name //only doing this so that I can merge!
rename Country_2013 Country //only doing this so that I can merge!
rename Wealth_millions_2013 Wealth_millions_2014 //only doing this so that I can merge! will change back to 2013 

nearmrg Name Country using "${SavePath}/statadata/harmonized_names/15-14", nearvar(Wealth_millions_2014) genmatch(Wealth_millions_2014_real)  

*Renaming variables to clean dataset, use for next merge 
rename Wealth_millions_2014 Wealth_millions_2013 
rename Wealth_millions_2014_real Wealth_millions_2014

order Name Country id_2013 id_2014 id_2015 Age_2013 Age_2014 Age_2015 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2013 Wealth_2014 Wealth_2015 Family_2013 Family_2014 Family_2015  

sort Name
