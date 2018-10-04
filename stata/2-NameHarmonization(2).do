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

save "${SavePath}/statadata/harmonized_names/matchit_15-13", replace

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

save "${SavePath}/statadata/harmonized_names/matchit_15-12", replace

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

save "${SavePath}/statadata/harmonized_names/matchit_15-11", replace

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

save "${SavePath}/statadata/harmonized_names/matchit_15-10", replace

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

save "${SavePath}/statadata/harmonized_names/matchit_15-09", replace

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

save "${SavePath}/statadata/harmonized_names/matchit_15-08", replace

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










































