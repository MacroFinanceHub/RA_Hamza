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

*Changing Wang Wei in 2015 data who is 46 years old to "Wang Wei (young)" since both Wang Wei's are from China so that it can merge 
use WorldBillionaires2015minusUS, clear
replace Name_2015 = "Wang Wei (young)" if Name_2015 == "Wang Wei" & Age_2015 == "46" 
save WorldBillionaires2015minusUS, replace

*Changes in 2014 name variable 
use WorldBillionaires2014minusUS, clear

replace Name_2014 = "Erika Pohl-Stroeher" if Name_2014 == "Erika Pohl-Stroher"

*Merging with 2015 data
rename Name_2014 Name_2015 //only doing this so that I can merge!
rename Country_2014 Country_2015
merge 1:1 Name_2015 Country_2015 using WorldBillionaires2015minusUS

*Renaming and ordering variables to clean dataset, use for next merge 
rename Name_2015 Name 
rename Country_2015 Country  

order Name Country id_2014 id_2015 Age_2014 Age_2015 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2014 Wealth_2015 Family_2014 Family_2015  

sort Name
gen id_201415 = _n 
drop _merge 

save "${SavePath}/statadata/harmonized_names/15-14", replace

*******************
*201415-2013 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-14", clear

matchit id_201415 Name using "WorldBillionaires2013minusUS.dta", idusing(id_2013) txtusing(Name_2013)

gsort -similscore

joinby id_201415 using "${SavePath}/statadata/harmonized_names/15-14"
joinby id_2013 using WorldBillionaires2013minusUS

order id_201415 id_2015 id_2014 id_2013 Name Name_2013 similscore Age_2015 Age_2014 Age_2013 Wealth_2015 Wealth_2014 Wealth_2013 ///
Family_2015 Family_2014 Family_2013 Country Country_2013 Wealth_millions_2015 Wealth_millions_2014 Wealth_millions_2013

bys Name_2013 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-13", replace

*Changes in 2013 name variable 
use WorldBillionaires2013minusUS, clear

replace Name_2013 = "Alejandro Santo Domingo" if Name_2013 == "Alejandro Santo Domingo Davila"
replace Name_2013 = "Hubert d'Ornano" if Name_2013 == "Hubert D'Ornano"
replace Name_2013 = "Gina Rinehart" if Name_2013 == "Georgina Rinehart"

*Renaming variables prior to merge 
rename Name_2013 Name //only doing this so that I can merge!
rename Country_2013 Country //only doing this so that I can merge!

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-14"

*Ordering variables 
order Name Country id_2013 id_2014 id_2015 Age_2013 Age_2014 Age_2015 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2013 Wealth_2014 Wealth_2015 Family_2013 Family_2014 Family_2015  

sort Name
gen id_201315 = _n 
drop _merge 

save "${SavePath}/statadata/harmonized_names/15-13", replace

*******************
*201315-2012 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-13", clear 

matchit id_201315 Name using "WorldBillionaires2012minusUS.dta", idusing(id_2012) txtusing(Name_2012)

joinby id_201315 using "${SavePath}/statadata/harmonized_names/15-13"
joinby id_2012 using WorldBillionaires2012minusUS

order id_201315 id_201415 id_2015 id_2014 id_2013 id_2012 Name Name_2012 similscore Age_2015 Age_2014 Age_2013 Age_2012 ///
Wealth_2015 Wealth_2014 Wealth_2013 Wealth_2012 Family_2015 Family_2014 Family_2013 Family_2012 ///
Country Country_2012 Wealth_millions_2015 Wealth_millions_2014 Wealth_millions_2013 Wealth_millions_2012

bys Name_2012 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-12", replace

*Changes in 2012 name variable 
use WorldBillionaires2012minusUS, clear

replace Name_2012 = "Guo Guangchang" if Name_2012 == "Guangchang Guo"
replace Name_2012 = "Alejandro Santo Domingo" if Name_2012 == "Alejandro Santo Domingo Davila"
replace Name_2012 = "Wang Yung-Tsai" if Name_2012 == "Wang Yung-tsai"
replace Name_2012 = "Chang-Woo Han" if Name_2012 == "Han Chang-Woo"
replace Name_2012 = "Xiu Li Hawken" if Name_2012 == "Hawken Xiu Li"
replace Name_2012 = "Hong Piow Teh" if Name_2012 == "Teh Hong Piow"
replace Name_2012 = "Tseng Shin-Yi" if Name_2012 == "Tseng Shin-yi"
replace Name_2012 = "Gina Rinehart" if Name_2012 == "Georgina Rinehart"
replace Name_2012 = "Fong Yun Wah" if Name_2012 == "Henry Fong Yun Wah"
replace Name_2012 = "Sebastian PiÃ±era" if Name_2012 == "Sebastian Pinera"
replace Name_2012 = "Law Kar Po" if Name_2012 == "Kar Po Law"

*Renaming variables used to merge 
rename Name_2012 Name 
rename Country_2012 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-13"

*Ordering variables
order Name Country id_2012 id_2013 id_2014 id_2015 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 Family_2012 Family_2013 Family_2014 Family_2015  

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 

gen id_201215 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-12", replace

*******************
*201215-2011 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-12", clear 

matchit id_201215 Name using "WorldBillionaires2011minusUS.dta", idusing(id_2011) txtusing(Name_2011)

joinby id_201215 using "${SavePath}/statadata/harmonized_names/15-12"
joinby id_2011 using WorldBillionaires2011minusUS

order id_201215 id_201315 id_201415 id_2015 id_2014 id_2013 id_2012 id_2011 ///
Name Name_2011 ///
similscore ///
Age_2015 Age_2014 Age_2013 Age_2012 Age_2011 ///
Wealth_2015 Wealth_2014 Wealth_2013 Wealth_2012 Wealth_2011 ///
Family_2015 Family_2014 Family_2013 Family_2012 Family_2011 ///
Country Country_2011 ///
Wealth_millions_2015 Wealth_millions_2014 Wealth_millions_2013 Wealth_millions_2012 Wealth_millions_2011

bys Name_2011 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-11", replace

*Changes in 2011 name variable 
use WorldBillionaires2011minusUS, clear

replace Name_2011 = "Che Jianxing" if Name_2011 == "Che Jianxin"
replace Name_2011 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2011 == "Michael & Rainer Schmidt-Ruthenbeck"
replace Name_2011 = "Alexandra Schoerghuber" if Name_2011 == "Alexandra Schorghuber"
replace Name_2011 = "Klaus-Michael Kuehne" if Name_2011 == "Klaus-Michael Kuhne"
replace Name_2011 = "Thomas Struengmann" if Name_2011 == "Thomas Strungmann"
replace Name_2011 = "Alexandre Soares dos Santos" if Name_2011 == "Eliseo Alexandre Soares dos Santos"
replace Name_2011 = "Andreas Struengmann" if Name_2011 == "Andreas Strungmann"
replace Name_2011 = "Thomas & Raymond Kwok" if Name_2011 == "Kwok Thomas & Raymond"
replace Name_2011 = "John Dorrance, III." if Name_2011 == "John Dorrance III"
replace Name_2011 = "Jean Claude Gandur" if Name_2011 == "Jean-Claude Gandur"
replace Name_2011 = "Tung Chee Chen" if Name_2011 == "Chee Chen Tung"
replace Name_2011 = "Sylvia Stroeher" if Name_2011 == "Sylvia Stroher"
replace Name_2011 = "Reinhold Wuerth" if Name_2011 == "Reinhold Wurth"
replace Name_2011 = "Hansjoerg Wyss" if Name_2011 == "Hansjorg Wyss"
replace Name_2011 = "Guenter Herz" if Name_2011 == "Gunter Herz"
replace Name_2011 = "Wang Yung-Tsai" if Name_2011 == "Wang Yung-tsai"
replace Name_2011 = "Tsai Ming-Kai" if Name_2011 == "Tsai Ming-kai"
replace Name_2011 = "Chang-Woo Han" if Name_2011 == "Han Chang-Woo"
replace Name_2011 = "Wei Ying-Chiao" if Name_2011 == "Wei Ying-chiao"
replace Name_2011 = "Elisabeth Mohn" if Name_2011 == "Elizabeth Mohn"
replace Name_2011 = "Huang Shih Tsai" if Name_2011 == "Huang Shih Tsai (Shizai)"
replace Name_2011 = "Hong Piow Teh" if Name_2011 == "Teh Hong Piow"
replace Name_2011 = "Tseng Shin-Yi" if Name_2011 == "Tseng Shin-yi"
replace Name_2011 = "Xiu Li Hawken" if Name_2011 == "Hawken Xiu Li"
replace Name_2011 = "Gina Rinehart" if Name_2011 == "Georgina Rinehart"
replace Name_2011 = "Kim Taek-Jin" if Name_2011 == "Kim Tack-Jin"
replace Name_2011 = "Fong Yun Wah" if Name_2011 == "Yun Wah Fong"
replace Name_2011 = "Sebastian PiÃ±era" if Name_2011 == "Sebastian Pinera"
replace Name_2011 = "Viatcheslav Kantor" if Name_2011 == "Vyacheslav Kantor"
replace Name_2011 = "Law Kar Po" if Name_2011 == "Kar Po Law"
replace Name_2011 = "Cheung Yan" if Name_2011 == "Yan Cheung"
replace Name_2011 = "Gerry Harvey" if Name_2011 == "Gerald Harvey"
replace Name_2011 = "Bidzina Ivanishvili" if Name_2011 == "Boris Ivanishvili"

rename Name_2011 Name 
rename Country_2011 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-12"

*Ordering variables 
order Name Country id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 

gen id_201115 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-11", replace

*******************
*201115-2010 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-11", clear

matchit id_201115 Name using "WorldBillionaires2010minusUS.dta", idusing(id_2010) txtusing(Name_2010)

joinby id_201115 using "${SavePath}/statadata/harmonized_names/15-11"
joinby id_2010 using WorldBillionaires2010minusUS

order id_201115 id_201215 id_201315 id_201415 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 ///
Name Name_2010 ///
similscore ///
Age_2015 Age_2014 Age_2013 Age_2012 Age_2011 Age_2010 ///
Wealth_2015 Wealth_2014 Wealth_2013 Wealth_2012 Wealth_2011 Wealth_2010 ///
Family_2015 Family_2014 Family_2013 Family_2012 Family_2011 Family_2010 ///
Country Country_2010 ///
Wealth_millions_2015 Wealth_millions_2014 Wealth_millions_2013 Wealth_millions_2012 Wealth_millions_2011 Wealth_millions_2010

bys Name_2010 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-10", replace

*Changes in 2010 name variable 
use WorldBillionaires2010minusUS, clear

replace Name_2010 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2010 == "Michael & Rainer Schmidt-Ruthenbeck"
replace Name_2010 = "Alexandra Schoerghuber" if Name_2010 == "Alexandra Schorghuber"
replace Name_2010 = "Thomas Struengmann" if Name_2010 == "Thomas Strungmann"
replace Name_2010 = "Klaus-Michael Kuehne" if Name_2010 == "Klaus-Michael Kuhne"
replace Name_2010 = "Andreas Struengmann" if Name_2010 == "Andreas Strungmann"
replace Name_2010 = "Thomas & Raymond Kwok" if Name_2010 == "Kwok Thomas & Raymond"
replace Name_2010 = "John Dorrance, III." if Name_2010 == "John Dorrance III"
replace Name_2010 = "Jean Claude Gandur" if Name_2010 == "Jean-Claude Gandur"
replace Name_2010 = "Reinhold Wuerth" if Name_2010 == "Reinhold Wurth"
replace Name_2010 = "Sylvia Stroeher" if Name_2010 == "Sylvia Stroher"
replace Name_2010 = "Guenter Herz" if Name_2010 == "Gunter Herz"
replace Name_2010 = "Hansjoerg Wyss" if Name_2010 == "Hansjorg Wyss"
replace Name_2010 = "Chang-Woo Han" if Name_2010 == "Han Chang-Woo"
replace Name_2010 = "Tsai Ming-Kai" if Name_2010 == "Tsai Ming-kai"
replace Name_2010 = "Elisabeth Mohn" if Name_2010 == "Elizabeth Mohn"
replace Name_2010 = "Wei Ying-Chiao" if Name_2010 == "Wei Ying-chiao"
replace Name_2010 = "Hong Piow Teh" if Name_2010 == "Teh Hong Piow"
replace Name_2010 = "Xiu Li Hawken" if Name_2010 == "Hawken Xiu Li"
replace Name_2010 = "Gina Rinehart" if Name_2010 == "Georgina Rinehart"
replace Name_2010 = "Sebastian PiÃ±era" if Name_2010 == "Sebastian Pinera"
replace Name_2010 = "Viatcheslav Kantor" if Name_2010 == "Vyacheslav Kantor"
replace Name_2010 = "Cheung Yan" if Name_2010 == "Yan Cheung"
replace Name_2010 = "Gerry Harvey" if Name_2010 == "Gerald Harvey"
replace Name_2010 = "Bidzina Ivanishvili" if Name_2010 == "Boris Ivanishvili"

rename Name_2010 Name 
rename Country_2010 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-11"

*Ordering variables 
order Name Country id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0

gen id_201015 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-10", replace

*******************
*201015-2009 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-10", clear

matchit id_201015 Name using "WorldBillionaires2009minusUS.dta", idusing(id_2009) txtusing(Name_2009)

joinby id_201015 using "${SavePath}/statadata/harmonized_names/15-10"
joinby id_2009 using WorldBillionaires2009minusUS

order id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 ///
Name Name_2009 ///
similscore ///
Age_2015 Age_2014 Age_2013 Age_2012 Age_2011 Age_2010 Age_2009 ///
Wealth_2015 Wealth_2014 Wealth_2013 Wealth_2012 Wealth_2011 Wealth_2010 Wealth_2009 ///
Country Country_2009 ///
Family_2015 Family_2014 Family_2013 Family_2012 Family_2011 Family_2010 Family_2009 ///
Wealth_millions_2015 Wealth_millions_2014 Wealth_millions_2013 Wealth_millions_2012 Wealth_millions_2011 Wealth_millions_2010 Wealth_millions_2009

bys Name_2009 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-09", replace

*Changes in 2009 name variable 
use WorldBillionaires2009minusUS, clear

replace Name_2009 = "Denis O'Brien" if Name_2009 == "Denis O''Brien"
replace Name_2009 = "Guo Guangchang" if Name_2009 == "Guangchang Guo"
replace Name_2009 = "Malvinder & Shivinder Singh" if Name_2009 == "Malvinder &#38; Shivinder Singh"
replace Name_2009 = "Alexandra Schoerghuber" if Name_2009 == "Alexandra Schorghuber"
replace Name_2009 = "Zhang Guiping" if Name_2009 == "Guiping Zhang"
replace Name_2009 = "Zhang Jindong" if Name_2009 == "Jindong Zhang"
replace Name_2009 = "Lee Myung-Hee" if Name_2009 == "Myung-Hee Lee"
replace Name_2009 = "Cheng Yu-tung" if Name_2009 == "Yu-tung Cheng"
replace Name_2009 = "Lee Shau Kee" if Name_2009 == "Shau Kee Lee"
replace Name_2009 = "Klaus-Michael Kuehne" if Name_2009 == "Klaus-Michael Kuhne"
replace Name_2009 = "Thomas Struengmann" if Name_2009 == "Thomas Strungmann"
replace Name_2009 = "Lee Kun-Hee" if Name_2009 == "Kun-Hee Lee"
replace Name_2009 = "Maria-Elisabeth & Georg Schaeffler" if Name_2009 == "Maria-Elisabeth &#38; Georg Schaeffler"
replace Name_2009 = "Andreas Struengmann" if Name_2009 == "Andreas Strungmann"
replace Name_2009 = "Sun Guangxin" if Name_2009 == "Guangxin Sun"
replace Name_2009 = "Lin Rong San" if Name_2009 == "Rong San Lin"
replace Name_2009 = "Alain & Gerard Wertheimer" if Name_2009 == "Alain &#38; Gerard Wertheimer"
replace Name_2009 = "Chu Lam Yiu" if Name_2009 == "Lam Yiu Chu"
replace Name_2009 = "Jean Claude Gandur" if Name_2009 == "Jean-Claude Gandur"
replace Name_2009 = "Sylvia Stroeher" if Name_2009 == "Sylvia Stroher"
replace Name_2009 = "Reinhold Wuerth" if Name_2009 == "Reinhold Wurth"
replace Name_2009 = "Chung Mong-Joon" if Name_2009 == "Mong-Joon Chung"
replace Name_2009 = "Lu Guanqiu" if Name_2009 == "Guanqiu Lu"
replace Name_2009 = "Martin & Olivier Bouygues" if Name_2009 == "Martin &#38; Olivier Bouygues"
replace Name_2009 = "David & Frederick Barclay" if Name_2009 == "David &#38; Frederick Barclay"
replace Name_2009 = "Guenter Herz" if Name_2009 == "Gunter Herz"
replace Name_2009 = "Hansjoerg Wyss" if Name_2009 == "Hansjorg Wyss"
replace Name_2009 = "Philip & Cristina Green" if Name_2009 == "Philip &#38; Cristina Green"
replace Name_2009 = "Shashi & Ravi Ruia" if Name_2009 == "Shashi &#38; Ravi Ruia"
replace Name_2009 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2009 == "Michael &#38; Rainer Schmidt-Ruthenbeck"
replace Name_2009 = "Liang Wengen" if Name_2009 == "Wengen Liang"
replace Name_2009 = "Chung Mong-Koo" if Name_2009 == "Mong-Koo Chung"
replace Name_2009 = "He Xiangjian" if Name_2009 == "Xiangjian He"
replace Name_2009 = "David & Simon Reuben" if Name_2009 == "David &#38; Simon Reuben"
replace Name_2009 = "Yeoh Tiong Lay" if Name_2009 == "Tiong Lay Yeoh"
replace Name_2009 = "Shen Wenrong" if Name_2009 == "Wenrong Shen"
replace Name_2009 = "Wang Chuanfu" if Name_2009 == "Chuanfu Wang"
replace Name_2009 = "Lee Shin Cheng" if Name_2009 == "Shin Cheng Lee"
replace Name_2009 = "Quek Leng Chan" if Name_2009 == "Leng Chan Quek"
replace Name_2009 = "Ayman Hariri" if Name_2009 == "Aymin Hariri"
replace Name_2009 = "Liu Yongxing" if Name_2009 == "Yongxing Liu"
replace Name_2009 = "Zhou Chengjian" if Name_2009 == "Chengjian Zhou"
replace Name_2009 = "Chen Din Hwa" if Name_2009 == "Din Hwa Chen"
replace Name_2009 = "Li Sze Lim" if Name_2009 == "Sze Lim Li"
replace Name_2009 = "Yang Huiyan" if Name_2009 == "Huiyan Yang"
replace Name_2009 = "Alberto Bailleres Gonzalez" if Name_2009 == "Alberto Bailleres"
replace Name_2009 = "Ferit Faik Sahenk" if Name_2009 == "Ferit Sahenk"
replace Name_2009 = "Tsai Wan-tsai" if Name_2009 == "Wan-Tsai Tsai"
replace Name_2009 = "Gina Rinehart" if Name_2009 == "Georgina Rinehart"
replace Name_2009 = "Hui Wing Mau" if Name_2009 == "Wing Mau Hui"
replace Name_2009 = "Cho Tak Wong" if Name_2009 == "Tak Wong Cho"
replace Name_2009 = "Or Wai Sheun" if Name_2009 == "Wai Sheun Or"
replace Name_2009 = "Huang Rulun" if Name_2009 == "Rulun Huang"
replace Name_2009 = "Lu Zhiqiang" if Name_2009 == "Zhiqiang Lu"
replace Name_2009 = "Li Ka-shing" if Name_2009 == "Ka-shing Li"
replace Name_2009 = "Sebastian PiÃ±era" if Name_2009 == "Sebastian Pinera"
replace Name_2009 = "Chen Fashu" if Name_2009 == "Fashu Chen"
replace Name_2009 = "Ma Huateng" if Name_2009 == "Huateng Ma"
replace Name_2009 = "Zhou Furen" if Name_2009 == "Furen Zhou"
replace Name_2009 = "John Dorrance, III." if Name_2009 == "John Dorrance"
replace Name_2009 = "Shi Yuzhu" if Name_2009 == "Yuzhu Shi"
replace Name_2009 = "Zhang Li" if Name_2009 == "Li Zhang"
replace Name_2009 = "Tang Yiu" if Name_2009 == "Yiu Tang"
replace Name_2009 = "Tsai Eng-Meng" if Name_2009 == "Eng Meng Tsai"
replace Name_2009 = "Bidzina Ivanishvili" if Name_2009 == "Boris Ivanishvili"

rename Name_2009 Name 
rename Country_2009 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-10"

*Ordering variables 
order Name Country id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0

gen id_200915 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-09", replace

*******************
*200915-2008 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-09", clear

matchit id_200915 Name using "WorldBillionaires2008minusUS.dta", idusing(id_2008) txtusing(Name_2008)

joinby id_200915 using "${SavePath}/statadata/harmonized_names/15-09"
joinby id_2008 using WorldBillionaires2008minusUS

order id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_2008 ///
Name Name_2008 ///
similscore ///
Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_2008 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-08", replace

*Changes in 2008 name variable 
use WorldBillionaires2008minusUS, clear

replace Name_2008 = "Denis O'Brien" if Name_2008 == "Denis O''Brien"
replace Name_2008 = "Guo Guangchang" if Name_2008 == "Guangchang Guo"
replace Name_2008 = "Tiong Hiew King" if Name_2008 == "Hiew King Tiong"
replace Name_2008 = "Malvinder & Shivinder Singh" if Name_2008 == "Malvinder &#38; Shivinder Singh"
replace Name_2008 = "Cheng Yu-tung" if Name_2008 == "Yu-tung Cheng"
replace Name_2008 = "Shin Dong-Bin" if Name_2008 == "Dong-Bin Shin"
replace Name_2008 = "Geng Jianming" if Name_2008 == "Jianming Geng"
replace Name_2008 = "Lee Myung-Hee" if Name_2008 == "Myung-Hee Lee"
replace Name_2008 = "Zhang Guiping" if Name_2008 == "Guiping Zhang"
replace Name_2008 = "Zhang Jindong" if Name_2008 == "Jindong Zhang"
replace Name_2008 = "Lee Shau Kee" if Name_2008 == "Shau Kee Lee"
replace Name_2008 = "Klaus-Michael Kuehne" if Name_2008 == "Klaus-Michael Kuhne"
replace Name_2008 = "Thomas Struengmann" if Name_2008 == "Thomas Strungmann"
replace Name_2008 = "Koo Bon-Moo" if Name_2008 == "Bon-Moo Koo"
replace Name_2008 = "Lee Kun-Hee" if Name_2008 == "Kun-Hee Lee"
replace Name_2008 = "Maria-Elisabeth & Georg Schaeffler" if Name_2008 == "Maria-Elisabeth &#38; Georg Schaeffler"
replace Name_2008 = "Andreas Struengmann" if Name_2008 == "Andreas Strungmann"
replace Name_2008 = "Sun Guangxin" if Name_2008 == "Guangxin Sun"
replace Name_2008 = "Alain & Gerard Wertheimer" if Name_2008 == "Alain &#38; Gerard Wertheimer"
replace Name_2008 = "Chu Lam Yiu" if Name_2008 == "Lam Yiu Chu"
replace Name_2008 = "Jean Claude Gandur" if Name_2008 == "Jean-Claude Gandur"
replace Name_2008 = "Sylvia Stroeher" if Name_2008 == "Sylvia Stroher"
replace Name_2008 = "Reinhold Wuerth" if Name_2008 == "Reinhold Wurth"
replace Name_2008 = "Chung Mong-Joon" if Name_2008 == "Mong-Joon Chung"
replace Name_2008 = "Lu Guanqiu" if Name_2008 == "Guanqiu Lu"
replace Name_2008 = "David & Frederick Barclay" if Name_2008 == "David &#38; Frederick Barclay"
replace Name_2008 = "Martin & Olivier Bouygues" if Name_2008 == "Martin &#38; Olivier Bouygues"
replace Name_2008 = "Zhang Cheng Fei" if Name_2008 == "Cheng Fei Zhang"
replace Name_2008 = "Hansjoerg Wyss" if Name_2008 == "Hansjorg Wyss"
replace Name_2008 = "Guenter Herz" if Name_2008 == "Gunter Herz"
replace Name_2008 = "Philip & Cristina Green" if Name_2008 == "Philip &#38; Cristina Green"
replace Name_2008 = "Liu Ming Chung" if Name_2008 == "Ming Chung Liu"
replace Name_2008 = "Shashi & Ravi Ruia" if Name_2008 == "Shashi &#38; Ravi Ruia"
replace Name_2008 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2008 == "Michael &#38; Rainer Schmidt-Ruthenbeck"
replace Name_2008 = "He Xiangjian" if Name_2008 == "Xiangjian He"
replace Name_2008 = "Chung Mong-Koo" if Name_2008 == "Mong-Koo Chung"
replace Name_2008 = "Liang Wengen" if Name_2008 == "Wengen Liang"
replace Name_2008 = "David & Simon Reuben" if Name_2008 == "David &#38; Simon Reuben"
replace Name_2008 = "Vladimir Iorich" if Name_2008 == "Vladimir Iorikh"
replace Name_2008 = "Lee Shin Cheng" if Name_2008 == "Shin Cheng Lee"
replace Name_2008 = "Liu Yongxing" if Name_2008 == "Yongxing Liu"
replace Name_2008 = "Shen Wenrong" if Name_2008 == "Wenrong Shen"
replace Name_2008 = "Yeoh Tiong Lay" if Name_2008 == "Tiong Lay Yeoh"
replace Name_2008 = "Quek Leng Chan" if Name_2008 == "Leng Chan Quek"
replace Name_2008 = "Ayman Hariri" if Name_2008 == "Aymin Hariri"
replace Name_2008 = "Semahat Sevim Arsel" if Name_2008 == "Semahat Arsel"
replace Name_2008 = "Chen Din Hwa" if Name_2008 == "Din Hwa Chen"
replace Name_2008 = "Li Sze Lim" if Name_2008 == "Sze Lim Li"
replace Name_2008 = "Shin Dong-Joo" if Name_2008 == "Dong-Joo Shin"
replace Name_2008 = "Yang Huiyan" if Name_2008 == "Huiyan Yang"
replace Name_2008 = "Suh Kyung-Bae" if Name_2008 == "Kyung-Bae Suh"
replace Name_2008 = "Alberto Bailleres Gonzalez" if Name_2008 == "Alberto Bailleres"
replace Name_2008 = "Ferit Faik Sahenk" if Name_2008 == "Ferit Sahenk"
replace Name_2008 = "Tsai Wan-tsai" if Name_2008 == "Wan-Tsai Tsai"
replace Name_2008 = "Gina Rinehart" if Name_2008 == "Georgina Rinehart"
replace Name_2008 = "Hui Wing Mau" if Name_2008 == "Wing Mau Hui"
replace Name_2008 = "Chu Mang Yee" if Name_2008 == "Mang Yee Chu"
replace Name_2008 = "Or Wai Sheun" if Name_2008 == "Wai Sheun Or"
replace Name_2008 = "Tsai Hong-tu" if Name_2008 == "Hong-tu Tsai"
replace Name_2008 = "Cho Tak Wong" if Name_2008 == "Tak Wong Cho"
replace Name_2008 = "Li Ka-shing" if Name_2008 == "Ka-shing Li"
replace Name_2008 = "Lui Che Woo" if Name_2008 == "Che Woo Lui"
replace Name_2008 = "Lu Zhiqiang" if Name_2008 == "Zhiqiang Lu"
replace Name_2008 = "Huang Rulun" if Name_2008 == "Rulun Huang"
replace Name_2008 = "Xian Yang" if Name_2008 == "Yang Xian"
replace Name_2008 = "Sebastian PiÃ±era" if Name_2008 == "Sebastian Pinera"
replace Name_2008 = "Viatcheslav Kantor" if Name_2008 == "Vyacheslav Kantor"
replace Name_2008 = "Cheung Yan" if Name_2008 == "Yan Cheung"
replace Name_2008 = "Ma Huateng" if Name_2008 == "Huateng Ma"
replace Name_2008 = "Chen Fashu" if Name_2008 == "Fashu Chen"
replace Name_2008 = "Gao Dekang" if Name_2008 == "Dekang Gao"
replace Name_2008 = "John Dorrance, III." if Name_2008 == "John Dorrance"
replace Name_2008 = "Shi Yuzhu" if Name_2008 == "Yuzhu Shi"
replace Name_2008 = "Tang Yiu" if Name_2008 == "Yiu Tang"
replace Name_2008 = "Zhang Li" if Name_2008 == "Li Zhang"
replace Name_2008 = "Mustafa Rahmi Koc" if Name_2008 == "Rahmi Koc"
replace Name_2008 = "Gerry Harvey" if Name_2008 == "Gerald Harvey"
replace Name_2008 = "Tsai Eng-Meng" if Name_2008 == "Eng Meng Tsai"
replace Name_2008 = "Bidzina Ivanishvili" if Name_2008 == "Boris Ivanishvili"

rename Name_2008 Name 
rename Country_2008 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-09"

*Ordering variables 
order Name Country id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0

gen id_200815 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-08", replace

*******************
*200815-2007 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-08", clear

matchit id_200815 Name using "WorldBillionaires2007minusUS.dta", idusing(id_2007) txtusing(Name_2007)

joinby id_200815 using "${SavePath}/statadata/harmonized_names/15-08"
joinby id_2007 using WorldBillionaires2007minusUS

order id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_2007 ///
Name Name_2007 ///
similscore ///
Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_2007 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-07", replace

*Changes in 2007 name variable 
use WorldBillionaires2007minusUS, clear

replace Name_2007 = "Guo Guangchang" if Name_2007 == "Guangchang Guo"
replace Name_2007 = "Tiong Hiew King" if Name_2007 == "Hiew King Tiong"
replace Name_2007 = "Malvinder & Shivinder Singh" if Name_2007 == "Malvinder &#38; Shivinder Singh"
replace Name_2007 = "Lee Myung-Hee" if Name_2007 == "Myung-Hee Lee"
replace Name_2007 = "Zhang Jindong" if Name_2007 == "Jindong Zhang"
replace Name_2007 = "Shin Dong-Bin" if Name_2007 == "Dong-Bin Shin"
replace Name_2007 = "Cheng Yu-tung" if Name_2007 == "Yu-tung Cheng"
replace Name_2007 = "Lee Shau Kee" if Name_2007 == "Shau Kee Lee"
replace Name_2007 = "Thomas Struengmann" if Name_2007 == "Thomas Strungmann"
replace Name_2007 = "Klaus-Michael Kuehne" if Name_2007 == "Klaus-Michael Kuhne"
replace Name_2007 = "Lee Kun-Hee" if Name_2007 == "Kun-Hee Lee"
replace Name_2007 = "Maria-Elisabeth & Georg Schaeffler" if Name_2007 == "Maria-Elisabeth &#38; Georg Schaeffler"
replace Name_2007 = "Andreas Struengmann" if Name_2007 == "Andreas Strungmann"
replace Name_2007 = "Alain & Gerard Wertheimer" if Name_2007 == "Alain &#38; Gerard Wertheimer"
replace Name_2007 = "Chu Lam Yiu" if Name_2007 == "Lam Yiu Chu"
replace Name_2007 = "Sylvia Stroeher" if Name_2007 == "Sylvia Stroher"
replace Name_2007 = "Reinhold Wuerth" if Name_2007 == "Reinhold Wurth"
replace Name_2007 = "Lu Guanqiu" if Name_2007 == "Guanqiu Lu"
replace Name_2007 = "Chung Mong-Joon" if Name_2007 == "Mong-Joon Chung"
replace Name_2007 = "David & Frederick Barclay" if Name_2007 == "David &#38; Frederick Barclay"
replace Name_2007 = "Martin & Olivier Bouygues" if Name_2007 == "Martin &#38; Olivier Bouygues"
replace Name_2007 = "Zhang Cheng Fei" if Name_2007 == "Cheng Fei Zhang"
replace Name_2007 = "Guenter Herz" if Name_2007 == "Gunter Herz"
replace Name_2007 = "Philip & Cristina Green" if Name_2007 == "Philip &#38; Cristina Green"
replace Name_2007 = "Liu Ming Chung" if Name_2007 == "Ming Chung Liu"
replace Name_2007 = "Shashi & Ravi Ruia" if Name_2007 == "Shashi &#38; Ravi Ruia"
replace Name_2007 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2007 == "Michael &#38; Rainer Schmidt-Ruthenbeck"
replace Name_2007 = "Liang Wengen" if Name_2007 == "Wengen Liang"
replace Name_2007 = "Chung Mong-Koo" if Name_2007 == "Mong-Koo Chung"
replace Name_2007 = "David & Simon Reuben" if Name_2007 == "David &#38; Simon Reuben"
replace Name_2007 = "Vladimir Iorich" if Name_2007 == "Vladimir Iorikh"
replace Name_2007 = "Yeoh Tiong Lay" if Name_2007 == "Tiong Lay Yeoh"
replace Name_2007 = "Liu Yongxing" if Name_2007 == "Yongxing Liu"
replace Name_2007 = "Lee Shin Cheng" if Name_2007 == "Shin Cheng Lee"
replace Name_2007 = "Ayman Hariri" if Name_2007 == "Aymin Hariri"
replace Name_2007 = "Quek Leng Chan" if Name_2007 == "Leng Chan Quek"
replace Name_2007 = "Semahat Sevim Arsel" if Name_2007 == "Semahat Arsel"
replace Name_2007 = "Li Sze Lim" if Name_2007 == "Sze Lim Li"
replace Name_2007 = "Chen Din Hwa" if Name_2007 == "Din Hwa Chen"
replace Name_2007 = "Shin Dong-Joo" if Name_2007 == "Dong-Joo Shin"
replace Name_2007 = "Suh Kyung-Bae" if Name_2007 == "Kyung-Bae Suh"
replace Name_2007 = "Alberto Bailleres Gonzalez" if Name_2007 == "Alberto Bailleres"
replace Name_2007 = "Ferit Faik Sahenk" if Name_2007 == "Ferit Sahenk"
replace Name_2007 = "Tsai Wan-tsai" if Name_2007 == "Wan-Tsai Tsai"
replace Name_2007 = "Gina Rinehart" if Name_2007 == "Georgina Rinehart"
replace Name_2007 = "Or Wai Sheun" if Name_2007 == "Wai Sheun Or"
replace Name_2007 = "Chu Mang Yee" if Name_2007 == "Mang Yee Chu"
replace Name_2007 = "Cho Tak Wong" if Name_2007 == "Tak Wong Cho"
replace Name_2007 = "Tsai Hong-tu" if Name_2007 == "Hong-tu Tsai"
replace Name_2007 = "Hui Wing Mau" if Name_2007 == "Wing Mau Hui"
replace Name_2007 = "Lui Che Woo" if Name_2007 == "Che Woo Lui"
replace Name_2007 = "Wee Cho Yaw" if Name_2007 == "Cho Yaw Wee"
replace Name_2007 = "Li Ka-shing" if Name_2007 == "Ka-shing Li"
replace Name_2007 = "Sebastian PiÃ±era" if Name_2007 == "Sebastian Pinera"
replace Name_2007 = "Viatcheslav Kantor" if Name_2007 == "Vyacheslav Kantor"
replace Name_2007 = "Zhong Sheng Jian" if Name_2007 == "Sheng jian Zhong"
replace Name_2007 = "Chen Fashu" if Name_2007 == "Fashu Chen"
replace Name_2007 = "Cheung Yan" if Name_2007 == "Yan Cheung"
replace Name_2007 = "John Dorrance, III." if Name_2007 == "John Dorrance"
replace Name_2007 = "Zhang Li" if Name_2007 == "Li Zhang"
replace Name_2007 = "Mustafa Rahmi Koc" if Name_2007 == "Rahmi Koc"
replace Name_2007 = "Gerry Harvey" if Name_2007 == "Gerald Harvey"
replace Name_2007 = "Tsai Eng-Meng" if Name_2007 == "Eng Meng Tsai"
replace Name_2007 = "Bidzina Ivanishvili" if Name_2007 == "Boris Ivanishvili"

rename Name_2007 Name 
rename Country_2007 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-08"

*Ordering variables 
order Name Country id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 //38 duplicates up to this point

gen id_200715 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-07", replace

*******************
*200715-2006 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-07", clear

matchit id_200715 Name using "WorldBillionaires2006minusUS.dta", idusing(id_2006) txtusing(Name_2006)

joinby id_200715 using "${SavePath}/statadata/harmonized_names/15-07"
joinby id_2006 using WorldBillionaires2006minusUS

order id_200715 id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_2006 ///
Name Name_2006 ///
similscore ///
Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_2006 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-06", replace

*Changes in 2006 name variable 
use WorldBillionaires2006minusUS, clear

replace Name_2006 = "Guo Guangchang" if Name_2006 == "Guangchang Guo"
replace Name_2006 = "Tiong Hiew King" if Name_2006 == "Hiew King Tiong"
replace Name_2006 = "Lee Myung-Hee" if Name_2006 == "Myung-Hee Lee"
replace Name_2006 = "Cheng Yu-tung" if Name_2006 == "Yu-tung Cheng"
replace Name_2006 = "Lee Shau Kee" if Name_2006 == "Shau Kee Lee"
replace Name_2006 = "Klaus-Michael Kuehne" if Name_2006 == "Klaus-Michael Kuhne"
replace Name_2006 = "Thomas Struengmann" if Name_2006 == "Thomas Strungmann"
replace Name_2006 = "Lee Kun-Hee" if Name_2006 == "Kun-Hee Lee"
replace Name_2006 = "Maria-Elisabeth & Georg Schaeffler" if Name_2006 == "Maria-Elisabeth &#38; Georg Schaeffler"
replace Name_2006 = "Andreas Struengmann" if Name_2006 == "Andreas Strungmann"
replace Name_2006 = "Alain & Gerard Wertheimer" if Name_2006 == "Alain &#38; Gerard Wertheimer"
replace Name_2006 = "Cher Wang & Wenchi Chen" if Name_2006 == "Cher Wang &#38; Wenchi Chen"
replace Name_2006 = "Sylvia Stroeher" if Name_2006 == "Sylvia Stroher"
replace Name_2006 = "Reinhold Wuerth" if Name_2006 == "Reinhold Wurth"
replace Name_2006 = "David & Frederick Barclay" if Name_2006 == "David &#38; Frederick Barclay"
replace Name_2006 = "Martin & Olivier Bouygues" if Name_2006 == "Martin &#38; Olivier Bouygues"
replace Name_2006 = "Guenter Herz" if Name_2006 == "Gunter Herz"
replace Name_2006 = "Philip & Cristina Green" if Name_2006 == "Philip &#38; Cristina Green"
replace Name_2006 = "Shashi & Ravi Ruia" if Name_2006 == "Shashi &#38; Ravi Ruia"
replace Name_2006 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2006 == "Michael &#38; Rainer Schmidt-Ruthenbeck"
replace Name_2006 = "Chung Mong-Koo" if Name_2006 == "Mong-Koo Chung"
replace Name_2006 = "David & Simon Reuben" if Name_2006 == "David &#38; Simon Reuben"
replace Name_2006 = "Vladimir Iorich" if Name_2006 == "Vladimir Iorikh"
replace Name_2006 = "Liu Yongxing" if Name_2006 == "Yongxing Liu"
replace Name_2006 = "Quek Leng Chan" if Name_2006 == "Leng Chan Quek"
replace Name_2006 = "Lee Shin Cheng" if Name_2006 == "Shin Cheng Lee"
replace Name_2006 = "Ayman Hariri" if Name_2006 == "Aymin Hariri"
replace Name_2006 = "Yeoh Tiong Lay" if Name_2006 == "Tiong Lay Yeoh"
replace Name_2006 = "Semahat Sevim Arsel" if Name_2006 == "Semahat Arsel"
replace Name_2006 = "Chen Din Hwa" if Name_2006 == "Din Hwa Chen"
replace Name_2006 = "Alberto Bailleres Gonzalez" if Name_2006 == "Alberto Bailleres"
replace Name_2006 = "Ferit Faik Sahenk" if Name_2006 == "Ferit Sahenk"
replace Name_2006 = "Tsai Wan-tsai" if Name_2006 == "Wan-Tsai Tsai"
replace Name_2006 = "Chu Mang Yee" if Name_2006 == "Mang Yee Chu"
replace Name_2006 = "Hui Wing Mau" if Name_2006 == "Wing Mau Hui"
replace Name_2006 = "Li Ka-shing" if Name_2006 == "Ka-shing Li"
replace Name_2006 = "Wee Cho Yaw" if Name_2006 == "Cho Yaw Wee"
replace Name_2006 = "Lui Che Woo" if Name_2006 == "Che Woo Lui"
replace Name_2006 = "John Dorrance, III." if Name_2006 == "John Dorrance"
replace Name_2006 = "Mustafa Rahmi Koc" if Name_2006 == "Rahmi Koc"
replace Name_2006 = "Bidzina Ivanishvili" if Name_2006 == "Boris Ivanishvili"

rename Name_2006 Name 
rename Country_2006 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-07"

*Ordering variables 
order Name Country id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 //42 duplicates up to this point

gen id_200615 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-06", replace

*******************
*200615-2005 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-06", clear

matchit id_200615 Name using "WorldBillionaires2005minusUS.dta", idusing(id_2005) txtusing(Name_2005)

joinby id_200615 using "${SavePath}/statadata/harmonized_names/15-06"
joinby id_2005 using WorldBillionaires2005minusUS

order id_200615 id_200715 id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_2005 ///
Name Name_2005 ///
similscore ///
Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_2005 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-05", replace

*Changes in 2005 name variable 
use WorldBillionaires2005minusUS, clear

replace Name_2005 = "Tiong Hiew King" if Name_2005 == "Hiew King Tiong"
replace Name_2005 = "Cheng Yu-tung" if Name_2005 == "Yu-tung Cheng"
replace Name_2005 = "Lee Shau Kee" if Name_2005 == "Shau Kee Lee"
replace Name_2005 = "Klaus-Michael Kuehne" if Name_2005 == "Klaus-Michael Kuhne"
replace Name_2005 = "Thomas Struengmann" if Name_2005 == "Thomas Strungmann"
replace Name_2005 = "Lee Kun-Hee" if Name_2005 == "Kun-Hee Lee"
replace Name_2005 = "Maria-Elisabeth & Georg Schaeffler" if Name_2005 == "Maria-Elisabeth &#38; Georg Schaeffler"
replace Name_2005 = "Andreas Struengmann" if Name_2005 == "Andreas Strungmann"
replace Name_2005 = "Alain & Gerard Wertheimer" if Name_2005 == "Alain &#38; Gerard Wertheimer"
replace Name_2005 = "Reinhold Wuerth" if Name_2005 == "Reinhold Wurth"
replace Name_2005 = "Sylvia Stroeher" if Name_2005 == "Sylvia Stroher"
replace Name_2005 = "Martin & Olivier Bouygues" if Name_2005 == "Martin &#38; Olivier Bouygues"
replace Name_2005 = "David & Frederick Barclay" if Name_2005 == "David &#38; Frederick Barclay"
replace Name_2005 = "Guenter Herz" if Name_2005 == "Gunter Herz"
replace Name_2005 = "Philip & Cristina Green" if Name_2005 == "Philip &#38; Cristina Green"
replace Name_2005 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2005 == "Michael &#38; Rainer Schmidt-Ruthenbeck"
replace Name_2005 = "Chang Yung Fa" if Name_2005 == "Yung Fa Chang"
replace Name_2005 = "Chung Mong-Koo" if Name_2005 == "Mong-Koo Chung"
replace Name_2005 = "Vladimir Iorich" if Name_2005 == "Vladimir Iorikh"
replace Name_2005 = "Quek Leng Chan" if Name_2005 == "Leng Chan Quek"
replace Name_2005 = "Chen Din Hwa" if Name_2005 == "Din Hwa Chen"
replace Name_2005 = "Alberto Bailleres Gonzalez" if Name_2005 == "Alberto Bailleres"
replace Name_2005 = "Ferit Faik Sahenk" if Name_2005 == "Ferit Sahenk"
replace Name_2005 = "Tsai Wan-tsai" if Name_2005 == "Wan-Tsai Tsai"
replace Name_2005 = "Li Ka-shing" if Name_2005 == "Ka-shing Li"
replace Name_2005 = "Wee Cho Yaw" if Name_2005 == "Cho Yaw Wee"
replace Name_2005 = "John Dorrance, III." if Name_2005 == "John Dorrance"
replace Name_2005 = "Mustafa Rahmi Koc" if Name_2005 == "Rahmi Koc"
replace Name_2005 = "Bidzina Ivanishvili" if Name_2005 == "Boris Ivanishvili"

rename Name_2005 Name 
rename Country_2005 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-06"

*Ordering variables 
order Name Country id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 //46 name duplicates up to this point

gen id_200515 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-05", replace

*******************
*200515-2004 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-05", clear

matchit id_200515 Name using "WorldBillionaires2004minusUS.dta", idusing(id_2004) txtusing(Name_2004)

joinby id_200515 using "${SavePath}/statadata/harmonized_names/15-05"
joinby id_2004 using WorldBillionaires2004minusUS

order id_200515 id_200615 id_200715 id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_2004 ///
Name Name_2004 ///
similscore ///
Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_2004 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-04", replace

*Changes in 2004 name variable 
use WorldBillionaires2004minusUS, clear

replace Name_2004 = "Tiong Hiew King" if Name_2004 == "Hiew King Tiong"
replace Name_2004 = "Cheng Yu-tung" if Name_2004 == "Yu-tung Cheng"
replace Name_2004 = "Lee Shau Kee" if Name_2004 == "Shau Kee Lee"
replace Name_2004 = "Klaus-Michael Kuehne" if Name_2004 == "Klaus-Michael Kuhne"
replace Name_2004 = "Lee Kun-Hee" if Name_2004 == "Kun-Hee Lee"
replace Name_2004 = "Maria-Elisabeth & Georg Schaeffler" if Name_2004 == "Maria-Elisabeth &#38; Georg Schaeffler"\
replace Name_2004 = "Alain & Gerard Wertheimer" if Name_2004 == "Alain &#38; Gerard Wertheimer"
replace Name_2004 = "Reinhold Wuerth" if Name_2004 == "Reinhold Wurth"
replace Name_2004 = "Sylvia Stroeher" if Name_2004 == "Sylvia Stroher"
replace Name_2004 = "David & Frederick Barclay" if Name_2004 == "David &#38; Frederick Barclay"
replace Name_2004 = "Martin & Olivier Bouygues" if Name_2004 == "Martin &#38; Olivier Bouygues"
replace Name_2004 = "Guenter Herz" if Name_2004 == "Gunter Herz"
replace Name_2004 = "Philip & Cristina Green" if Name_2004 == "Philip &#38; Cristina Green"
replace Name_2004 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2004 == "Michael &#38; Rainer Schmidt-Ruthenbeck"
replace Name_2004 = "Chang Yung Fa" if Name_2004 == "Yung Fa Chang"
replace Name_2004 = "Quek Leng Chan" if Name_2004 == "Leng Chan Quek"
replace Name_2004 = "Chen Din Hwa" if Name_2004 == "Din Hwa Chen"
replace Name_2004 = "Alberto Bailleres Gonzalez" if Name_2004 == "Alberto Bailleres"
replace Name_2004 = "Ferit Faik Sahenk" if Name_2004 == "Ferit Sahenk"
replace Name_2004 = "Tsai Wan-tsai" if Name_2004 == "Wan-Tsai Tsai"
replace Name_2004 = "Li Ka-shing" if Name_2004 == "Ka-shing Li"
replace Name_2004 = "Wee Cho Yaw" if Name_2004 == "Cho Yaw Wee"
replace Name_2004 = "John Dorrance, III." if Name_2004 == "John Dorrance"
replace Name_2004 = "Mustafa Rahmi Koc" if Name_2004 == "Rahmi Koc"

rename Name_2004 Name 
rename Country_2004 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-05"

*Ordering variables 
order Name Country id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 //50 name duplicates up to this point

gen id_200415 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-04", replace

*******************
*200415-2003 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-04", clear

matchit id_200415 Name using "WorldBillionaires2003minusUS.dta", idusing(id_2003) txtusing(Name_2003)

joinby id_200415 using "${SavePath}/statadata/harmonized_names/15-04"
joinby id_2003 using WorldBillionaires2003minusUS

order id_200415 id_200515 id_200615 id_200715 id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_2003 ///
Name Name_2003 ///
similscore ///
Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_2003 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-03", replace

*Changes in 2003 name variable 
use WorldBillionaires2003minusUS, clear

replace Name_2003 = "Cheng Yu-tung" if Name_2003 == "Yu-tung Cheng"
replace Name_2003 = "Lee Shau Kee" if Name_2003 == "Shau Kee Lee"
replace Name_2003 = "Klaus-Michael Kuehne" if Name_2003 == "Klaus-Michael Kuhne"
replace Name_2003 = "Lee Kun-Hee" if Name_2003 == "Kun-Hee Lee"
replace Name_2003 = "Maria-Elisabeth & Georg Schaeffler" if Name_2003 == "Maria-Elisabeth &#38; Georg Schaeffler"\
replace Name_2003 = "Alain & Gerard Wertheimer" if Name_2003 == "Alain &#38; Gerard Wertheimer"
replace Name_2003 = "Reinhold Wuerth" if Name_2003 == "Reinhold Wurth"
replace Name_2003 = "Martin & Olivier Bouygues" if Name_2003 == "Martin &#38; Olivier Bouygues"
replace Name_2003 = "Guenter Herz" if Name_2003 == "Gunter Herz"
replace Name_2003 = "Quek Leng Chan" if Name_2003 == "Leng Chan Quek"
replace Name_2003 = "Chen Din Hwa" if Name_2003 == "Din Hwa Chen"
replace Name_2003 = "Alberto Bailleres Gonzalez" if Name_2003 == "Alberto Bailleres"
replace Name_2003 = "Ferit Faik Sahenk" if Name_2003 == "Ferit Sahenk"
replace Name_2003 = "Tsai Wan-tsai" if Name_2003 == "Wan-Tsai Tsai"
replace Name_2003 = "Wei Yin-Chun" if Name_2003 == "Yin-Chun Wei"
replace Name_2003 = "Wu Chung-Yi" if Name_2003 == "Wu Chung-yi"
replace Name_2003 = "Li Ka-shing" if Name_2003 == "Ka-shing Li"
replace Name_2003 = "Wee Cho Yaw" if Name_2003 == "Cho Yaw Wee"
replace Name_2003 = "John Dorrance, III." if Name_2003 == "John Dorrance"
replace Name_2003 = "Mustafa Rahmi Koc" if Name_2003 == "Rahmi Koc"

rename Name_2003 Name 
rename Country_2003 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-04"

*Ordering variables 
order Name Country id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 //50 name duplicates up to this point

gen id_200315 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-03", replace

*******************
*200315-2002 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-03", clear

matchit id_200315 Name using "WorldBillionaires2002minusUS.dta", idusing(id_2002) txtusing(Name_2002)

joinby id_200315 using "${SavePath}/statadata/harmonized_names/15-03"
joinby id_2002 using WorldBillionaires2002minusUS

order id_200315 id_200415 id_200515 id_200615 id_200715 id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_2002 ///
Name Name_2002 ///
similscore ///
Age_2002 Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_2002 Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2002 Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_2002 Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_2002 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-02", replace

*Changes in 2002 name variable 
use WorldBillionaires2002minusUS, clear

replace Name_2002 = "Cheng Yu-tung" if Name_2002 == "Yu-tung Cheng"
replace Name_2002 = "Lee Shau Kee" if Name_2002 == "Shau Kee Lee"
replace Name_2002 = "Lee Kun-Hee" if Name_2002 == "Kun-Hee Lee"
replace Name_2002 = "Alain & Gerard Wertheimer" if Name_2002 == "Alain &#38; Gerard Wertheimer"
replace Name_2002 = "Reinhold Wuerth" if Name_2002 == "Reinhold Wurth"
replace Name_2002 = "Martin & Olivier Bouygues" if Name_2002 == "Martin &#38; Olivier Bouygues"
replace Name_2002 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2002 == "Michael &#38; Rainer Schmidt-Ruthenbeck"
replace Name_2002 = "Liu Yongxing" if Name_2002 == "Yongxing Liu"
replace Name_2002 = "Quek Leng Chan" if Name_2002 == "Leng Chan Quek"
replace Name_2002 = "Yeoh Tiong Lay" if Name_2002 == "Tiong Lay Yeoh"
replace Name_2002 = "Chen Din Hwa" if Name_2002 == "Din Hwa Chen"
replace Name_2002 = "Alberto Bailleres Gonzalez" if Name_2002 == "Alberto Bailleres"
replace Name_2002 = "Ferit Faik Sahenk" if Name_2002 == "Ferit Sahenk"
replace Name_2002 = "Wei Yin-Chun" if Name_2002 == "Yin-Chun Wei"
replace Name_2002 = "Wee Cho Yaw" if Name_2002 == "Cho Yaw Wee"
replace Name_2002 = "Li Ka-shing" if Name_2002 == "Ka-shing Li"
replace Name_2002 = "John Dorrance, III." if Name_2002 == "John Dorrance"
replace Name_2002 = "Mustafa Rahmi Koc" if Name_2002 == "Rahmi Koc"

rename Name_2002 Name 
rename Country_2002 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-03"

*Ordering variables 
order Name Country id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2002 Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2002 Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2002 Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2002 Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 //52 name duplicates up to this point

gen id_200215 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-02", replace

*******************
*200215-2001 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-02", clear

matchit id_200215 Name using "WorldBillionaires2001minusUS.dta", idusing(id_2001) txtusing(Name_2001)

joinby id_200215 using "${SavePath}/statadata/harmonized_names/15-02"
joinby id_2001 using WorldBillionaires2001minusUS

order id_200215 id_200315 id_200415 id_200515 id_200615 id_200715 id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_2001 ///
Name Name_2001 ///
similscore ///
Age_2001 Age_2002 Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_2001 Wealth_2002 Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2001 Family_2002 Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_2001 Wealth_millions_2002 Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_2001 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-01", replace

*Changes in 2001 name variable 
use WorldBillionaires2001minusUS, clear

replace Name_2001 = "Tiong Hiew King" if Name_2001 == "Hiew King Tiong"
replace Name_2001 = "Cheng Yu-tung" if Name_2001 == "Yu-tung Cheng"
replace Name_2001 = "Lee Shau Kee" if Name_2001 == "Shau Kee Lee"
replace Name_2001 = "Lee Kun-Hee" if Name_2001 == "Kun-Hee Lee"
replace Name_2001 = "Alain & Gerard Wertheimer" if Name_2001 == "Alain &#38; Gerard Wertheimer"
replace Name_2001 = "Reinhold Wuerth" if Name_2001 == "Reinhold Wurth"
replace Name_2001 = "Martin & Olivier Bouygues" if Name_2001 == "Martin &#38; Olivier Bouygues"
replace Name_2001 = "Guenter Herz" if Name_2001 == "Gunter Herz"
replace Name_2001 = "Michael & Reiner Schmidt-Ruthenbeck" if Name_2001 == "Michael &#38; Rainer Schmidt-Ruthenbeck"
replace Name_2001 = "Quek Leng Chan" if Name_2001 == "Leng Chan Quek"
replace Name_2001 = "Chen Din Hwa" if Name_2001 == "Din Hwa Chen"
replace Name_2001 = "Alberto Bailleres Gonzalez" if Name_2001 == "Alberto Bailleres"
replace Name_2001 = "Ferit Faik Sahenk" if Name_2001 == "Ferit Sahenk"
replace Name_2001 = "Chey Tae-Won" if Name_2001 == "Tae-Won Chey"
replace Name_2001 = "Wei Yin-Chun" if Name_2001 == "Yin-Chun Wei"
replace Name_2001 = "Wu Chung-Yi" if Name_2001 == "Wu Chung-yi"
replace Name_2001 = "Wee Cho Yaw" if Name_2001 == "Cho Yaw Wee"
replace Name_2001 = "Li Ka-shing" if Name_2001 == "Ka-shing Li"
replace Name_2001 = "John Dorrance, III." if Name_2001 == "John Dorrance"
replace Name_2001 = "Mustafa Rahmi Koc" if Name_2001 == "Rahmi Koc"

rename Name_2001 Name 
rename Country_2001 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-02"

*Ordering variables 
order Name Country id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2001 Age_2002 Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2001 Wealth_millions_2002 Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2001 Wealth_2002 Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2001 Family_2002 Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 //52 name duplicates up to this point

gen id_200115 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-01", replace

*******************
*200115-2000 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-01", clear

matchit id_200115 Name using "WorldBillionaires2000minusUS.dta", idusing(id_2000) txtusing(Name_2000)

joinby id_200115 using "${SavePath}/statadata/harmonized_names/15-01"
joinby id_2000 using WorldBillionaires2000minusUS

order id_200115 id_200215 id_200315 id_200415 id_200515 id_200615 id_200715 id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_2000 ///
Name Name_2000 ///
similscore ///
Age_2000 Age_2001 Age_2002 Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_2000 Wealth_2001 Wealth_2002 Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2000 Family_2001 Family_2002 Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_2000 Wealth_millions_2001 Wealth_millions_2002 Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_2000 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-00", replace

*Changes in 2000 name variable 
use WorldBillionaires2000minusUS, clear

replace Name_2000 = "Zhong Sheng Jian" if Name_2000 == "Sheng Jian Zhong"
replace Name_2000 = "Hong Piow Teh" if Name_2000 == "Teh Hong Piow"
replace Name_2000 = "Tseng Shin-Yi" if Name_2000 == "Tseng Shin-yi"
replace Name_2000 = "Wei Yin-Chun" if Name_2000 == "Yin-Chun Wei"
replace Name_2000 = "Wu Chung-Yi" if Name_2000 == "Wu Chung-yi"

rename Name_2000 Name 
rename Country_2000 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-01"

*Ordering variables 
order Name Country id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_2000 Age_2001 Age_2002 Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_2000 Wealth_millions_2001 Wealth_millions_2002 Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_2000 Wealth_2001 Wealth_2002 Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_2000 Family_2001 Family_2002 Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 //54 name duplicates up to this point

gen id_200015 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-00", replace

*******************
*200015-1999 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-00", clear

matchit id_200015 Name using "WorldBillionaires1999minusUS.dta", idusing(id_1999) txtusing(Name_1999)

joinby id_200015 using "${SavePath}/statadata/harmonized_names/15-00"
joinby id_1999 using WorldBillionaires1999minusUS

order id_200015 id_200115 id_200215 id_200315 id_200415 id_200515 id_200615 id_200715 id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_1999 ///
Name Name_1999 ///
similscore ///
Age_1999 Age_2000 Age_2001 Age_2002 Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_1999 Wealth_2000 Wealth_2001 Wealth_2002 Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_1999 Family_2000 Family_2001 Family_2002 Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///
Wealth_millions_1999 Wealth_millions_2000 Wealth_millions_2001 Wealth_millions_2002 Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 ///
Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 

bys Name_1999 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-99", replace

*Changes in 1999 name variable 
use WorldBillionaires1999minusUS, clear

replace Name_1999 = "Zhong Sheng Jian" if Name_1999 == "Sheng Jian Zhong"
replace Name_1999 = "Hong Piow Teh" if Name_1999 == "Teh Hong Piow"
replace Name_1999 = "Tseng Shin-Yi" if Name_1999 == "Tseng Shin-yi"
replace Name_1999 = "Wei Yin-Chun" if Name_1999 == "Yin-Chun Wei"
replace Name_1999 = "Wu Chung-Yi" if Name_1999 == "Wu Chung-yi"

rename Name_1999 Name 
rename Country_1999 Country 

merge 1:1 Name Country using "${SavePath}/statadata/harmonized_names/15-00"

*Ordering variables 
order Name Country id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Age_1999 Age_2000 Age_2001 Age_2002 Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_millions_1999 Wealth_millions_2000 Wealth_millions_2001 Wealth_millions_2002 Wealth_millions_2003 Wealth_millions_2004 Wealth_millions_2005 Wealth_millions_2006 Wealth_millions_2007 Wealth_millions_2008 Wealth_millions_2009 Wealth_millions_2010 Wealth_millions_2011 Wealth_millions_2012 Wealth_millions_2013 Wealth_millions_2014 Wealth_millions_2015 ///
Wealth_1999 Wealth_2000 Wealth_2001 Wealth_2002 Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_1999 Family_2000 Family_2001 Family_2002 Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015

sort Name

duplicates tag Name, gen(nametag) 
tab nametag 
browse if nametag > 0 //54 name duplicates up to this point

gen id_199915 = _n
 
drop nametag _merge 

save "${SavePath}/statadata/harmonized_names/15-99", replace

*******************
*199915-1998 merge*
*******************

use "${SavePath}/statadata/harmonized_names/15-99", clear

matchit id_199915 Name using "WorldBillionaires1998minusUS.dta", idusing(id_1998) txtusing(Name_1998)

joinby id_199915 using "${SavePath}/statadata/harmonized_names/15-99"
joinby id_1998 using WorldBillionaires1998minusUS

order id_199915 id_200015 id_200115 id_200215 id_200315 id_200415 id_200515 id_200615 id_200715 id_200815 id_200915 id_201015 id_201115 id_201215 id_201315 id_201415 ///
id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 ///
Country Country_1998 ///
Name Name_1998 ///
similscore ///
Age_1998 Age_1999 Age_2000 Age_2001 Age_2002 Age_2003 Age_2004 Age_2005 Age_2006 Age_2007 Age_2008 Age_2009 Age_2010 Age_2011 Age_2012 Age_2013 Age_2014 Age_2015 ///
Wealth_1998 Wealth_1999 Wealth_2000 Wealth_2001 Wealth_2002 Wealth_2003 Wealth_2004 Wealth_2005 Wealth_2006 Wealth_2007 Wealth_2008 Wealth_2009 Wealth_2010 Wealth_2011 Wealth_2012 Wealth_2013 Wealth_2014 Wealth_2015 ///
Family_1998 Family_1999 Family_2000 Family_2001 Family_2002 Family_2003 Family_2004 Family_2005 Family_2006 Family_2007 Family_2008 Family_2009 Family_2010 Family_2011 Family_2012 Family_2013 Family_2014 Family_2015 ///

bys Name_1998 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit/matchit_15-99", replace
