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
Year_2015 Year_2014

save "${SavePath}/statadata/harmonized_names/matchit_2014_2015", replace

bys Name_2014 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

*******************************************************
*Changes in 2014 name variable 
use WorldBillionaires2014minusUS, clear

replace Name_2014 = "Erika Pohl-Stroeher" if Name_2014 == "Erika Pohl-Stroher"

*Merging with 2015 data
rename Name_2014 Name_2015 //only doing this so that I can merge!
rename Country_2014 Country_2015
rename Age_2014 Age_2015 //need to revisit this! age changes year to year so probably not valid to match on! 
merge 1:1 Name_2015 Age_2015 using WorldBillionaires2015minusUS
********************************************************
*NEED TO REVISIT THIS STUFF!!!!





*Append with 2015 data 
rename *_2014 *  

tempfile temp14 
save "`temp14'" 

use  WorldBillionaires2015minusUS, clear 
rename *_2015 * 

append using "`temp14'"

*Saving 2014-2015 dataset
save WorldBillionaires201415minusUS, replace 

*Matching with 2013 data
matchit id Name using "WorldBillionaires2013minusUS.dta", idusing(id_2013) txtusing(Name_2013)

gsort -similscore

joinby id_2013 using WorldBillionaires2013minusUS 
joinby id using WorldBillionaires201415minusUS 



*After harmonization, reshape to long format, and rename variables so they have suffix of _20142015
