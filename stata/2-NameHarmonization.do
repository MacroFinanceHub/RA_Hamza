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

use WorldBillionaires2015minusUS, clear 

matchit id_2015 Name_2015 using "WorldBillionaires2014minusUS.dta", idusing(id_2014) txtusing(Name_2014)

gsort -similscore

joinby id_2014 using WorldBillionaires2014minusUS 
joinby id_2015 using WorldBillionaires2015minusUS

order id_2015 id_2014 Name_2015 Name_2014 similscore Age_2015 Age_2014 Wealth_2015 Wealth_2014 ///
Family_2015 Family_2014 Country_2015 Country_2014 Wealth_millions_2015 Wealth_millions_2014 ///
Wealth_Realtime_millions_2015 Wealth_Realtime_millions_2014 Year_2015 Year_2014

save "${SavePath}/statadata/harmonized_names/matchit_2014_2015", replace

replace Name_2015 = "Erika Pohl-Stroher" if Name_2014 = "Erika Pohl-Stroeher"
replace Name_2015 = "" if Name_2014 = ""

*After harmonization, reshape to long format, and rename variables so they have suffix of _20142015
