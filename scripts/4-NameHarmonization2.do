*#############################################################*
*							                                  *
*THIS DO FILE GENERATES NAME-HARMONIZED DATASETS USING MATCHIT*				
*							  							      *
*#############################################################*

/*Start with data from 2018, matchit with data 2017, harmonize, and then repeat 
(matchit the harmonized data with 2013) until we have a completely harmonized 
dataset!*/

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

cd "${SavePath}/statadata/yearlyminusUS2"

*****************
*2017-2018 merge*
*****************

use "2018minusUS.dta", clear 

matchit id_2018 name_2018 using "2017minusUS.dta", idusing(id_2017) txtusing(name_2017)

joinby id_2017 using "2017minusUS.dta" 
joinby id_2018 using "2018minusUS.dta"

order id_2018 id_2017 country_2018 country_2017 name_2018 name_2017 similscore age_2018 age_2017 ///
wealth_2018 wealth_2017 family_2018 family_2017

bys name_2017 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-17", replace

*Changes in 2017 name variable 
use "2017minusUS.dta", clear

replace name_2017 = "Hermann Langness" if name_2017 == "Herman Langness"
replace name_2017 = "Zhang Jin" if name_2017 == "Zhang Jing"
replace name_2017 = "Thi Phuong Thao Nguyen" if name_2017 == "Nguyen Thi Phuong Thao"
replace name_2017 = "Hedda im Brahm-Droege" if name_2017 == "Hedda im Brahm Droege"
replace name_2017 = "Sheng Jian Zhong" if name_2017 == "Zhong Sheng Jian"
replace name_2017 = "Lin Ming-hsiung" if name_2017 == "Lin Ming-Hsiung"
replace name_2017 = "Jean-Pierre Cayard" if name_2017 == "Jean Pierre Cayard"
replace name_2017 = "Chao Teng-hsiung" if name_2017 == "Chao Teng-Hsiung"
replace name_2017 = "Liao Long-shing" if name_2017 == "Liao Long-Shing"
replace name_2017 = "Maria-Elisabeth Schaeffler-Thumann" if name_2017 == "Maria-Elisabeth Schaeffler"
replace name_2017 = "Chang-Woo Han" if name_2017 == "Han Chang-Woo"
replace name_2017 = "Fatma Tuba Yazici" if name_2017 == "Fatma Yazici"
replace name_2017 = "Walter P.J. Droege" if name_2017 == "Walter Droege"
replace name_2017 = "Tseng Shin-yi" if name_2017 == "Tseng Shin-Yi"
replace name_2017 = "Teh Hong Piow" if name_2017 == "Hong Piow Teh"
replace name_2017 = "Guy Lalibertí©" if name_2017 == "Guy Laliberte"
replace name_2017 = "Yin-Chun Wei" if name_2017 == "Wei Yin-Chun"
replace name_2017 = "Lin Yu-Ling" if name_2017 == "Lin Yu-lin"
replace name_2017 = "Wu Chung-yi" if name_2017 == "Wu Chung-Yi"
replace name_2017 = "Jonathan Lu" if name_2017 == "Lu Jonathan"
replace name_2017 = "Lai Meisong" if name_2017 == "Meisong Lai"
replace name_2017 = "Wim van der Leegte" if name_2017 == "Wim Van Der Leegte"
replace name_2017 = "Don Gao" if name_2017 == "Gao Don"
replace name_2017 = "Heloise Pratt" if name_2017 == "Heloise Waislitz"

replace name_2017 = "Zhou Yifeng (young)" if name_2017 == "Zhou Yifeng" & age == 38 

*Merging with 2018 data
rename name_2017 name_2018 //only doing this so that I can merge!
rename country_2017 country_2018
merge 1:1 name_2018 country_2018 using "2018minusUS.dta" 

*Renaming and ordering variables to clean dataset, use for next merge 
rename name_2018 name 
rename country_2018 country  

order name country id_2017 id_2018 age_2017 age_2018 wealth_2017 wealth_2018 family_2017 family_2018  

sort name
gen id_201718 = _n 
drop _merge 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-17", replace

*******************
*201718-2016 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-17", clear

matchit id_201718 name using "2016minusUS.dta", idusing(id_2016) txtusing(name_2016)

joinby id_201718 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-17"
joinby id_2016 using "2016minusUS.dta" 

order id_201718 id_2018 id_2017 id_2016 country country_2016 name name_2016 similscore ///
age_2018 age_2017 age_2016 wealth_2018 wealth_2017 wealth_2016 ///
family_2018 family_2017 family_2016

bys name_2016 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-16", replace

*Changes in 2016 name variable 
use "2016minusUS.dta", clear

replace name_2016 = "Hermann Langness" if name_2016 == "Herman Langness"
replace name_2016 = "Alexandra Schoerghuber" if name_2016 == "Alexandra Schorghuber"
replace name_2016 = "Johannes Kaercher" if name_2016 == "Johannes Karcher"
replace name_2016 = "Tang Hsiang-chien" if name_2016 == "Hsiang-chien Tang"
replace name_2016 = "Sheng Jian Zhong" if name_2016 == "Zhong Sheng Jian"
replace name_2016 = "Juergen Blickle" if name_2016 == "Jurgen Blickle"
replace name_2016 = "Lin Ming-hsiung" if name_2016 == "Lin Ming-Hsiung"
replace name_2016 = "Jean-Pierre Cayard" if name_2016 == "Jean Pierre Cayard"
replace name_2016 = "Chao Teng-hsiung" if name_2016 == "Chao Teng-Hsiung"
replace name_2016 = "Liao Long-shing" if name_2016 == "Liao Long-Shing"
replace name_2016 = "Maria-Elisabeth Schaeffler-Thumann" if name_2016 == "Maria-Elisabeth Schaeffler"
replace name_2016 = "Hedda im Brahm-Droege" if name_2016 == "Hedda Brahm Droege"
replace name_2016 = "Chang-Woo Han" if name_2016 == "Han Chang-Woo"
replace name_2016 = "Fatma Tuba Yazici" if name_2016 == "Fatma Yazici"
replace name_2016 = "Carlos Ardila Lí_lle" if name_2016 == "Carlos Ardila Lulle"
replace name_2016 = "Walter P.J. Droege" if name_2016 == "Walter Droege"
replace name_2016 = "Tseng Shin-yi" if name_2016 == "Tseng Shin-Yi"
replace name_2016 = "Guy Lalibertí©" if name_2016 == "Guy Laliberte"
replace name_2016 = "Yin-Chun Wei" if name_2016 == "Wei Yin-Chun"
replace name_2016 = "Maritsa Lazari" if name_2016 == "Martisa Lazari"
replace name_2016 = "Lin Yu-Ling" if name_2016 == "Lin Yu-lin"
replace name_2016 = "Wu Chung-yi" if name_2016 == "Wu Chung-Yi"
replace name_2016 = "Sebastian Pií±era" if name_2016 == "Sebastian Pinera"
replace name_2016 = "Julio Ponce Lerou" if name_2016 == "Julio Ponce"
replace name_2016 = "Lin Tianfu" if name_2016 == "Tianfu Lin"
replace name_2016 = "Wim van der Leegte" if name_2016 == "Wim Van Der Leegte"
replace name_2016 = "Heloise Pratt" if name_2016 == "Heloise Waislitz"

rename name_2016 name 
rename country_2016 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-17"
 
order name country id_2016 id_2017 id_2018 age_2016 age_2017 age_2018 ///
wealth_2016 wealth_2017 wealth_2018 family_2016 family_2017 family_2018  

sort name
gen id_201618 = _n 
drop _merge 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-16", replace

*******************
*201618-2015 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-16", clear

matchit id_201618 name using "2015minusUS.dta", idusing(id_2015) txtusing(name_2015)

joinby id_201618 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-16"
joinby id_2015 using "2015minusUS.dta" 

order id_201718 id_201618 id_2018 id_2017 id_2016 id_2015 /// 
country country_2015 name name_2015 similscore ///
age_2018 age_2017 age_2016 age_2015 wealth_2018 wealth_2017 wealth_2016 wealth_2015 ///
family_2018 family_2017 family_2016 family_2015

bys name_2015 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-15", replace

*Changes in 2015 name variable 
use "2015minusUS.dta", clear

replace name_2015 = "Choo Chong Ngen" if name_2015 == "Chong Ngen Choo"
replace name_2015 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2015 == "Michael & Rainer Schmidt-Ruthenbeck"
replace name_2015 = "Kuok Khoon Hong" if name_2015 == "Khoon Hong Kuok"
replace name_2015 = "Alexandra Schoerghuber" if name_2015 == "Alexandra Schorghuber"
replace name_2015 = "Erika Pohl-Stroeher" if name_2015 == "Erika Pohl-Stroher"
replace name_2015 = "Klaus-Peter Schulenberg" if name_2015 == "Schulenberg Klaus-Peter"
replace name_2015 = "Oei Hong Leong" if name_2015 == "Hong Leong Oei"
replace name_2015 = "Kwek Leng Beng" if name_2015 == "Leng Beng Kwek"
replace name_2015 = "Tung Chee Chen" if name_2015 == "Chee Chen Tung"
replace name_2015 = "Sheng Jian Zhong" if name_2015 == "Zhong Sheng Jian"
replace name_2015 = "Juergen Blickle" if name_2015 == "Jurgen Blickle"
replace name_2015 = "Sylvia Stroeher" if name_2015 == "Sylvia Stroher"
replace name_2015 = "Lin Ming-hsiung" if name_2015 == "Lin Ming-Hsiung"
replace name_2015 = "Edouard Carmignac" if name_2015 == "Eduardo Carmignac"
replace name_2015 = "Jean-Pierre Cayard" if name_2015 == "Jean Pierre Cayard"
replace name_2015 = "Chao Teng-hsiung" if name_2015 == "Chao Teng-Hsiung"
replace name_2015 = "Liao Long-shing" if name_2015 == "Liao Long-Shing"
replace name_2015 = "Maria-Elisabeth Schaeffler-Thumann" if name_2015 == "Maria-Elisabeth Schaeffler"
replace name_2015 = "Chang-Woo Han" if name_2015 == "Han Chang-Woo"
replace name_2015 = "Fatma Tuba Yazici" if name_2015 == "Fatma Yazici"
replace name_2015 = "Chua Thian Poh" if name_2015 == "Thian Poh Chua"
replace name_2015 = "Elisabeth Mohn" if name_2015 == "Elizabeth Mohn"
replace name_2015 = "Carlos Ardila Lí_lle" if name_2015 == "Carlos Ardila Lulle"
replace name_2015 = "Lim Oon Kuin" if name_2015 == "Oon Kuin Lim"
replace name_2015 = "Tseng Shin-yi" if name_2015 == "Tseng Shin-Yi"
replace name_2015 = "Guy Lalibertí©" if name_2015 == "Guy Laliberte"
replace name_2015 = "Koh Wee Meng" if name_2015 == "Wee Meng Koh"
replace name_2015 = "Yin-Chun Wei" if name_2015 == "Wei Yin-Chun"
replace name_2015 = "Lin Yu-Ling" if name_2015 == "Lin Yu-lin"
replace name_2015 = "Kim Beom-Su" if name_2015 == "Kim Beom-su"
replace name_2015 = "Wu Chung-yi" if name_2015 == "Wu Chung-Yi"
replace name_2015 = "Wee Cho Yaw" if name_2015 == "Cho Yaw Wee"
replace name_2015 = "Sebastian Pií±era" if name_2015 == "Sebastian Pinera"
replace name_2015 = "Julio Ponce Lerou" if name_2015 == "Julio Ponce"
replace name_2015 = "Viatcheslav Kantor" if name_2015 == "Vyacheslav Kantor"
replace name_2015 = "Miriam Baumann-Blocher" if name_2015 == "Miriam Blocher"
replace name_2015 = "Wim van der Leegte" if name_2015 == "Wim Van Der Leegte"
replace name_2015 = "Heloise Pratt" if name_2015 == "Heloise Waislitz"

replace name_2015 = "Wang Wei (young)" if name_2015 == "Wang Wei" & age_2015 == 43

rename name_2015 name 
rename country_2015 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-16"
 
order name country id_2015 id_2016 id_2017 id_2018 ///
age_2015 age_2016 age_2017 age_2018 ///
wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2015 family_2016 family_2017 family_2018  

sort name
gen id_201518 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //18 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-15", replace

*******************
*201518-2014 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-15", clear

matchit id_201518 name using "2014minusUS.dta", idusing(id_2014) txtusing(name_2014)

joinby id_201518 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-15"
joinby id_2014 using "2014minusUS.dta" 

order id_201718 id_201618 id_201518 id_2018 id_2017 id_2016 id_2015 id_2014 /// 
country country_2014 name name_2014 similscore ///
age_2014 age_2015 age_2016 age_2017 age_2018 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2014 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-14", replace

*Changes in 2014 name variable 
use "2014minusUS.dta", clear

replace name_2014 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2014 == "Michael & Rainer Schmidt-Ruthenbeck"
replace name_2014 = "Syed Mokhtar AlBukhary" if name_2014 == "Syed Mokhtar Al-Bukhary"
replace name_2014 = "Alexandra Schoerghuber" if name_2014 == "Alexandra Schorghuber"
replace name_2014 = "Erika Pohl-Stroeher" if name_2014 == "Erika Pohl-Stroher"
replace name_2014 = "Ziyavudin Magomedov" if name_2014 == "Ziyaudin Magomedov"
replace name_2014 = "Sheng Jian Zhong" if name_2014 == "Zhong Sheng Jian"
replace name_2014 = "Tung Chee Chen" if name_2014 == "Chee Chen Tung"
replace name_2014 = "Sylvia Stroeher" if name_2014 == "Sylvia Stroher"
replace name_2014 = "Lin Ming-hsiung" if name_2014 == "Lin Ming-Hsiung"
replace name_2014 = "Chao Teng-hsiung" if name_2014 == "Chao Teng-Hsiung"
replace name_2014 = "Jean-Pierre Cayard" if name_2014 == "Jean Pierre Cayard"
replace name_2014 = "Bernardo Caprotti" if name_2014 == "Caprotti Bernardo"
replace name_2014 = "Liao Long-shing" if name_2014 == "Liao Long-Shing"
replace name_2014 = "Maria-Elisabeth Schaeffler-Thumann" if name_2014 == "Maria-Elisabeth Schaeffler"
replace name_2014 = "Chang-Woo Han" if name_2014 == "Han Chang-Woo"
replace name_2014 = "Elisabeth Mohn" if name_2014 == "Elizabeth Mohn"
replace name_2014 = "Carlos Ardila Lí_lle" if name_2014 == "Carlos Ardila Lulle"
replace name_2014 = "Tseng Shin-yi" if name_2014 == "Tseng Shin-Yi"
replace name_2014 = "Guy Lalibertí©" if name_2014 == "Guy Laliberte"
replace name_2014 = "Yin-Chun Wei" if name_2014 == "Wei Yin-Chun"
replace name_2014 = "Kim Taek-Jin" if name_2014 == "Kim Tack-Jin"
replace name_2014 = "Lin Yu-Ling" if name_2014 == "Lin Yu-lin"
replace name_2014 = "Fong Yun Wah" if name_2014 == "Henry Fong Yun Wah"
replace name_2014 = "Wu Chung-yi" if name_2014 == "Wu Chung-Yi"
replace name_2014 = "Sebastian Pií±era" if name_2014 == "Sebastian Pinera"
replace name_2014 = "Julio Ponce Lerou" if name_2014 == "Julio Ponce"
replace name_2014 = "Viatcheslav Kantor" if name_2014 == "Vyacheslav Kantor"
replace name_2014 = "Miriam Baumann-Blocher" if name_2014 == "Miriam Blocher"
replace name_2014 = "Heloise Pratt" if name_2014 == "Heloise Waislitz"

rename name_2014 name 
rename country_2014 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-15"
 
order name country id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_201418 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //22 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-14", replace

*******************
*201418-2013 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-14", clear

matchit id_201418 name using "2013minusUS.dta", idusing(id_2013) txtusing(name_2013)

gsort -similscore

joinby id_201418 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-14"
joinby id_2013 using "2013minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 /// 
country country_2013 name name_2013 similscore ///
age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2013 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-13", replace

*Changes in 2013 name variable 
use "2013minusUS.dta", clear

replace name_2013 = "Che Jianxing" if name_2013 == "Che Jianxin"
replace name_2013 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2013 == "Michael & Rainer Schmidt-Ruthenbeck"
replace name_2013 = "Alexandra Schoerghuber" if name_2013 == "Alexandra Schorghuber"
replace name_2013 = "Eva Gonda de Rivera" if name_2013 == "Eva Gonda Rivera"
replace name_2013 = "Thomas Struengmann" if name_2013 == "Thomas Strungmann"
replace name_2013 = "Klaus-Michael Kuehne" if name_2013 == "Klaus-Michael Kuhne"
replace name_2013 = "Alexandre Soares dos Santos" if name_2013 == "Elisio Alexandre Soares dos Santos"
replace name_2013 = "Andreas Struengmann" if name_2013 == "Andreas Strungmann"
replace name_2013 = "Tung Chee Chen" if name_2013 == "Chee Chen Tung"
replace name_2013 = "Sheng Jian Zhong" if name_2013 == "Zhong Sheng Jian"
replace name_2013 = "Sylvia Stroeher" if name_2013 == "Sylvia Stroher"
replace name_2013 = "Reinhold Wuerth" if name_2013 == "Reinhold Wurth"
replace name_2013 = "Chao Teng-hsiung" if name_2013 == "Chao Teng-Hsiung"
replace name_2013 = "Robert & Philip Ng" if name_2013 == "Ng Robert & Philip"
replace name_2013 = "Wichai Thongtang" if name_2013 == "Wichai Thongthan"
replace name_2013 = "Guenter Herz" if name_2013 == "Gunter Herz"
replace name_2013 = "Liao Long-shing" if name_2013 == "Liao Long-Shing"
replace name_2013 = "Chang-Woo Han" if name_2013 == "Han Chang-Woo"
replace name_2013 = "Hubert d'Ornano" if name_2013 == "Hubert D'Ornano"
replace name_2013 = "Sezai Bacaksiz" if name_2013 == "Bacaksiz Sezai"
replace name_2013 = "Elisabeth Mohn" if name_2013 == "Elizabeth Mohn"
replace name_2013 = "Carlos Ardila Lí_lle" if name_2013 == "Carlos Ardila Lulle"
replace name_2013 = "Tseng Shin-yi" if name_2013 == "Tseng Shin-Yi"
replace name_2013 = "Guy Lalibertí©" if name_2013 == "Guy Laliberte"
replace name_2013 = "Gina Rinehart" if name_2013 == "Georgina Rinehart"
replace name_2013 = "Yin-Chun Wei" if name_2013 == "Wei Yin-Chun"
replace name_2013 = "Lin Yu-Ling" if name_2013 == "Lin Yu-lin"
replace name_2013 = "Fong Yun Wah" if name_2013 == "Henry Fong Yun Wah"
replace name_2013 = "Hong Ra-Hee" if name_2013 == "Ra-Hee Hong"
replace name_2013 = "Wu Chung-yi" if name_2013 == "Wu Chung-Yi"
replace name_2013 = "Sebastian Pií±era" if name_2013 == "Sebastian Pinera"
replace name_2013 = "Lang Walker" if name_2013 == "Langley Walker"
replace name_2013 = "Viatcheslav Kantor" if name_2013 == "Vyacheslav Kantor"
replace name_2013 = "Law Kar Po" if name_2013 == "Kar Po Law"
replace name_2013 = "Len Buckeridge" if name_2013 == "Leonard Buckeridge"
replace name_2013 = "Gerry Harvey" if name_2013 == "Gerald Harvey"
replace name_2013 = "Cher Wang & Wenchi Chen" if name_2013 == "Cher Wang Wenchi Chen"

rename name_2013 name 
rename country_2013 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-14"
 
order name country id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_201318 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //24 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-13", replace

*******************
*201318-2012 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-13", clear

matchit id_201318 name using "2012minusUS.dta", idusing(id_2012) txtusing(name_2012)

gsort -similscore

joinby id_201318 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-13"
joinby id_2012 using "2012minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 /// 
country country_2012 name name_2012 similscore ///
age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2012 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-12", replace

*Changes in 2012 name variable 
use "2012minusUS.dta", clear

replace name_2012 = "Che Jianxing" if name_2012 == "Che Jianxin"
replace name_2012 = "Guo Guangchang" if name_2012 == "Guangchang Guo"
replace name_2012 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2012 == "Michael & Rainer Schmidt-Ruthenbeck"
replace name_2012 = "Alexandra Schoerghuber" if name_2012 == "Alexandra Schorghuber"
replace name_2012 = "Klaus-Michael Kuehne" if name_2012 == "Klaus-Michael Kuhne"
replace name_2012 = "Thomas Struengmann" if name_2012 == "Thomas Strungmann"
replace name_2012 = "Alexandre Soares dos Santos" if name_2012 == "Eliseo Alexandre Soares dos Santos"
replace name_2012 = "Andreas Struengmann" if name_2012 == "Andreas Strungmann"
replace name_2012 = "John Dorrance, III." if name_2012 == "John Dorrance III"
replace name_2012 = "Sheng Jian Zhong" if name_2012 == "Zhong Sheng Jian"
replace name_2012 = "Tung Chee Chen" if name_2012 == "Chee Chen Tung"
replace name_2012 = "Sylvia Stroeher" if name_2012 == "Sylvia Stroher"
replace name_2012 = "Reinhold Wuerth" if name_2012 == "Reinhold Wurth"
replace name_2012 = "Walther Moreira Salles Junior" if name_2012 == "Walther Moreira Salles"
replace name_2012 = "Tsai Wan-Tsai" if name_2012 == "Tsai Wan-tsai"
replace name_2012 = "Chao Teng-hsiung" if name_2012 == "Chao Teng-Hsiung"
replace name_2012 = "Guenter Herz" if name_2012 == "Gunter Herz"
replace name_2012 = "Hansjoerg Wyss" if name_2012 == "Hansjorg Wyss"
replace name_2012 = "Enrique Razon, Jr." if name_2012 == "Enrique Razon Jr"
replace name_2012 = "Liao Long-shing" if name_2012 == "Liao Long-Shing"
replace name_2012 = "Alexey Mordashov" if name_2012 == "Alexei Mordashov"
replace name_2012 = "Wang Yung-Tsai" if name_2012 == "Wang Yung-tsai"
replace name_2012 = "Tsai Ming-Kai" if name_2012 == "Tsai Ming-kai"
replace name_2012 = "Chang-Woo Han" if name_2012 == "Han Chang-Woo"
replace name_2012 = "Elisabeth Mohn" if name_2012 == "Elizabeth Mohn"
replace name_2012 = "Sezai Bacaksiz" if name_2012 == "Bacaksiz Sezai"
replace name_2012 = "Xiu Li Hawken" if name_2012 == "Hawken Xiu Li"
replace name_2012 = "Guy Lalibertí©" if name_2012 == "Guy Laliberte"
replace name_2012 = "Gina Rinehart" if name_2012 == "Georgina Rinehart"
replace name_2012 = "Yin-Chun Wei" if name_2012 == "Wei Yin-Chun"
replace name_2012 = "Kim Taek-Jin" if name_2012 == "Kim Tack-Jin"
replace name_2012 = "Lin Yu-Ling" if name_2012 == "Lin Yu-lin"
replace name_2012 = "Fong Yun Wah" if name_2012 == "Henry Fong Yun Wah"
replace name_2012 = "Wu Chung-yi" if name_2012 == "Wu Chung-Yi"
replace name_2012 = "Sebastian Pií±era" if name_2012 == "Sebastian Pinera"
replace name_2012 = "Hong Ra-Hee" if name_2012 == "Ra-Hee Hong Lee"
replace name_2012 = "Viatcheslav Kantor" if name_2012 == "Vyacheslav Kantor"
replace name_2012 = "Law Kar Po" if name_2012 == "Kar Po Law"
replace name_2012 = "Cheung Yan" if name_2012 == "Yan Cheung"
replace name_2012 = "Len Buckeridge" if name_2012 == "Leonard Buckeridge"

rename name_2012 name 
rename country_2012 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-13"
 
order name country id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_201218 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //26 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-12", replace

*******************
*201218-2011 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-12", clear

matchit id_201218 name using "2011minusUS.dta", idusing(id_2011) txtusing(name_2011)

gsort -similscore

joinby id_201218 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-12"
joinby id_2011 using "2011minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 /// 
country country_2011 name name_2011 similscore ///
age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2011 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-11", replace

*Changes in 2011 name variable 
use "2011minusUS.dta", clear

replace name_2011 = "Che Jianxing" if name_2011 == "Che Jianxin"
replace name_2011 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2011 == "Michael & Rainer Schmidt-Ruthenbeck"
replace name_2011 = "Alexandra Schoerghuber" if name_2011 == "Alexandra Schorghuber"
replace name_2011 = "Klaus-Michael Kuehne" if name_2011 == "Klaus-Michael Kuhne"
replace name_2011 = "Thomas Struengmann" if name_2011 == "Thomas Strungmann"
replace name_2011 = "Alexandre Soares dos Santos" if name_2011 == "Eliseo Alexandre Soares dos Santos"
replace name_2011 = "Andreas Struengmann" if name_2011 == "Andreas Strungmann"
replace name_2011 = "Thomas & Raymond Kwok" if name_2011 == "Kwok Thomas & Raymond"
replace name_2011 = "Jean Claude Gandur" if name_2011 == "Jean-Claude Gandur"
replace name_2011 = "Tung Chee Chen" if name_2011 == "Chee Chen Tung"
replace name_2011 = "Sheng Jian Zhong" if name_2011 == "Zhong Sheng Jian"
replace name_2011 = "Reinhold Wuerth" if name_2011 == "Reinhold Wurth"
replace name_2011 = "Sylvia Stroeher" if name_2011 == "Sylvia Stroher"
replace name_2011 = "Walther Moreira Salles Junior" if name_2011 == "Walther Moreira Salles"
replace name_2011 = "Tsai Wan-Tsai" if name_2011 == "Tsai Wan-tsai"
replace name_2011 = "Chao Teng-hsiung" if name_2011 == "Chao Teng-Hsiung"
replace name_2011 = "Guenter Herz" if name_2011 == "Gunter Herz"
replace name_2011 = "Hansjoerg Wyss" if name_2011 == "Hansjorg Wyss"
replace name_2011 = "He Qiaonv" if name_2011 == "He Qiaonu"
replace name_2011 = "Liao Long-shing" if name_2011 == "Liao Long-Shing"
replace name_2011 = "Alexey Mordashov" if name_2011 == "Alexei Mordashov"
replace name_2011 = "Wang Yung-Tsai" if name_2011 == "Wang Yung-tsai"
replace name_2011 = "Tsai Ming-Kai" if name_2011 == "Tsai Ming-kai"
replace name_2011 = "Chang-Woo Han" if name_2011 == "Han Chang-Woo"
replace name_2011 = "Sezai Bacaksiz" if name_2011 == "Bacaksiz Sezai"
replace name_2011 = "Elisabeth Mohn" if name_2011 == "Elizabeth Mohn"
replace name_2011 = "Wei Ying-Chiao" if name_2011 == "Wei Ying-chiao"
replace name_2011 = "Huang Shih Tsai" if name_2011 == "Huang Shih Tsai (Shizai)"
replace name_2011 = "Enrique Razon, Jr." if name_2011 == "Enrique Razon"
replace name_2011 = "Xiu Li Hawken" if name_2011 == "Hawken Xiu Li"
replace name_2011 = "Guy Lalibertí©" if name_2011 == "Guy Laliberte"
replace name_2011 = "Gina Rinehart" if name_2011 == "Georgina Rinehart"
replace name_2011 = "Fong Yun Wah" if name_2011 == "Yun Wah Fong"
replace name_2011 = "Yin-Chun Wei" if name_2011 == "Wei Yin-Chun"
replace name_2011 = "Kim Taek-Jin" if name_2011 == "Kim Tack-Jin"
replace name_2011 = "Lin Yu-Ling" if name_2011 == "Lin Yu-lin"
replace name_2011 = "K. Dinesh" if name_2011 == "K Dinesh"
replace name_2011 = "Sebastian Pií±era" if name_2011 == "Sebastian Pinera"
replace name_2011 = "Viatcheslav Kantor" if name_2011 == "Vyacheslav Kantor"
replace name_2011 = "Law Kar Po" if name_2011 == "Kar Po Law"
replace name_2011 = "Cheung Yan" if name_2011 == "Yan Cheung"
replace name_2011 = "John Dorrance, III." if name_2011 == "John Dorrance"
replace name_2011 = "Len Buckeridge" if name_2011 == "Leonard Buckeridge"
replace name_2011 = "Gerry Harvey" if name_2011 == "Gerald Harvey"
replace name_2011 = "Bidzina Ivanishvili" if name_2011 == "Boris Ivanishvili"

rename name_2011 name 
rename country_2011 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-12"
 
order name country id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_201118 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //32 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-11", replace

*******************
*201118-2010 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-11", clear

matchit id_201118 name using "2010minusUS.dta", idusing(id_2010) txtusing(name_2010)

gsort -similscore

joinby id_201118 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-11"
joinby id_2010 using "2010minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 /// 
country country_2010 name name_2010 similscore ///
age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2010 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-10", replace

*Changes in 2010 name variable 
use "2010minusUS.dta", clear

replace name_2010 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2010 == "Michael & Rainer Schmidt-Ruthenbeck"
replace name_2010 = "Alexandra Schoerghuber" if name_2010 == "Alexandra Schorghuber"
replace name_2010 = "Klaus-Michael Kuehne" if name_2010 == "Klaus-Michael Kuhne"
replace name_2010 = "Thomas Struengmann" if name_2010 == "Thomas Strungmann"
replace name_2010 = "Andreas Struengmann" if name_2010 == "Andreas Strungmann"
replace name_2010 = "John Dorrance, III." if name_2010 == "John Dorrance III"
replace name_2010 = "Jean Claude Gandur" if name_2010 == "Jean-Claude Gandur"
replace name_2010 = "Sheng Jian Zhong" if name_2010 == "Zhong Sheng Jian"
replace name_2010 = "Sylvia Stroeher" if name_2010 == "Sylvia Stroher"
replace name_2010 = "Reinhold Wuerth" if name_2010 == "Reinhold Wurth"
replace name_2010 = "Chao Teng-hsiung" if name_2010 == "Chao Teng-Hsiung"
replace name_2010 = "Hansjoerg Wyss" if name_2010 == "Hansjorg Wyss"
replace name_2010 = "Guenter Herz" if name_2010 == "Gunter Herz"
replace name_2010 = "Alexey Mordashov" if name_2010 == "Alexei Mordashov"
replace name_2010 = "Tsai Ming-Kai" if name_2010 == "Tsai Ming-kai"
replace name_2010 = "Chang-Woo Han" if name_2010 == "Han Chang-Woo"
replace name_2010 = "Vladimir Iorich" if name_2010 == "Vladimir Iorikh"
replace name_2010 = "Wei Ying-Chiao" if name_2010 == "Wei Ying-chiao"
replace name_2010 = "Elisabeth Mohn" if name_2010 == "Elizabeth Mohn"
replace name_2010 = "Ayman Hariri" if name_2010 == "Aymin Hariri"
replace name_2010 = "Semahat Sevim Arsel" if name_2010 == "Semahat Arsel"
replace name_2010 = "Tsai Cheng-da" if name_2010 == "Cheng-da Tsai"
replace name_2010 = "Alberto Bailleres Gonzalez" if name_2010 == "Alberto Bailleres"
replace name_2010 = "Ferit Faik Sahenk" if name_2010 == "Ferit Sahenk"
replace name_2010 = "Guy Lalibertí©" if name_2010 == "Guy Laliberte"
replace name_2010 = "Yin-Chun Wei" if name_2010 == "Wei Yin-Chun"
replace name_2010 = "Lin Yu-Ling" if name_2010 == "Lin Yu-lin"
replace name_2010 = "Sebastian Pií±era" if name_2010 == "Sebastian Pinera"
replace name_2010 = "Viatcheslav Kantor" if name_2010 == "Vyacheslav Kantor"
replace name_2010 = "Xiu Li Hawken" if name_2010 == "Xiuli Hawken"
replace name_2010 = "Cheung Yan" if name_2010 == "Yan Cheung"
replace name_2010 = "Mustafa Rahmi Koc" if name_2010 == "Rahmi Koc"
replace name_2010 = "Gerry Harvey" if name_2010 == "Gerald Harvey"
replace name_2010 = "Bidzina Ivanishvili" if name_2010 == "Boris Ivanishvili"

rename name_2010 name 
rename country_2010 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-11"
 
order name country id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_201018 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //36 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-10", replace

*******************
*201018-2009 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-10", clear

matchit id_201018 name using "2009minusUS.dta", idusing(id_2009) txtusing(name_2009)

gsort -similscore

joinby id_201018 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-10"
joinby id_2009 using "2009minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 /// 
country country_2009 name name_2009 similscore ///
age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2009 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-09", replace

*Changes in 2009 name variable 
use "2009minusUS.dta", clear

replace name_2009 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2009 == "Michael & Rainer Schmidt-Ruthenbeck"
replace name_2009 = "Alexandra Schoerghuber" if name_2009 == "Alexandra Schorghuber"
replace name_2009 = "Thor Bjorgolfsson" if name_2009 == "Bjorgolfur Thor Bjorgolfsson"
replace name_2009 = "Thomas Struengmann" if name_2009 == "Thomas Strungmann"
replace name_2009 = "Klaus-Michael Kuehne" if name_2009 == "Klaus-Michael Kuhne"
replace name_2009 = "Andreas Struengmann" if name_2009 == "Andreas Strungmann"
replace name_2009 = "John Dorrance, III." if name_2009 == "John Dorrance III"
replace name_2009 = "Jean Claude Gandur" if name_2009 == "Jean-Claude Gandur"
replace name_2009 = "Sylvia Stroeher" if name_2009 == "Sylvia Stroher"
replace name_2009 = "Reinhold Wuerth" if name_2009 == "Reinhold Wurth"
replace name_2009 = "R. Budi Hartono" if name_2009 == "R Budi Hartono"
replace name_2009 = "Hansjoerg Wyss" if name_2009 == "Hansjorg Wyss"
replace name_2009 = "Guenter Herz" if name_2009 == "Gunter Herz"
replace name_2009 = "Alexey Mordashov" if name_2009 == "Alexei Mordashov"
replace name_2009 = "Tsai Eng-Meng" if name_2009 == "Tsai Eng Meng"
replace name_2009 = "Chang-Woo Han" if name_2009 == "Han Chang-Woo"
replace name_2009 = "Ayman Hariri" if name_2009 == "Aymin Hariri"
replace name_2009 = "Joanne (J.K.) Rowling" if name_2009 == "Joanne (JK) Rowling"
replace name_2009 = "Alberto Bailleres Gonzalez" if name_2009 == "Alberto Bailleres"
replace name_2009 = "Ferit Faik Sahenk" if name_2009 == "Ferit Sahenk"
replace name_2009 = "Guy Lalibertí©" if name_2009 == "Guy Laliberte"
replace name_2009 = "Sebastian Pií±era" if name_2009 == "Sebastian Pinera"
replace name_2009 = "Bidzina Ivanishvili" if name_2009 == "Boris Ivanishvili"
replace name_2009 = "G. M. Rao" if name_2009 == "G M Rao"

rename name_2009 name 
rename country_2009 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-10"
 
order name country id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200918 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //38 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-09", replace

*******************
*200918-2008 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-09", clear

matchit id_200918 name using "2008minusUS.dta", idusing(id_2008) txtusing(name_2008)

gsort -similscore

joinby id_200918 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-09"
joinby id_2008 using "2008minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 /// 
country country_2008 name name_2008 similscore ///
age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2008 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-08", replace

*Changes in 2008 name variable 
use "2008minusUS.dta", clear

replace name_2008 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2008 == "Michael & Rainer Schmidt-Ruthenbeck"
replace name_2008 = "Thor Bjorgolfsson" if name_2008 == "Bjorgolfur Thor Bjorgolfsson"
replace name_2008 = "German Larrea Mota Velasco" if name_2008 == "German Larrea Mota-Velasco"
replace name_2008 = "Klaus-Michael Kuehne" if name_2008 == "Klaus-Michael Kuhne"
replace name_2008 = "Thomas Struengmann" if name_2008 == "Thomas Strungmann"
replace name_2008 = "Andreas Struengmann" if name_2008 == "Andreas Strungmann"
replace name_2008 = "N. Murray Edwards" if name_2008 == "N Murray Edwards"
replace name_2008 = "John Dorrance, III." if name_2008 == "John Dorrance III"
replace name_2008 = "Jean Claude Gandur" if name_2008 == "Jean-Claude Gandur"
replace name_2008 = "Sheng Jian Zhong" if name_2008 == "Zhong Sheng Jian"
replace name_2008 = "R. Budi Hartono" if name_2008 == "R Budi Hartono"
replace name_2008 = "Reinhold Wuerth" if name_2008 == "Reinhold Wurth"
replace name_2008 = "Sylvia Stroeher" if name_2008 == "Sylvia Stroher"
replace name_2008 = "Hansjoerg Wyss" if name_2008 == "Hansjorg Wyss"
replace name_2008 = "Guenter Herz" if name_2008 == "Gunter Herz"
replace name_2008 = "Alexey Mordashov" if name_2008 == "Alexei Mordashov"
replace name_2008 = "Vladimir Iorich" if name_2008 == "Vladimir Iorikh"
replace name_2008 = "Tsai Eng-Meng" if name_2008 == "Tsai Eng Meng"
replace name_2008 = "Chang-Woo Han" if name_2008 == "Han Chang-Woo"
replace name_2008 = "Ayman Hariri" if name_2008 == "Aymin Hariri"
replace name_2008 = "Joanne (J.K.) Rowling" if name_2008 == "Joanne (JK) Rowling"
replace name_2008 = "Semahat Sevim Arsel" if name_2008 == "Semahat Arsel"
replace name_2008 = "N.R. Narayana Murthy" if name_2008 == "NR Narayana Murthy"
replace name_2008 = "Alberto Bailleres Gonzalez" if name_2008 == "Alberto Bailleres"
replace name_2008 = "Ferit Faik Sahenk" if name_2008 == "Ferit Sahenk"
replace name_2008 = "Jay Y. Lee" if name_2008 == "Jay Y Lee"
replace name_2008 = "Guy Lalibertí©" if name_2008 == "Guy Laliberte"
replace name_2008 = "G.V. Krishna Reddy" if name_2008 == "GV Krishna Reddy"
replace name_2008 = "Sebastian Pií±era" if name_2008 == "Sebastian Pinera"
replace name_2008 = "Viatcheslav Kantor" if name_2008 == "Vyacheslav Kantor"
replace name_2008 = "Cheung Yan" if name_2008 == "Yan Cheung"
replace name_2008 = "Mustafa Rahmi Koc" if name_2008 == "Rahmi Koc"
replace name_2008 = "Gerry Harvey" if name_2008 == "Gerald Harvey"
replace name_2008 = "Bidzina Ivanishvili" if name_2008 == "Boris Ivanishvili"
replace name_2008 = "G. M. Rao" if name_2008 == "G M Rao"

rename name_2008 name 
rename country_2008 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-09"
 
order name country id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200818 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //44 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-08", replace

*******************
*200818-2007 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-08", clear

matchit id_200818 name using "2007minusUS.dta", idusing(id_2007) txtusing(name_2007)

gsort -similscore

joinby id_200818 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-08"
joinby id_2007 using "2007minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 /// 
country country_2007 name name_2007 similscore ///
age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2007 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-07", replace

*Changes in 2007 name variable 
use "2007minusUS.dta", clear

replace name_2007 = "Vasily Anisimov" if name_2007 == "Vassily Anisimov"
replace name_2007 = "Beny Steinmetz" if name_2007 == "Benny Steinmetz"
replace name_2007 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2007 == "Michael & Rainer Schmidt-Ruthenbeck"
replace name_2007 = "Indu Jain" if name_2007 == "Indu Jain*"
replace name_2007 = "Thor Bjorgolfsson" if name_2007 == "Bjorgolfur Thor Bjorgolfsson"
replace name_2007 = "Marc Ladreit de Lacharriere" if name_2007 == "Marc Ladreit de Lacharrire"
replace name_2007 = "Mehmet Emin Karamehmet" if name_2007 == "Mehmet Karamehmet"
replace name_2007 = "Mikhail Gutseriev" if name_2007 == "Mikhail Goutseriev"
replace name_2007 = "Sheng Jian Zhong" if name_2007 == "Zhong Shen Jian"
replace name_2007 = "Jose Maria Aristrain" if name_2007 == "Jos_ Maria Aristrain"
replace name_2007 = "N. Murray Edwards" if name_2007 == "N Murray Edwards"
replace name_2007 = "John Dorrance, III." if name_2007 == "John Dorrance III"
replace name_2007 = "R. Budi Hartono" if name_2007 == "R Budi Hartono"
replace name_2007 = "Jose Manuel Loureda" if name_2007 == "Jos_ Manuel Loureda"
replace name_2007 = "Dorothea Steinbruch" if name_2007 == "Doroth_a Steinbruch"
replace name_2007 = "Stefan Schorghuber" if name_2007 == "Stefan Sch_rghuber"
replace name_2007 = "Florentino Perez" if name_2007 == "Florentino P_rez"
replace name_2007 = "Alexei Kuzmichev" if name_2007 == "Alexei Kuzmichov"
replace name_2007 = "Alexey Mordashov" if name_2007 == "Alexei Mordashov"
replace name_2007 = "Juan Abello" if name_2007 == "Juan AbellÑ"
replace name_2007 = "Enrique Banuelos" if name_2007 == "Enrique BaÐuelos"
replace name_2007 = "Vladimir Iorich" if name_2007 == "Vladimir Iorikh"
replace name_2007 = "Tsai Eng-Meng" if name_2007 == "Tsai Eng Meng"
replace name_2007 = "Chang-Woo Han" if name_2007 == "Han Chang-Woo"
replace name_2007 = "Joanne (J.K.) Rowling" if name_2007 == "Joanne (JK) Rowling"
replace name_2007 = "Klaus-Michael Kuehne" if name_2007 == "Klaus-Michael KÙhne"
replace name_2007 = "Thomas Struengmann" if name_2007 == "Thomas StrÙngmann"
replace name_2007 = "Semahat Sevim Arsel" if name_2007 == "Semahat Arsel"
replace name_2007 = "N.R. Narayana Murthy" if name_2007 == "NR Narayana Murthy"
replace name_2007 = "Andreas Struengmann" if name_2007 == "Andreas StrÙngmann"
replace name_2007 = "Alberto Bailleres Gonzalez" if name_2007 == "Alberto Bailleres"
replace name_2007 = "Ferit Faik Sahenk" if name_2007 == "Ferit Sahenk"
replace name_2007 = "Guy Lalibertí©" if name_2007 == "Guy Laliberte"
replace name_2007 = "Sylvia Stroeher" if name_2007 == "Sylvia Str_her"
replace name_2007 = "Sebastian Pií±era" if name_2007 == "Sebastian Pinera"
replace name_2007 = "Ahmet Nazif Zorlu" if name_2007 == "Ahmet Zorlu"
replace name_2007 = "Viatcheslav Kantor" if name_2007 == "Vyacheslav Kantor"
replace name_2007 = "Reinhold Wuerth" if name_2007 == "Reinhold WÙrth"
replace name_2007 = "Rosalia Mera" if name_2007 == "RosalÕa Mera"
replace name_2007 = "Emilio Botin" if name_2007 == "Emilio BotÕn"
replace name_2007 = "Cheung Yan" if name_2007 == "Yan Cheung"
replace name_2007 = "Guenter Herz" if name_2007 == "GÙnter Herz"
replace name_2007 = "Mustafa Rahmi Koc" if name_2007 == "Rahmi Koc"
replace name_2007 = "Gerry Harvey" if name_2007 == "Gerald Harvey"
replace name_2007 = "Bidzina Ivanishvili" if name_2007 == "Boris Ivanishvili"

rename name_2007 name 
rename country_2007 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-08"
 
order name country id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200718 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //48 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-07", replace

*******************
*200718-2006 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-07", clear

matchit id_200718 name using "2006minusUS.dta", idusing(id_2006) txtusing(name_2006)

gsort -similscore

joinby id_200718 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-07"
joinby id_2006 using "2006minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718  ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006  /// 
country country_2006 name name_2006 similscore ///
age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2006 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-06", replace

*Changes in 2006 name variable 
use "2006minusUS.dta", clear

replace name_2006 = "Marcel Herrmann Telles" if name_2006 == "Marcel Herman Telles"
replace name_2006 = "Shashi & Ravi Ruia" if name_2006 == "Ravi & Shashi Ruia"
replace name_2006 = "Lee Myung-Hee" if name_2006 == "Myung-Hee Lee"
replace name_2006 = "Thor Bjorgolfsson" if name_2006 == "Bjorgolfur Thor Bjorgolfsson"
replace name_2006 = "Mehmet Emin Karamehmet" if name_2006 == "Mehmet Karamehmet"
replace name_2006 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2006 == "Rainer & Michael Schmidt-Ruthenbeck"
replace name_2006 = "Lee Kun-Hee" if name_2006 == "Kun-Hee Lee"
replace name_2006 = "Vasily Anisimov" if name_2006 == "Vasiliy Anisimov"
replace name_2006 = "N. Murray Edwards" if name_2006 == "N Murray Edwards"
replace name_2006 = "John Dorrance, III." if name_2006 == "John Dorrance III"
replace name_2006 = "R. Budi Hartono" if name_2006 == "R Budi Hartono"
replace name_2006 = "Tsai Wan-Tsai" if name_2006 == "Tsai Wan Tsai"
replace name_2006 = "Dorothea Steinbruch" if name_2006 == "Doroth_a Steinbruch"
replace name_2006 = "Stefan Schorghuber" if name_2006 == "Stefan Sch_rghuber"
replace name_2006 = "Emilio Azcarraga Jean" if name_2006 == "Emilio Azcàrraga Jean"
replace name_2006 = "Alexey Mordashov" if name_2006 == "Alexei Mordashov"
replace name_2006 = "Alexei Kuzmichev" if name_2006 == "Alexei Kuzmichov"
replace name_2006 = "Sulaiman Al Rajhi" if name_2006 == "Sulaiman Bin Abdul Al Rajhi"
replace name_2006 = "Shi Zhengrong" if name_2006 == "Zhengrong Shi"
replace name_2006 = "Chang-Woo Han" if name_2006 == "Han Chang-Woo"
replace name_2006 = "Vladimir Iorich" if name_2006 == "Vladimir Iorikh"
replace name_2006 = "Joanne (J.K.) Rowling" if name_2006 == "Joanne (JK) Rowling"
replace name_2006 = "Thomas Struengmann" if name_2006 == "Thomas StrÙngmann"
replace name_2006 = "Klaus-Michael Kuehne" if name_2006 == "Klaus-Michael KÙhne"
replace name_2006 = "Semahat Sevim Arsel" if name_2006 == "Semahat Arsel"
replace name_2006 = "JesÏs de Polanco" if name_2006 == "Jesus de Polanco"
replace name_2006 = "N.R. Narayana Murthy" if name_2006 == "NR Narayana Murthy"
replace name_2006 = "Andreas Struengmann" if name_2006 == "Andreas StrÙngmann"
replace name_2006 = "Alberto Bailleres Gonzalez" if name_2006 == "Alberto Bailleres"
replace name_2006 = "Ferit Faik Sahenk" if name_2006 == "Ferit Sahenk"
replace name_2006 = "Guy Lalibertí©" if name_2006 == "Guy Laliberte"
replace name_2006 = "Sylvia Stroeher" if name_2006 == "Sylvia Str_her"
replace name_2006 = "Ahmet Nazif Zorlu" if name_2006 == "Ahmet Zorlu"
replace name_2006 = "Reinhold Wuerth" if name_2006 == "Reinhold WÙrth"
replace name_2006 = "Guenter Herz" if name_2006 == "GÙnter Herz"
replace name_2006 = "Saleh Al Rajhi" if name_2006 == "Saleh Bin Abdul Aziz Al Rajhi"
replace name_2006 = "Mustafa Rahmi Koc" if name_2006 == "Rahmi Koc"
replace name_2006 = "Bidzina Ivanishvili" if name_2006 == "Boris Ivanishvili"

rename name_2006 name 
rename country_2006 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-07"
 
order name country id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200618 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //52 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-06", replace

*******************
*200618-2005 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-06", clear

matchit id_200618 name using "2005minusUS.dta", idusing(id_2005) txtusing(name_2005)

gsort -similscore

joinby id_200618 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-06"
joinby id_2005 using "2005minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618  ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 /// 
country country_2005 name name_2005 similscore ///
age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2005 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-05", replace

*Changes in 2005 name variable 
use "2005minusUS.dta", clear

replace name_2005 = "Thor Bjorgolfsson" if name_2005 == "Bjorgolfur Thor Bjorgolfsson"
replace name_2005 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2005 == "Rainer & Michael Schmidt-Ruthenbeck"
replace name_2005 = "Lee Kun-Hee" if name_2005 == "Kun-Hee Lee"
replace name_2005 = "Alexander Machkevich" if name_2005 == "Alexander Mashkevich"
replace name_2005 = "John Dorrance, III." if name_2005 == "John Dorrance III"
replace name_2005 = "R. Budi Hartono" if name_2005 == "R Budi Hartono"
replace name_2005 = "Tsai Wan-Tsai" if name_2005 == "Tsai Wan Tsai"
replace name_2005 = "Stefan Schorghuber" if name_2005 == "Stefan Sch_rghuber"
replace name_2005 = "Andrey Melnichenko" if name_2005 == "Andrei Melnichenko"
replace name_2005 = "Viktor Rashnikov" if name_2005 == "Victor Rashnikov"
replace name_2005 = "Alexey Mordashov" if name_2005 == "Alexei Mordashov"
replace name_2005 = "Alexei Kuzmichev" if name_2005 == "Alexei Kuzmichov"
replace name_2005 = "Sulaiman Al Rajhi" if name_2005 == "Sulaiman Bin Abdul Al Rajhi"
replace name_2005 = "Chang-Woo Han" if name_2005 == "Han Chang-Woo"
replace name_2005 = "Roberto Hernandez Ramirez" if name_2005 == "Roberto Hernandez"
replace name_2005 = "Joanne (J.K.) Rowling" if name_2005 == "Joanne (JK) Rowling"
replace name_2005 = "Klaus-Michael Kuehne" if name_2005 == "Klaus-Michael KÙhne"
replace name_2005 = "Thomas Struengmann" if name_2005 == "Thomas StrÙngmann"
replace name_2005 = "JesÏs de Polanco" if name_2005 == "Jesus de Polanco"
replace name_2005 = "Andreas Struengmann" if name_2005 == "Andreas StrÙngmann"
replace name_2005 = "Alberto Bailleres Gonzalez" if name_2005 == "Alberto Bailleres"
replace name_2005 = "Ferit Faik Sahenk" if name_2005 == "Ferit Sahenk"
replace name_2005 = "Guy Lalibertí©" if name_2005 == "Guy Laliberte"
replace name_2005 = "Sylvia Stroeher" if name_2005 == "Sylvia Str_her"
replace name_2005 = "Carlos Alberto Sicupira" if name_2005 == "Carlos Sicupira"
replace name_2005 = "Ahmet Nazif Zorlu" if name_2005 == "Ahmet Zorlu"
replace name_2005 = "Reinhold Wuerth" if name_2005 == "Reinhold WÙrth"
replace name_2005 = "Marcel Herrmann Telles" if name_2005 == "Marcel Telles"
replace name_2005 = "Guenter Herz" if name_2005 == "GÙnter Herz"
replace name_2005 = "Saleh Al Rajhi" if name_2005 == "Saleh Bin Abdul Aziz Al Rajhi"
replace name_2005 = "Mustafa Rahmi Koc" if name_2005 == "Rahmi Koc"
replace name_2005 = "Bidzina Ivanishvili" if name_2005 == "Boris Ivanishvili"

rename name_2005 name 
rename country_2005 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-06"
 
order name country id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200518 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //58 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-05", replace

*******************
*200518-2004 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-05", clear

matchit id_200518 name using "2004minusUS.dta", idusing(id_2004) txtusing(name_2004)

gsort -similscore

joinby id_200518 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-05"
joinby id_2004 using "2004minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 /// 
country country_2004 name name_2004 similscore ///
age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2004 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-04", replace

*Changes in 2004 name variable 
use "2004minusUS.dta", clear

replace name_2004 = "Mohamed Al-Bahar" if name_2004 == "Mohamed A Al-Bahar"
replace name_2004 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2004 == "Rainer & Michael Schmidt-Ruthenbeck"
replace name_2004 = "Lee Kun-Hee" if name_2004 == "Kun-Hee Lee"
replace name_2004 = "John Dorrance, III." if name_2004 == "John Dorrance III"
replace name_2004 = "Mohammed Al Amoudi" if name_2004 == "Mohammad Al Amoudi"
replace name_2004 = "Raymond, Thomas & Walter Kwok" if name_2004 == "Walter, Thomas & Raymond Kwok"
replace name_2004 = "Tsai Wan-Tsai" if name_2004 == "Tsai Wan Tsai"
replace name_2004 = "Andrey Melnichenko" if name_2004 == "Andrei Melnichenko"
replace name_2004 = "Stefan Schorghuber" if name_2004 == "Stefan Sch_rghuber"
replace name_2004 = "Alexey Mordashov" if name_2004 == "Alexei Mordashov"
replace name_2004 = "Sulaiman Al Rajhi" if name_2004 == "Sulaiman Bin Abdul Al Rajhi"
replace name_2004 = "Sami & Yuli Ofer" if name_2004 == "Sammy & Yuli Ofer"
replace name_2004 = "Roberto Hernandez Ramirez" if name_2004 == "Roberto Hernandez"
replace name_2004 = "Joanne (J.K.) Rowling" if name_2004 == "Joanne (JK) Rowling"
replace name_2004 = "Klaus-Michael Kuehne" if name_2004 == "Klaus-Michael KÙhne"
replace name_2004 = "Alberto Bailleres Gonzalez" if name_2004 == "Alberto Bailleres"
replace name_2004 = "Ferit Faik Sahenk" if name_2004 == "Ferit Sahenk"
replace name_2004 = "Guy Lalibertí©" if name_2004 == "Guy Laliberte"
replace name_2004 = "Shin Kyuk-Ho" if name_2004 == "Shin Kyuk-ho"
replace name_2004 = "Sylvia Stroeher" if name_2004 == "Sylvia Str_her"
replace name_2004 = "Reinhold Wuerth" if name_2004 == "Reinhold WÙrth"
replace name_2004 = "Guenter Herz" if name_2004 == "GÙnter Herz"
replace name_2004 = "Saleh Al Rajhi" if name_2004 == "Saleh bin Abdul Aziz Al Rajhi"
replace name_2004 = "Charles Cadogan" if name_2004 == "Charles Gerald John Cadogan"
replace name_2004 = "Mustafa Rahmi Koc" if name_2004 == "Rahmi Koc"

rename name_2004 name 
rename country_2004 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-05"
 
order name country id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200418 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //60 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-04", replace

*******************
*200418-2003 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-04", clear

matchit id_200418 name using "2003minusUS.dta", idusing(id_2003) txtusing(name_2003)

gsort -similscore

joinby id_200418 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-04"
joinby id_2003 using "2003minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 /// 
country country_2003 name name_2003 similscore ///
age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2003 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-03", replace

*Changes in 2003 name variable 
use "2003minusUS.dta", clear

replace name_2003 = "Friedrich Flick Jr" if name_2003 == "Friedrich K Flick Jr"
replace name_2003 = "Maria-Elisabeth & Georg Schaeffler" if name_2003 == "Maria -Elisabeth & Georg Schaeffler"
replace name_2003 = "Vladimir Yevtushenkov" if name_2003 == "Vladimir P Yevtushenkov"
replace name_2003 = "Vasily Shakhnovsky" if name_2003 == "Vasily S Shakhnovsky"
replace name_2003 = "Mikhail Khodorkovsky" if name_2003 == "Mikhail B Khodorkovsky"
replace name_2003 = "Roman Abramovich" if name_2003 == "Roman A Abramovich"
replace name_2003 = "Lorenzo Mendoza" if name_2003 == "Lorenzo A Mendoza"
replace name_2003 = "Platon Lebedev" if name_2003 == "Platon L Lebedev"
replace name_2003 = "Mikhail Brudno" if name_2003 == "Mikhail B Brudno"
replace name_2003 = "Vladimir Potanin" if name_2003 == "Vladimir O Potanin"
replace name_2003 = "Charles Bronfman" if name_2003 == "Charles R Bronfman"
replace name_2003 = "Jeffrey Skoll" if name_2003 == "Jeffrey S Skoll"
replace name_2003 = "Pallonji Mistry" if name_2003 == "Pallonji S Mistry"
replace name_2003 = "Vagit Alekperov" if name_2003 == "Vagit Y Alekperov"
replace name_2003 = "Mikhail Fridman" if name_2003 == "Mikhail M Fridman"
replace name_2003 = "Vladimir Dubov" if name_2003 == "Vladimir M Dubov"
replace name_2003 = "Leonid Nevzlin" if name_2003 == "Leonid B Nevzlin"
replace name_2003 = "Oleg Deripaska" if name_2003 == "Oleg V Deripaska"
replace name_2003 = "Kumar Birla" if name_2003 == "Kumar M Birla"
replace name_2003 = "Daryl Katz" if name_2003 == "Daryl A Katz"
replace name_2003 = "G_rard Louis-Dreyfus" if name_2003 == "Girard Louis-Dreyfus"
replace name_2003 = "Raymond, Thomas & Walter Kwok" if name_2003 == "Walter, Thomas & Raymond Kwok"
replace name_2003 = "Stefan Schorghuber" if name_2003 == "Stefan Sch_rghuber"
replace name_2003 = "Willi & Isolde Liebherr" if name_2003 == "Willi and Isolde Liebherr"
replace name_2003 = "Kwek Leng Beng" if name_2003 == "Kwek¾Leng Beng"
replace name_2003 = "Sulaiman Al Rajhi" if name_2003 == "Sulaiman Bin Abdul Al Rajhi"
replace name_2003 = "Mohammed Al Amoudi" if name_2003 == "Mohammad H Al Amoudi"
replace name_2003 = "John Dorrance, III." if name_2003 == "John T Dorrance III"
replace name_2003 = "Roberto Hernandez Ramirez" if name_2003 == "Roberto Hernandez"
replace name_2003 = "Terence (Terry) Matthews" if name_2003 == "Terence Matthews"
replace name_2003 = "Klaus-Michael Kuehne" if name_2003 == "Klaus-Michael Kôhne"
replace name_2003 = "Charlene de Carvalho-Heineken" if name_2003 == "Charlene L de Carvalho"
replace name_2003 = "Alberto Bailleres Gonzalez" if name_2003 == "Alberto Bailleres"
replace name_2003 = "Ferit Faik Sahenk" if name_2003 == "Ferit Sahenk"
replace name_2003 = "Cheng Yu-tung" if name_2003 == "Cheng¾Yu-tung"
replace name_2003 = "Ng Teng Fong" if name_2003 == "Ng¾Teng Fong"
replace name_2003 = "Quek Leng Chan" if name_2003 == "Quek¾Leng Chan"
replace name_2003 = "Khoo Teck Puat" if name_2003 == "Khoo¾Teck Puat"
replace name_2003 = "Lee Shau Kee" if name_2003 == "Lee¾Shau Kee"
replace name_2003 = "Lee Seng Wee" if name_2003 == "Lee¾Seng Wee"
replace name_2003 = "Alexey Mordashov" if name_2003 == "Alexei A Mordashov"
replace name_2003 = "Chen Din Hwa" if name_2003 == "Chen¾Din Hwa"
replace name_2003 = "Reinhold Wuerth" if name_2003 == "Reinhold Wôrth"
replace name_2003 = "Lim Goh Tong" if name_2003 == "Lim¾Goh Tong"
replace name_2003 = "Tsai Wan Lin" if name_2003 == "Tsai¾Wan Lin"
replace name_2003 = "Guenter Herz" if name_2003 == "Gônter Herz"
replace name_2003 = "Wee Cho Yaw" if name_2003 == "Wee¾Cho Yaw"
replace name_2003 = "Li Ka-shing" if name_2003 == "Li¾Ka-shing"
replace name_2003 = "Tsai Wan-Tsai" if name_2003 == "Tsai¾Wan Tsai"
replace name_2003 = "Saleh Al Rajhi" if name_2003 == "Saleh bin Abdul Aziz Al Rajhi"
replace name_2003 = "Mustafa Rahmi Koc" if name_2003 == "Rahmi Koc"
replace name_2003 = "Lee Kun-Hee" if name_2003 == "Lee¾Kun-hee"
replace name_2003 = "Shin Kyuk-Ho" if name_2003 == "Shin¾Kyuk-ho"

rename name_2003 name 
rename country_2003 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-04"
 
order name country id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200318 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //60 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-03", replace

*******************
*200318-2002 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-03", clear

matchit id_200318 name using "2002minusUS.dta", idusing(id_2002) txtusing(name_2002)

gsort -similscore

joinby id_200318 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-03"
joinby id_2002 using "2002minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 /// 
country country_2002 name name_2002 similscore ///
age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2002 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-02", replace

*Changes in 2002 name variable 
use "2002minusUS.dta", clear

replace name_2002 = "Jaime Zobel de Ayala" if name_2002 == "Jaime A Zobel de Ayala"
replace name_2002 = "Jeffrey Skoll" if name_2002 == "Jeffrey S Skoll"
replace name_2002 = "Robert Bosch Jr" if name_2002 == "Robert Jr Bosch"
replace name_2002 = "Edward Rogers" if name_2002 == "Edward S Rogers"
replace name_2002 = "Mehmet Emin Karamehmet" if name_2002 == "Mehmet Karamehmet"
replace name_2002 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2002 == "Rainer & Michael Schmidt-Ruthenbeck"
replace name_2002 = "Kumar Birla" if name_2002 == "Kumar M Birla"
replace name_2002 = "Friedrich Flick Jr" if name_2002 == "Friedrich K Jr Flick"
replace name_2002 = "G_rard Louis-Dreyfus" if name_2002 == "Gerard Louis-Dreyfus"
replace name_2002 = "Raymond, Thomas & Walter Kwok" if name_2002 == "Walter, Thomas & Raymond Kwok"
replace name_2002 = "Reinhold Wuerth" if name_2002 == "Reinhold Wurth"
replace name_2002 = "Luis Carlos Sarmiento" if name_2002 == "Luis Carlos Sarmiento Angulo"
replace name_2002 = "Willi & Isolde Liebherr" if name_2002 == "Willi and Isolde Liebherr"
replace name_2002 = "Charlene de Carvalho-Heineken" if name_2002 == "Charlene de Carvalho"
replace name_2002 = "Sulaiman Al Rajhi" if name_2002 == "Sulaiman Bin Abdul Al Rajhi"
replace name_2002 = "Mohammed Al Amoudi" if name_2002 == "Mohammad H Al Amoudi"
replace name_2002 = "John Dorrance, III." if name_2002 == "John T III Dorrance"
replace name_2002 = "Roberto Hernandez Ramirez" if name_2002 == "Roberto Hernandez"
replace name_2002 = "Alberto Bailleres Gonzalez" if name_2002 == "Alberto Bailleres"
replace name_2002 = "Ferit Faik Sahenk" if name_2002 == "Ferit Sahenk"
replace name_2002 = "Ng Teng Fong" if name_2002 == "NgæTeng Fong"
replace name_2002 = "Cheng Yu-tung" if name_2002 == "ChengæYu-tung"
replace name_2002 = "Quek Leng Chan" if name_2002 == "QuekæLeng Chan"
replace name_2002 = "Khoo Teck Puat" if name_2002 == "KhooæTeck Puat"
replace name_2002 = "Yeoh Tiong Lay" if name_2002 == "YeohæTiong Lay"
replace name_2002 = "Lee Shau Kee" if name_2002 == "LeeæShau Kee"
replace name_2002 = "Chen Din Hwa" if name_2002 == "ChenæDin Hwa"
replace name_2002 = "Shari Arison" if name_2002 == "Shari Arison Dorsman"
replace name_2002 = "Lim Goh Tong" if name_2002 == "LimæGoh Tong"
replace name_2002 = "Li Ka-shing" if name_2002 == "LiæKa-shing"
replace name_2002 = "Terence (Terry) Matthews" if name_2002 == "Terry Matthews"
replace name_2002 = "Koo¾Chen-fu" if name_2002 == "KooæChen-fu"
replace name_2002 = "Mustafa Rahmi Koc" if name_2002 == "Rahmi Koc"
replace name_2002 = "Kwek Leng Beng" if name_2002 == "KwekæLeng"
replace name_2002 = "Shin Kyuk-Ho" if name_2002 == "ShinæKyuk-ho"
replace name_2002 = "Lee Seng Wee" if name_2002 == "LeeæSeng"
replace name_2002 = "Lee Kun-Hee" if name_2002 == "LeeæKun"

rename name_2002 name 
rename country_2002 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-03"
 
order name country id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200218 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //62 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-02", replace

*******************
*200218-2001 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-02", clear

matchit id_200218 name using "2001minusUS.dta", idusing(id_2001) txtusing(name_2001)

gsort -similscore

joinby id_200218 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-02"
joinby id_2001 using "2001minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 /// 
country country_2001 name name_2001 similscore ///
age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2001 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-01", replace

*Changes in 2001 name variable 
use "2001minusUS.dta", clear

replace name_2001 = "John A Fentener van Vlissingen" if name_2001 == "John A. Fentener van Vlissingen"
replace name_2001 = "Philippe Foriel-Destezet" if name_2001 == "Phillipe Foriel-Destezet"
replace name_2001 = "Karl & Theo Albrecht" if name_2001 == "Theo & Karl Albrecht"
replace name_2001 = "Klaus J Jacobs" if name_2001 == "Klaus Jacobs"
replace name_2001 = "Ananda Krishnan" if name_2001 == "T. Ananda Krishnan"
replace name_2001 = "Mehmet Emin Karamehmet" if name_2001 == "Mehmet Karamehmet"
replace name_2001 = "Alfredo Harp Helu" if name_2001 == "Alfredo Harp HelÏ"
replace name_2001 = "Maria Asuncion Aramburuzabala" if name_2001 == "Maria AsunciÑn Aramburuzabala"
replace name_2001 = "Michael & Reiner Schmidt-Ruthenbeck" if name_2001 == "Rainer & Michael Schmidt-Ruthenbeck"
replace name_2001 = "Charles Bronfman" if name_2001 == "Charles R. Bronfman"
replace name_2001 = "Maersk Mc-Kinney Moller" if name_2001 == "Maersk Mc-Kinney MÀller"
replace name_2001 = "Abilio dos Santos Diniz" if name_2001 == "AbÕlio dos Santos Diniz"
replace name_2001 = "Carlos Slim Helu" if name_2001 == "Carlos Slim HelÏ"
replace name_2001 = "Robert Bosch Jr" if name_2001 == "Robert Jr. Bosch"
replace name_2001 = "G_rard Louis-Dreyfus" if name_2001 == "Gerard Louis-Dreyfus"
replace name_2001 = "Raymond, Thomas & Walter Kwok" if name_2001 == "Walter, Thomas & Raymond Kwok"
replace name_2001 = "Luis Carlos Sarmiento" if name_2001 == "Luis Carlos Sarmiento Angulo"
replace name_2001 = "Stefan Schorghuber" if name_2001 == "Stefan Sch_rghuber"
replace name_2001 = "Emilio Azcarraga Jean" if name_2001 == "Emilio Azcàrraga Jean"
replace name_2001 = "Eugenio Garza Laguera" if name_2001 == "Eugenio Garza LagÙera"
replace name_2001 = "Paul Louis Halley" if name_2001 == "Paul-Louis Halley"
replace name_2001 = "Spiro Latsis" if name_2001 == "Spiros Latsis"
replace name_2001 = "Stein Erik Hagen" if name_2001 == "Stein-Erik Hagen"
replace name_2001 = "Kwek Leng Beng" if name_2001 == "KwekæLeng Beng"
replace name_2001 = "Jaime Zobel de Ayala" if name_2001 == "Jamie Zobel de Ayala"
replace name_2001 = "Sami & Yuli Ofer" if name_2001 == "Sammy & Yuli Ofer"
replace name_2001 = "Tiong Hiew King" if name_2001 == "TiongæHiew King"
replace name_2001 = "Roberto Hernandez Ramirez" if name_2001 == "Roberto Hernandez"
replace name_2001 = "Curt Engelhorn" if name_2001 == "Engelhorn Curt"
replace name_2001 = "Andre Kudelski" if name_2001 == "Andr_ Kudelski"
replace name_2001 = "Friedrich Flick Jr" if name_2001 == "Friedrich Karl Jr. Flick"
replace name_2001 = "Rem Vyakhirev" if name_2001 == "Rem Viakhirev"
replace name_2001 = "Alberto Bailleres Gonzalez" if name_2001 == "Alberto Bailleres"
replace name_2001 = "German Larrea Mota Velasco" if name_2001 == "Germàn Larrea Mota-Velasco"
replace name_2001 = "John Dorrance, III." if name_2001 == "John T. III Dorrance"
replace name_2001 = "Ferit Faik Sahenk" if name_2001 == "Ferit Sahenk"
replace name_2001 = "Jeronimo Arango" if name_2001 == "JerÑnimo Arango"
replace name_2001 = "Cheng Yu-tung" if name_2001 == "ChengæYu-tung"
replace name_2001 = "Ng Teng Fong" if name_2001 == "NgæTeng Fong"
replace name_2001 = "Sakip Sabanci" if name_2001 == "Sakip Sabani"
replace name_2001 = "Patrick Guerrand" if name_2001 == "Patrick Guerrand-Herms"
replace name_2001 = "Albert Frere" if name_2001 == "Albert Frre"
replace name_2001 = "Reinhold Wuerth" if name_2001 == "Reinhold Worth"
replace name_2001 = "Lee Seng Wee" if name_2001 == "LeeæSeng Wee"
replace name_2001 = "Quek Leng Chan" if name_2001 == "QuekæLeng Chan"
replace name_2001 = "Khoo Teck Puat" if name_2001 == "KhooæTeck Puat"
replace name_2001 = "Lee Shau Kee" if name_2001 == "LeeæShau Kee"
replace name_2001 = "Saleh Al Rajhi" if name_2001 == "Saleh Bin Abdul Al Rajhi"
replace name_2001 = "Chen Din Hwa" if name_2001 == "ChenæDin Hwa"
replace name_2001 = "Sulaiman Al Rajhi" if name_2001 == "Sulaiman bin Abdul Aziz Al Rajhi"
replace name_2001 = "Miuccia Prada" if name_2001 == "Miuccia Bianchi Prada"
replace name_2001 = "Rudolf August Oetker" if name_2001 == "Rudolf Oetker"
replace name_2001 = "Shari Arison" if name_2001 == "Shari Arison Dorsman"
replace name_2001 = "Emilio Botin" if name_2001 == "Emilio BotÕn"
replace name_2001 = "Jeffrey Skoll" if name_2001 == "Jeff Skoll"
replace name_2001 = "Guenter Herz" if name_2001 == "GÙnter Herz"
replace name_2001 = "Li Ka-shing" if name_2001 == "LiæKa-shing"
replace name_2001 = "Wee Cho Yaw" if name_2001 == "WeeæCho Yaw"
replace name_2001 = "Kumar Birla" if name_2001 == "Kumar Mangalam Birla"
replace name_2001 = "Edward Rogers" if name_2001 == "Edward S. (Ted) Rogers"
replace name_2001 = "Terence (Terry) Matthews" if name_2001 == "Terry Matthews"
replace name_2001 = "Koo¾Chen-fu" if name_2001 == "KooæChen-fu"
replace name_2001 = "Lee Kun-Hee" if name_2001 == "LeeæKun Hee"
replace name_2001 = "Chey Tae-Won" if name_2001 == "CheyæTaeWon"
replace name_2001 = "Terry Gou" if name_2001 == "Terry Kuo"
replace name_2001 = "Mustafa Rahmi Koc" if name_2001 == "Rahmi Ko"
replace name_2001 = "YC Wang" if name_2001 == "Y.C. Wang"

rename name_2001 name 
rename country_2001 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-02"
 
order name country id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200118 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //64 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-01", replace

*******************
*200118-2000 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-01", clear

matchit id_200118 name using "2000minusUS.dta", idusing(id_2000) txtusing(name_2000)

gsort -similscore

joinby id_200118 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-01"
joinby id_2000 using "2000minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 /// 
country country_2000 name name_2000 similscore ///
age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_2000 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-00", replace

*Changes in 2000 name variable 
use "2000minusUS.dta", clear

replace name_2000 = "Karl & Theo Albrecht" if name_2000 == "Theo & Karl Albrecht"
replace name_2000 = "Sammy and Yuli Ofer" if name_2000 == "Yuli and Sammy Ofer"
replace name_2000 = "Dirce Navarro De Camargo" if name_2000 == "Dirce Navarro Camargo"
replace name_2000 = "Klaus J Jacobs" if name_2000 == "Klaus Jacobs"
replace name_2000 = "German Larrea Mota Velasco" if name_2000 == "German Larrea Mota-Velasco"
replace name_2000 = "Stefan Schorghuber" if name_2000 == "Stefan Schoerghuber"
replace name_2000 = "Mehmet Emin Karamehmet" if name_2000 == "Mehmet Karamehmet"
replace name_2000 = "Charles Bronfman" if name_2000 == "Charles R. Bronfman"
replace name_2000 = "Hans-Werner Hector" if name_2000 == "Hans Werner Hector"
replace name_2000 = "G_rard Louis-Dreyfus" if name_2000 == "Gerard Louis-Dreyfus"
replace name_2000 = "Raymond, Thomas & Walter Kwok" if name_2000 == "Walter, Thomas & Raymond Kwok"
replace name_2000 = "Reinhold Wuerth" if name_2000 == "Reinhold Wurth"
replace name_2000 = "Rafael del Pino" if name_2000 == "Rafael Del Pino"
replace name_2000 = "Anthony Bamford" if name_2000 == "Sir Anthony Bamford"
replace name_2000 = "Adrian Swire" if name_2000 == "Sir Adrian Swire"
replace name_2000 = "Jeffrey Koo Sr" if name_2000 == "Jeffrey Koo"
replace name_2000 = "Paul Louis Halley" if name_2000 == "Paul-Louis Halley"
replace name_2000 = "Juan & Carlos March" if name_2000 == "Juan and Carlos March"
replace name_2000 = "Yoshitaka Fukuda" if name_2000 == "Yoshitake Fukuda"
replace name_2000 = "Joseph & Moise Safra" if name_2000 == "Joseph and Moise Safra"
replace name_2000 = "Lee Kun-Hee" if name_2000 == "Lee Kun-hee"
replace name_2000 = "Alberto Bailleres Gonzalez" if name_2000 == "Alberto Bailleres"
replace name_2000 = "Jose Luis Cutrale" if name_2000 == "Jose Cutrale"
replace name_2000 = "Robert Bosch Jr" if name_2000 == "Jr. Bosch Robert"
replace name_2000 = "Ikuo Ogihara" if name_2000 == "Ikuo Ogiwara"
replace name_2000 = "Chang Yung Fa" if name_2000 == "Chang Yung-fa"
replace name_2000 = "Guenter Herz" if name_2000 == "G|nter Herz"
replace name_2000 = "Georg Thyssen-Bornemisza" if name_2000 == `"Georg ("Heini Jr.") Thyssen-Bornemisza"'
replace name_2000 = "Rudolf August Oetker" if name_2000 == "Rudolf Oetker"
replace name_2000 = "Shari Arison" if name_2000 == "Shari Arison Dorsman"
replace name_2000 = "TsaiæWan-lin" if name_2000 == "Tsai Wan-lin"
replace name_2000 = "Jeffrey Skoll" if name_2000 == "Jeff Skoll"
replace name_2000 = "Kumar Birla" if name_2000 == "Kumar Mangalam Birla"
replace name_2000 = "Edward Rogers" if name_2000 == "Edward S. (Ted) Rogers"
replace name_2000 = "Terence (Terry) Matthews" if name_2000 == "Terry Matthews"
replace name_2000 = "Schickedanz daughters" if name_2000 == "Schickedanz"
replace name_2000 = "Abdul Aziz Al Ghurair" if name_2000 == "Abdul-Aziz Al-Ghurair"
replace name_2000 = "Saleh Al Rajhi" if name_2000 == "Saleh bin Abdul Aziz Al Rajhi"
replace name_2000 = "Mustafa Rahmi Koc" if name_2000 == "Rahmi Koc"
replace name_2000 = "Terry Gou" if name_2000 == "Terry Kuo"
replace name_2000 = "John Dorrance, III." if name_2000 == "John T. Dorrance 3rd"
replace name_2000 = "YC Wang" if name_2000 == "Y.C. Wang"

rename name_2000 name 
rename country_2000 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-01"
 
order name country id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_200018 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //66 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-00", replace

*******************
*200018-1999 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-00", clear

matchit id_200018 name using "1999minusUS.dta", idusing(id_1999) txtusing(name_1999)

gsort -similscore

joinby id_200018 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-00"
joinby id_1999 using "1999minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 /// 
country country_1999 name name_1999 similscore ///
age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1999 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-99", replace

*Changes in 1999 name variable 
use "1999minusUS.dta", clear

replace name_1999 = "Robert Bosch Jr" if name_1999 == "Robert Bosch Jr."
replace name_1999 = "Philippe Foriel-Destezet" if name_1999 == "Phillipe Foriel-Destezet"
replace name_1999 = "Karl & Theo Albrecht" if name_1999 == "Theo & Karl Albrecht"
replace name_1999 = "Sammy and Yuli Ofer" if name_1999 == "Yuli and Sammy Ofer"
replace name_1999 = "Dirce Navarro De Camargo" if name_1999 == "Dirce Navarro Camargo"
replace name_1999 = "Klaus J Jacobs" if name_1999 == "Klaus Jacobs"
replace name_1999 = "Ng Teng Fong and Robert" if name_1999 == "Teng Fong and Robert Ng"
replace name_1999 = "Stefan Schorghuber" if name_1999 == "Stefan Schoerghuber"
replace name_1999 = "Alexandre Soares dos Santos" if name_1999 == "Eliseo Alexandre Soares dos Santos"
replace name_1999 = "Charles Bronfman" if name_1999 == "Charles R. Bronfman"
replace name_1999 = "Belmiro de Azevedo" if name_1999 == "Belmiro Azevedo"
replace name_1999 = "von Siemens" if name_1999 == "Von Siemens"
replace name_1999 = "Hans-Werner Hector" if name_1999 == "Hans Werner Hector"
replace name_1999 = "G_rard Louis-Dreyfus" if name_1999 == "Gerard Louis-Dreyfus"
replace name_1999 = "Raymond, Thomas & Walter Kwok" if name_1999 == "Walter, Thomas & Raymond Kwok"
replace name_1999 = "Reinhold Wuerth" if name_1999 == "Reinhold Wurth"
replace name_1999 = "Rafael del Pino" if name_1999 == "Rafael Del Pino"
replace name_1999 = "Luis Carlos Sarmiento" if name_1999 == "Luis Carlos Sarmiento Angulo"
replace name_1999 = "Anthony Bamford" if name_1999 == "Sir Anthony Bamford"
replace name_1999 = "Adrian Swire" if name_1999 == "Sir Adrian Swire"
replace name_1999 = "Paul Louis Halley" if name_1999 == "Paul-Louis Halley"
replace name_1999 = "Chang Yung Fa" if name_1999 == "Yung Fa Chang"
replace name_1999 = "Juan & Carlos March" if name_1999 == "Juan and Carlos March"
replace name_1999 = "Yoshitaka Fukuda" if name_1999 == "Yoshitake Fukuda"
replace name_1999 = "Maersk Mc-Kinney Moller" if name_1999 == "Maersk Mc-kinney Mxller"
replace name_1999 = "Albert Frere" if name_1999 == "Baron Albert Frere"
replace name_1999 = "Carlos Ardila Lí_lle" if name_1999 == "Carlos Ardila Lulle"
replace name_1999 = "Friedrich Flick Jr" if name_1999 == "Friedrich Karl Jr. Flick"
replace name_1999 = "Lee Kun-Hee" if name_1999 == "Lee Kun-hee"
replace name_1999 = "Jose Luis Cutrale" if name_1999 == "Jose Cutrale"
replace name_1999 = "Guenter Herz" if name_1999 == "G|nter Herz"
replace name_1999 = "Rudolf August Oetker" if name_1999 == "Rudolf Oetker"
replace name_1999 = "Bernard Ecclestone" if name_1999 == "Bernie Ecclestone"
replace name_1999 = "TsaiæWan-lin" if name_1999 == "Tsai Wan-lin"
replace name_1999 = "LeeæHon Chiu" if name_1999 == "Lee Hon Chiu"
replace name_1999 = "Kumar Birla" if name_1999 == "Kumar Mangalam Birla"
replace name_1999 = "Edward Rogers" if name_1999 == "Edward S. (Ted) Rogers"
replace name_1999 = "Abdul Aziz Al Ghurair" if name_1999 == "Abdul-Aziz Al-Ghurair"
replace name_1999 = "Saleh Al Rajhi" if name_1999 == "Saleh bin Abdul Aziz Al Rajhi"
replace name_1999 = "Mustafa Rahmi Koc" if name_1999 == "Rahmi Koc"
replace name_1999 = "Abilio dos Santos Diniz" if name_1999 == "Abilio Diniz"
replace name_1999 = "Terry Gou" if name_1999 == "Terry Kuo"
replace name_1999 = "John Dorrance, III." if name_1999 == "John T. 3rd Dorrance"
replace name_1999 = "YC Wang" if name_1999 == "Y.C. Wang"

rename name_1999 name 
rename country_1999 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-00"
 
order name country id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199918 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //76 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-99", replace

*******************
*199918-1998 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-99", clear

matchit id_199918 name using "1998minusUS.dta", idusing(id_1998) txtusing(name_1998)

gsort -similscore

joinby id_199918 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-99"
joinby id_1998 using "1998minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 /// 
country country_1998 name name_1998 similscore ///
age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1998 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-98", replace

*Changes in 1998 name variable 
use "1998minusUS.dta", clear

replace name_1998 = "Karl & Theo Albrecht" if name_1998 == "Theo & Karl Albrecht"
replace name_1998 = "Chung Ju-yung" if name_1998 == "Ju-yung Chung"
replace name_1998 = "Ng Teng Fong and Robert" if name_1998 == "Teng Fong and Robert Ng"
replace name_1998 = "Maersk Mc-Kinney Moller" if name_1998 == "Maersk Mc-kinney Moller"
replace name_1998 = "Stefan Schorghuber" if name_1998 == "Stefan Schoerghuber"
replace name_1998 = "Charles Bronfman" if name_1998 == "Charles R. Bronfman"
replace name_1998 = "Belmiro de Azevedo" if name_1998 == "Belmiro Azevedo"
replace name_1998 = "G_rard Louis-Dreyfus" if name_1998 == "Gerard Louis-Dreyfus"
replace name_1998 = "Raymond, Thomas & Walter Kwok" if name_1998 == "Walter, Thomas & Raymond Kwok"
replace name_1998 = "Luis Carlos Sarmiento" if name_1998 == "Luis Carlos Sarmiento Angulo"
replace name_1998 = "Rafik Al-Hariri" if name_1998 == "Rafik Al-hariri"
replace name_1998 = "Giovanni Agnelli" if name_1998 == "Gianni Agnelli"
replace name_1998 = "Carlos Ardila Lí_lle" if name_1998 == "Carlos Ardila Lulle"
replace name_1998 = "Theodore Arison" if name_1998 == "Theodore (Ted) Arison"
replace name_1998 = "Chen Din Hwa" if name_1998 == "Din Hwa Chen"
replace name_1998 = "Abdullah Al Rajhi" if name_1998 == "Abdullah Sulaiman Al Rajhi"
replace name_1998 = "Jean-Louis Dumas" if name_1998 == "Jean-Louis Dumas-Hermes"
replace name_1998 = "Guenter Herz" if name_1998 == "G|nter Herz"
replace name_1998 = "Rudolf August Oetker" if name_1998 == "Rudolf Oetker"
replace name_1998 = "Dietmar and sons Hopp" if name_1998 == "Dietmar Hopp & sons"
replace name_1998 = "TsaiæWan-lin" if name_1998 == "Tsai Wan-lin"
replace name_1998 = "Mustafa Rahmi Koc" if name_1998 == "Rahmi Koc"
replace name_1998 = "Terry Gou" if name_1998 == "Terry Kuo"
replace name_1998 = "YC Wang" if name_1998 == "Y.C. Wang"

rename name_1998 name 
rename country_1998 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-99"
 
order name country id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199818 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //78 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-98", replace

*******************
*199818-1997 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-98", clear

matchit id_199818 name using "1997minusUS.dta", idusing(id_1997) txtusing(name_1997)

gsort -similscore

joinby id_199818 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-98"
joinby id_1997 using "1997minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 /// 
country country_1997 name name_1997 similscore ///
age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1997 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-97", replace

*Changes in 1997 name variable 
use "1997minusUS.dta", clear

replace name_1997 = "Liliane Bettencourt" if name_1997 == "Lilianne Bettencourt"
replace name_1997 = "Sheikh Jaber Al-ahmed Al-jaber Al-sabah" if name_1997 == "Sheikh Jaber Al-ahmed Al-jaber Al-Sabah"
replace name_1997 = "Sammy and Yuli Ofer" if name_1997 == "Yuli and Sammy Ofer"
replace name_1997 = "Ng Teng Fong and Robert" if name_1997 == "Robert and Teng Fong Ng"
replace name_1997 = "Antonio Ermirio de Moraes" if name_1997 == "Antonio Ermirio De Moraes"
replace name_1997 = "Amalia Lacroze de Fortabat" if name_1997 == "Amalia Lacroze De Fortabat"
replace name_1997 = "Ananda Krishnan" if name_1997 == "T. Ananda Krishnan"
replace name_1997 = "Maersk Mc-Kinney Moller" if name_1997 == "Maersk Mc-kinney Moller"
replace name_1997 = "Charles Bronfman" if name_1997 == "Charles R. Bronfman"
replace name_1997 = "G_rard Louis-Dreyfus" if name_1997 == "Gerard Louis-Dreyfus"
replace name_1997 = "Raymond, Thomas & Walter Kwok" if name_1997 == "Walter, Thomas & Raymond Kwok"
replace name_1997 = "Khalid Bin Mahfouz" if name_1997 == "Khalid Salim Bin Mahfouz"
replace name_1997 = "Anthony Bamford" if name_1997 == "Sir Anthony Bamford"
replace name_1997 = "Guenter Herz" if name_1997 == "Gunter Herz"
replace name_1997 = "Nasser Al-Kharafi" if name_1997 == "Nasser Al-kharafi"
replace name_1997 = "Rafik Al-Hariri" if name_1997 == "Rafik Al-hariri"
replace name_1997 = "Spiro Latsis" if name_1997 == "Spiros Latsis"
replace name_1997 = "Giovanni Agnelli" if name_1997 == "Gianni Agnelli"
replace name_1997 = "Carlos Ardila Lí_lle" if name_1997 == "Carlos Ardila Lulle"
replace name_1997 = "Friedrich Flick Jr" if name_1997 == "Friedrich Karl Jr. Flick"
replace name_1997 = "Oeri, Hoffman & Sacher families" if name_1997 == "Hoffman and Sacher families Oeri"
replace name_1997 = "Rem Vyakhirev" if name_1997 == "Rem Viakhirev"
replace name_1997 = "Lee Kun-Hee" if name_1997 == "Lee Kun-hee"
replace name_1997 = "Koo Bon-Moo" if name_1997 == "Koo Bon-moo"
replace name_1997 = "Jean-Louis Dumas" if name_1997 == "Jean-Louis Dumas-Hermes"
replace name_1997 = "Michael & Reiner Schmidt-Ruthenbeck" if name_1997 == "Michael & Rain Schmidt-Ruthenbeck Bros."
replace name_1997 = "Karl & Theo Albrecht" if name_1997 == "Theo and Karl Albrecht"
replace name_1997 = "Brenninkmeyer" if name_1997 == "Brenninkmeijer"
replace name_1997 = "Dietmar and sons Hopp" if name_1997 == "Dietmar And Sons Hopp"
replace name_1997 = "Rudolf August Oetker" if name_1997 == "Rudolf Oetker"
replace name_1997 = "TsaiæWan-lin" if name_1997 == "Tsai Wan-lin"
replace name_1997 = "Kumar Birla" if name_1997 == "Kumar Mangalam Birla"
replace name_1997 = "Mustafa Rahmi Koc" if name_1997 == "Rahmi Koc"
replace name_1997 = "Saleh Al Rajhi" if name_1997 == "Sheikh Saleh Bin Abdul Aziz Al-rajhi"

rename name_1997 name 
rename country_1997 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-98"
 
order name country id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199718 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //80 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-97", replace

*******************
*199718-1996 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-97", clear

matchit id_199718 name using "1996minusUS.dta", idusing(id_1996) txtusing(name_1996)

gsort -similscore

joinby id_199718 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-97"
joinby id_1996 using "1996minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 id_199718 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 id_1996 /// 
country country_1996 name name_1996 similscore ///
age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1996 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-96", replace

*Changes in 1996 name variable 
use "1996minusUS.dta", clear

replace name_1996 = "Maersk Mc-Kinney Moller" if name_1996 == "Maersk McKinney Moller"
replace name_1996 = "Kenkichi Nakajima" if name_1996 == "Kenkichi Nakajimi"
replace name_1996 = "Klaus J Jacobs" if name_1996 == "Klaus Jacobs"
replace name_1996 = "Carlos Slim Helu" if name_1996 == "Carlos Slim Hel7"
replace name_1996 = "Sir Adrian & Sir John Swire" if name_1996 == "Sir Adrian and Sir John Swire"
replace name_1996 = "Antonio Ermirio de Moraes" if name_1996 == "Antonio Ermfrio de Moraes"
replace name_1996 = "Ananda Krishnan" if name_1996 == "T. Ananda Krishnan"
replace name_1996 = "Roberto Gonzalez Barrera" if name_1996 == "Roberto Gonz_lez Barrera"
replace name_1996 = "John Gokongwei, Jr." if name_1996 == "John Gokongwei Jr."
replace name_1996 = "Julio Mario Santo Domingo" if name_1996 == "Julio Santo Domingo"
replace name_1996 = "Eugenio Garza Laguera" if name_1996 == "Eugenio Garza Lagnera"
replace name_1996 = "Seydoux/Schlumberger families" if name_1996 == "Families Seydoux/Schlumberger"
replace name_1996 = "Ng Teng Fong" if name_1996 == "Teng Fong"
replace name_1996 = "Stefan Schorghuber" if name_1996 == "Stefan Schwrghuber"
replace name_1996 = "Paul Louis Halley" if name_1996 == "Paul-Louis Halley"
replace name_1996 = "Woo-choong Kim" if name_1996 == "Kim Woo-choong"
replace name_1996 = "Jaime Zobel de Ayala" if name_1996 == "Jamie Zobel de Ayala"
replace name_1996 = "August & Wilhelm von Finck" if name_1996 == "Wilhelm and August von Finck"
replace name_1996 = "Gerard Mulliez" if name_1996 == "GTrard Mulliez"
replace name_1996 = "Carlos Ardila Lí_lle" if name_1996 == "Carlos Ardila Lulle"
replace name_1996 = "Friedrich Flick Jr" if name_1996 == "Friedrich Karl Jr. Flick"
replace name_1996 = "Lee Kun-Hee" if name_1996 == "Lee Kun-hee"
replace name_1996 = "John Dorrance, III." if name_1996 == "John T. III Dorrance"
replace name_1996 = "Shin Kyuk-Ho" if name_1996 == "Shin Kyuk-ho"
replace name_1996 = "Emilio Botin" if name_1996 == "Emilio Botfn"
replace name_1996 = "Reinhold Wuerth" if name_1996 == "Reinhold Wnrth"
replace name_1996 = "Jean-Louis Dumas" if name_1996 == "Jean-Louis Dumas (HermFs)"
replace name_1996 = "Chang Yung Fa" if name_1996 == "Chang Yung-fa"
replace name_1996 = "Karl & Theo Albrecht" if name_1996 == "Theo and Karl Albrecht"
replace name_1996 = "Brenninkmeyer" if name_1996 == "Brenninkmeijer"
replace name_1996 = "Guenter Herz" if name_1996 == "Gnnter Herz"
replace name_1996 = "Akio Morita" if name_1996 == "Morita Akio"
replace name_1996 = "Rudolf August Oetker" if name_1996 == "Rudolf Oetker"
replace name_1996 = "LeeæHon Chiu" if name_1996 == "Lee Hon Chiu"
replace name_1996 = "TsaiæWan-lin" if name_1996 == "Tsai Wan-lin"
replace name_1996 = "Saleh Kamel" if name_1996 == "Saleh Abdullah Kamel"
replace name_1996 = "Rochling" if name_1996 == "Rwchling"
replace name_1996 = "Alberto Bailleres Gonzalez" if name_1996 == "Alberto BaillFres"
replace name_1996 = "Rafik Al-Hariri" if name_1996 == "Rafic Hariri"
replace name_1996 = "Julio Bozano" if name_1996 == "Julio Rafael de Aragpo Bozano"
replace name_1996 = "Yue-che Wang" if name_1996 == "Yue-Che (Y.C.) Wang"
replace name_1996 = "Oeri, Hoffman & Sacher families" if name_1996 == "Oeri and Hoffman Paul Sacher"
replace name_1996 = "Henry Fok" if name_1996 == "Henry Ying-tung Fok"
replace name_1996 = "Mustafa Rahmi Koc" if name_1996 == "Rahmi Kot"
replace name_1996 = "Stroeher" if name_1996 == "Strwher"
replace name_1996 = "Yeoh Tiong Lay" if name_1996 == "Tiong-lay Yeoh"
replace name_1996 = "Abilio dos Santos Diniz" if name_1996 == "Abflio Diniz"

rename name_1996 name 
rename country_1996 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-97"
 
order name country id_1996 id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199618 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //96 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-96", replace

*******************
*199618-1995 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-96", clear

matchit id_199618 name using "1995minusUS.dta", idusing(id_1995) txtusing(name_1995)

gsort -similscore

joinby id_199618 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-96"
joinby id_1995 using "1995minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 id_199718 id_199618 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 id_1996 id_1995 /// 
country country_1995 name name_1995 similscore ///
age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1995 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-95", replace

*Changes in 1995 name variable 
use "1995minusUS.dta", clear

replace name_1995 = "Johanna, Susanne & Stefan Quandt" if name_1995 == "Johanna, Susanne and Stefan Quandt"
replace name_1995 = "Maersk Mc-Kinney Moller" if name_1995 == "Maersk McKinney Moller"
replace name_1995 = "Ng Teng Fong and Robert" if name_1995 == "Teng Fong and Robert Ng"
replace name_1995 = "Ananda Krishnan" if name_1995 == "T. Ananda Krishnan"
replace name_1995 = "Anacleto Angelini" if name_1995 == "Ancleto Angelini"
replace name_1995 = "John Gokongwei, Jr." if name_1995 == "John Gokongwei Jr."
replace name_1995 = "Emilio Azc_rraga Milmo" if name_1995 == "Emilio Azcarraga Milmo"
replace name_1995 = "Julio Mario Santo Domingo" if name_1995 == "Julio Santo Domingo"
replace name_1995 = "Kenneth Thomson" if name_1995 == "Kenneth R. Thomson"
replace name_1995 = "Albert von Thurn und Taxis" if name_1995 == "Prince Albert von Thurn und Taxis"
replace name_1995 = "Reinhold Wuerth" if name_1995 == "Reinhold Wurth"
replace name_1995 = "Andrew Gotianun" if name_1995 == "Andrew Gotianun Sr."
replace name_1995 = "Friedrich Flick Jr" if name_1995 == "Friedrich Karl Flick Jr."
replace name_1995 = "Guenter Herz" if name_1995 == "Gunter Herz"
replace name_1995 = "Paul Louis Halley" if name_1995 == "Paul-Louis Halley"
replace name_1995 = "Woo-choong Kim" if name_1995 == "Kim Woo-choong"
replace name_1995 = "Giovanni Agnelli" if name_1995 == "Gianni Agnelli"
replace name_1995 = "Karl & Theo Albrecht" if name_1995 == "Karl and Theo Albrecht"
replace name_1995 = "August & Wilhelm von Finck" if name_1995 == "Wilhelm and August von Finck"
replace name_1995 = "Carlos Ardila Lí_lle" if name_1995 == "Carlos Ardila Lulle"
replace name_1995 = "Seydoux/Schlumberger families" if name_1995 == "Seydoux/Schlumberger"
replace name_1995 = "Lee Kun-Hee" if name_1995 == "Lee Kun-hee"
replace name_1995 = "Mochtar Riady" if name_1995 == "Mochter Riady"
replace name_1995 = "Alberto Bailleres Gonzalez" if name_1995 == "Alberto Bailleres"
replace name_1995 = "John Dorrance, III." if name_1995 == "John T. Dorrance III"
replace name_1995 = "Shin Kyuk-Ho" if name_1995 == "Shin Kyuk-ho"
replace name_1995 = "Jaime Zobel de Ayala" if name_1995 == "Zamie Zobel de Ayala"
replace name_1995 = "Chang Yung Fa" if name_1995 == "Chang Yung-fa"
replace name_1995 = "Brenninkmeyer" if name_1995 == "Brenninkmeijer"
replace name_1995 = "Rudolf August Oetker" if name_1995 == "Rudolf Oetker"
replace name_1995 = "LeeæHon Chiu" if name_1995 == "Hon Chiu Lee"
replace name_1995 = "TsaiæWan-lin" if name_1995 == "Tsai Wan-lin"
replace name_1995 = "Gregorio Perez Companc" if name_1995 == "Perez Companc"
replace name_1995 = "Stroeher" if name_1995 == "Stroher"
replace name_1995 = "Yaw Teck-seng" if name_1995 == "Yaw Teck Seng"
replace name_1995 = "Julio Bozano" if name_1995 == "Julio Rafael de Aragao Bozano"
replace name_1995 = "Yue-che Wang" if name_1995 == "Yue-Che (Y.C.) Wang"
replace name_1995 = "Brost & Funke families" if name_1995 == "Brost and Funke"
replace name_1995 = "Oeri, Hoffman & Sacher families" if name_1995 == "Paul Sacher and Hoffmann"

rename name_1995 name 
rename country_1995 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-96"
 
order name country id_1995 id_1996 id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199518 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //98 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-95", replace

*******************
*199518-1994 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-95", clear

matchit id_199518 name using "1994minusUS.dta", idusing(id_1994) txtusing(name_1994)

gsort -similscore

joinby id_199518 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-95"
joinby id_1994 using "1994minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 id_199718 id_199618 id_199518 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 id_1996 id_1995 id_1994 /// 
country country_1994 name name_1994 similscore ///
age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1994 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-94", replace

*Changes in 1994 name variable 
use "1994minusUS.dta", clear

replace name_1994 = "Baron Hans Heinrich Thyssen-Bornesmisza" if name_1994 == "Baron Hans Heinrich Thyssen-Bornemisza"
replace name_1994 = "Johanna, Susanne & Stefan Quandt" if name_1994 == "Johanna, Susanne and Stefan Quandt"
replace name_1994 = "Klaus J Jacobs" if name_1994 == "Klaus Jacobs"
replace name_1994 = "Ng Teng Fong and Robert" if name_1994 == "Teng Fong and Robert Ng"
replace name_1994 = "Anacleto Angelini" if name_1994 == "Ancleto Angelini"
replace name_1994 = "Michel David-Weill" if name_1994 == "Michel David-Well"
replace name_1994 = "John Gokongwei, Jr." if name_1994 == "John Gokongwei Jr."
replace name_1994 = "Emilio Azc_rraga Milmo" if name_1994 == "Emilio Azcarraga Milmo"
replace name_1994 = "Kenneth Thomson" if name_1994 == "Kenneth R. Thomson"
replace name_1994 = "Albert von Thurn und Taxis" if name_1994 == "Prince Albert von Thurn und Taxis"
replace name_1994 = "Kenshin Oshima" if name_1994 == "Kenshim Oshima"
replace name_1994 = "Roberto Marinho" if name_1994 == "Robert Marinho"
replace name_1994 = "Friedrich Flick Jr" if name_1994 == "Friedrich Karl Flick Jr."
replace name_1994 = "Ryoichi Jinnai" if name_1994 == "Ryoichinnai"
replace name_1994 = "Eugenio Lopez" if name_1994 == "Eugenio Lopez Jr."
replace name_1994 = "Schickedanz" if name_1994 == "Schickendanz"
replace name_1994 = "Karl & Theo Albrecht" if name_1994 == "Karl and Theo Albrecht"
replace name_1994 = "August & Wilhelm von Finck" if name_1994 == "Wilhelm and August von Finck"
replace name_1994 = "Carlos Ardila Lí_lle" if name_1994 == "Carlos Ardila Lulle"
replace name_1994 = "Seydoux/Schlumberger families" if name_1994 == "Seydoux/Schlumberger"
replace name_1994 = "Rafik Al-Hariri" if name_1994 == "Rafik Hariri"
replace name_1994 = "Alberto Bailleres Gonzalez" if name_1994 == "Alberto Bailleres"
replace name_1994 = "Hiroshi Yamauchi" if name_1994 == "Hiroshi Yamuachi"
replace name_1994 = "Shin Kyuk-Ho" if name_1994 == "Shin Kyuk-ho"
replace name_1994 = "Edward Rogers" if name_1994 == "Edward (Ted) Rogers"
replace name_1994 = "Defforey" if name_1994 == "Deofforey"
replace name_1994 = "Chang Yung Fa" if name_1994 == "Chang Yung-fa"
replace name_1994 = "LeeæHon Chiu" if name_1994 == "Hon Chiu Lee"
replace name_1994 = "Gregorio Perez Companc" if name_1994 == "Perez Companc"
replace name_1994 = "Jorge Larrea" if name_1994 == "Jorge Larrea Ortega"
replace name_1994 = "Stroeher" if name_1994 == "Stroher"
replace name_1994 = "Saleh Kamel" if name_1994 == "Saleh Abdullah Kamel"
replace name_1994 = "Brothers Kwok" if name_1994 == "Kwok brothers"
replace name_1994 = "Yue-che Wang" if name_1994 == "Yue-Che (Y.C.) Wang"
replace name_1994 = "Brost & Funke families" if name_1994 == "Brost and Funke"
replace name_1994 = "Oeri, Hoffman & Sacher families" if name_1994 == "Paul Sacher and Hoffman"

rename name_1994 name 
rename country_1994 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-95"
 
order name country id_1994 id_1995 id_1996 id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199418 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //102 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-94", replace

*******************
*199418-1993 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-94", clear

matchit id_199418 name using "1993minusUS.dta", idusing(id_1993) txtusing(name_1993)

gsort -similscore

joinby id_199418 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-94"
joinby id_1993 using "1993minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 id_199718 id_199618 id_199518 id_199418 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 id_1996 id_1995 id_1994 id_1993 /// 
country country_1993 name name_1993 similscore ///
age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1993 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-93", replace

*Changes in 1993 name variable 
use "1993minusUS.dta", clear

replace name_1993 = "Baron Hans Heinrich Thyssen-Bornesmisza" if name_1993 == "Baron Hans Heinrich Thyssen-Bornemisza"
replace name_1993 = "Sophonpanichi" if name_1993 == "Sophonpanich"
replace name_1993 = "Johanna, Susanne & Stefan Quandt" if name_1993 == "Johanna, Susanne and Stefan Quandt"
replace name_1993 = "Klaus J Jacobs" if name_1993 == "Klaus Jacobs"
replace name_1993 = "Fentener van Vlissingen" if name_1993 == "Fentener Van Vlissingen"
replace name_1993 = "Emilio Azc_rraga Milmo" if name_1993 == "Emilio Azcarraga Milmo"
replace name_1993 = "August & Wilhelm von Finck" if name_1993 == "August and Wilhelm von Finck"
replace name_1993 = "Seydoux/Schlumberger families" if name_1993 == "Seydoux/Schlumberger"
replace name_1993 = "Alberto Bailleres Gonzalez" if name_1993 == "Alberto Bailleres"
replace name_1993 = "Friedrich Flick Jr" if name_1993 == "Friedrich Karl Flick"
replace name_1993 = "Shin Kyuk-Ho" if name_1993 == "Shin Kyuk-ho"
replace name_1993 = "Edward Rogers" if name_1993 == "Edward (Ted) Rogers"
replace name_1993 = "Chang Yung Fa" if name_1993 == "Chang Yung-fa"
replace name_1993 = "Karl & Theo Albrecht" if name_1993 == "Theo and Karl Albrecht"
replace name_1993 = "von Siemens" if name_1993 == "Siemens"
replace name_1993 = "Saleh Kamel" if name_1993 == "Saleh Abdullah Kamel"
replace name_1993 = "James, Arthur & John Irving" if name_1993 == "James, Arthur and Jack Irving"
replace name_1993 = "Gregorio Perez Companc" if name_1993 == "Perez Compane"
replace name_1993 = "Rafik Al-Hariri" if name_1993 == "Rajik Hariri"
replace name_1993 = "Yue-che Wang" if name_1993 == "Yue-Che (Y.C.) Wang"
replace name_1993 = "Brost & Funke families" if name_1993 == "Brost and Funke"
replace name_1993 = "Oeri, Hoffman & Sacher families" if name_1993 == "Paul Sacher and Hoffmann"

drop if name_1993 == "Servitje Sendra" & family_1993 == 0

rename name_1993 name 
rename country_1993 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-94"
 
order name country id_1993 id_1994 id_1995 id_1996 id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199318 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //102 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-93", replace

*******************
*199318-1992 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-93", clear

matchit id_199318 name using "1992minusUS.dta", idusing(id_1992) txtusing(name_1992)

gsort -similscore

joinby id_199318 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-93"
joinby id_1992 using "1992minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 id_199718 id_199618 id_199518 id_199418 id_199318 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 id_1996 id_1995 id_1994 id_1993 id_1992 /// 
country country_1992 name name_1992 similscore ///
age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1992 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-92", replace

*Changes in 1992 name variable 
use "1992minusUS.dta", clear

replace name_1992 = "Baron Hans Heinrich Thyssen-Bornesmisza" if name_1992 == "Baron Hans Heinrich Thyssen-Bornemisza"
replace name_1992 = "Sophonpanichi" if name_1992 == "Sophonpanich"
replace name_1992 = "Johanna, Susanne & Stefan Quandt" if name_1992 == "Johanna, Susanne and Stefan Quandt"
replace name_1992 = "Klaus J Jacobs" if name_1992 == "Klaus Jacobs"
replace name_1992 = "Fentener van Vlissingen" if name_1992 == "Fentener Van Vlissingen"
replace name_1992 = "Emilio Azc_rraga Milmo" if name_1992 == "Emilio Azcarraga Milmo"
replace name_1992 = "Yohachiro Iwasaki" if name_1992 == "Yohachiro Iawasaki"
replace name_1992 = "Kwek/Quek" if name_1992 == "Quek/Kwek"
replace name_1992 = "Kunio Busujima" if name_1992 == "Kunio Butsujima"
replace name_1992 = "August & Wilhelm von Finck" if name_1992 == "August and Wilhelm von Finck"
replace name_1992 = "Kenneth Thomson" if name_1992 == "Kenneth Roy Thomson"
replace name_1992 = "von Siemens" if name_1992 == "vons Siemens"
replace name_1992 = "Yoshimoto" if name_1992 == "Toshimoto"
replace name_1992 = "Sebastiao Camargo" if name_1992 == "Sabastiao Camargo"
replace name_1992 = "Karl-Heinz Kipp" if name_1992 == "Karl Heinz Kipp"
replace name_1992 = "Roberto Hernandez Ramirez" if name_1992 == "Roberto Hernandez"
replace name_1992 = "Seydoux/Schlumberger families" if name_1992 == "Seydoux/Schlumberger"
replace name_1992 = "Friedrich Flick Jr" if name_1992 == "Friedrick Karl Flick Jr."
replace name_1992 = "Engelhorn" if name_1992 == "Englhorn"
replace name_1992 = "Bin-Mahfouz" if name_1992 == "Bin Mahfouz"
replace name_1992 = "Gregorio Perez Companc" if name_1992 == "Perez Companc"
replace name_1992 = "Lee Shau Kee" if name_1992 == "Lee Shau-kee"
replace name_1992 = "Saleh Kamel" if name_1992 == "Saleh Abdullah Kamel"
replace name_1992 = "Edward Rogers" if name_1992 == "Edward S. (Ted) Rogers"
replace name_1992 = "Rafik Al-Hariri" if name_1992 == "Rafik B. Hariri"
replace name_1992 = "Maus and Nordmann" if name_1992 == "Maus/Nordmann"
replace name_1992 = "Erivan Haub" if name_1992 == "Ervian Haub"
replace name_1992 = "Brost & Funke families" if name_1992 == "Brost Funke"
replace name_1992 = "Yue-che Wang" if name_1992 == "Yue-Che (Y.C.) Wang"

rename name_1992 name 
rename country_1992 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-93"
 
order name country id_1992 id_1993 id_1994 id_1995 id_1996 id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199218 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //104 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-92", replace

*******************
*199218-1991 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-92", clear

matchit id_199218 name using "1991minusUS.dta", idusing(id_1991) txtusing(name_1991)

gsort -similscore

joinby id_199218 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-92"
joinby id_1991 using "1991minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 id_199718 id_199618 id_199518 id_199418 id_199318 id_199218 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 id_1996 id_1995 id_1994 id_1993 id_1992 id_1991 /// 
country country_1991 name name_1991 similscore ///
age_1991 age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1991 wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1991 family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1991 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-91", replace

*Changes in 1991 name variable 
use "1991minusUS.dta", clear

replace name_1991 = "Sophonpanichi" if name_1991 == "Sophonpanich"
replace name_1991 = "Klaus J Jacobs" if name_1991 == "Klaus Jacobs"
replace name_1991 = "Fentener van Vlissingen" if name_1991 == "Fentener Van Vlissingen"
replace name_1991 = "Shin Kyuk-ho (a.k.a. Takeo Shigemitsu)" if name_1991 == "Shin Kyuk-ho, a.k.a. Takeo Shigemitsu"
replace name_1991 = "von Siemens" if name_1991 == "Von Siemens"
replace name_1991 = "Albert von Thurn und Taxis" if name_1991 == "Prince Albert von Thurn und Taxis"
replace name_1991 = "August & Wilhelm von Finck" if name_1991 == "August and Wilhelm von Finck"
replace name_1991 = "Friedrich Flick Jr" if name_1991 == "Friedrich Karl Flick Jr."
replace name_1991 = "Kenneth Thomson" if name_1991 == "Kenneth Roy Thomson"
replace name_1991 = "Baron Hans Heinrich Thyssen-Bornesmisza" if name_1991 == "Hans Heinrich Thysen-Bornemisza"
replace name_1991 = "Tadahiro Yoshida" if name_1991 == "Tadao Yoshida"
replace name_1991 = "Karl-Heinz Kipp" if name_1991 == "Karl Heinz Kipp"
replace name_1991 = "Yung-fa Chang" if name_1991 == "Chang Yung-fa"
replace name_1991 = "Karl & Theo Albrecht" if name_1991 == "Karl and Theo Albrecht"
replace name_1991 = "Suliman Olayan" if name_1991 == "Suliman Saleh Olayan"
replace name_1991 = "Seydoux/Schlumberger families" if name_1991 == "Seydoux/Schlumberger"
replace name_1991 = "Nejat Ferit Eczacibasi" if name_1991 == "Nejat F. Eczacibasi"
replace name_1991 = "Heinz Bauer" if name_1991 == "Heinz Heinrich Bauer"
replace name_1991 = "Bin-Mahfouz" if name_1991 == "Bin Mahfouz"
replace name_1991 = "TsaiæWan-lin" if name_1991 == "Tsai Wan-lin"
replace name_1991 = "Lee Shau Kee" if name_1991 == "Lee Shau-kee"
replace name_1991 = "Saleh Kamel" if name_1991 == "Saleh Abdullah Kamel"
replace name_1991 = "Rafik Al-Hariri" if name_1991 == "Rafik B. Hariri"
replace name_1991 = "Maus and Nordmann" if name_1991 == "Maus/Nordmann"
replace name_1991 = "YC Wang" if name_1991 == "Y.C. Wang"

replace name_1991 = "Lee" if name_1991 == "Lee Shau kee" & country_1991 == "Singapore" 
replace name_1991 = "Lee" if name_1991 == "Lee Shau kee" & country_1991 == "Singapore" 

replace country_1991 = "Malaysia/Singapore" if name_1991 == "Kwek/Quek" 


rename name_1991 name 
rename country_1991 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-92"
 
order name country id_1991 id_1992 id_1993 id_1994 id_1995 id_1996 id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1991 age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1991 wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1991 family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199118 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //108 duplicates
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-91", replace

*******************
*199118-1990 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-91", clear

matchit id_199118 name using "1990minusUS.dta", idusing(id_1990) txtusing(name_1990)

gsort -similscore

joinby id_199118 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-91"
joinby id_1990 using "1990minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 id_199718 id_199618 id_199518 id_199418 id_199318 id_199218 id_199118 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 id_1996 id_1995 id_1994 id_1993 id_1992 id_1991 id_1990 /// 
country country_1990 name name_1990 similscore ///
age_1990 age_1991 age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1990 wealth_1991 wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1990 family_1991 family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1990 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-90", replace

*Changes in 1990 name variable 
use "1990minusUS.dta", clear

replace name_1990 = "Samuel Lord Vestey and Edmund Vestey" if name_1990 == "Samuel, Lord Vestey and Edmund Vestey"
replace name_1990 = "Shin Kyuk-ho (a.k.a. Takeo Shigemitsu)" if name_1990 == "Shin Kyuk-ho a.k.a. Takeo Shigemitsu"
replace name_1990 = "Abdul Aziz Al-Sulaiman" if name_1990 == "Abdul Aziz A. Al-Sulaiman"
replace name_1990 = "Klaus J Jacobs" if name_1990 == "Klaus Jacobs"
replace name_1990 = "Fentener van Vlissingen" if name_1990 == "Fentener Van Vlissingen"
replace name_1990 = "von Oppenheim" if name_1990 == "Von Oppenheim"
replace name_1990 = "von Siemens" if name_1990 == "Von Siemens"
replace name_1990 = "David Sainsbury" if name_1990 == "David Sainbury"
replace name_1990 = "Kenneth Thomson" if name_1990 == "Kenneth Roy Thomson"
replace name_1990 = "Baron Hans Heinrich Thyssen-Bornesmisza" if name_1990 == "Hans Heinrich Thyssen-Bornemisza"
replace name_1990 = "Sir Yue-kong Pao" if name_1990 == "Sir Yue-Kong Pao"
replace name_1990 = "Tadahiro Yoshida" if name_1990 == "Tadao Yoshida"
replace name_1990 = "Karl-Heinz Kipp" if name_1990 == "Karl Heinz Kipp"
replace name_1990 = "Yung-fa Chang" if name_1990 == "Chang Yung-fa"
replace name_1990 = "Suliman Olayan" if name_1990 == "Suliman Saleh Olayan"
replace name_1990 = "Seydoux/Schlumberger families" if name_1990 == "Seydoux/Schlumberger"
replace name_1990 = "Swarovski" if name_1990 == "Swarovoski"
replace name_1990 = "Friedrich Flick Jr" if name_1990 == "Friedrich Karl Flick"
replace name_1990 = "Bin-Mahfouz" if name_1990 == "Bin Mahfouz"
replace name_1990 = "Garza-Sada" if name_1990 == "Garza Sada"
replace name_1990 = "August & Wilhelm von Finck" if name_1990 == "Wilhelm and August Von Finck"
replace name_1990 = "Rafik Al-Hariri" if name_1990 == "Rafik B. Hariri"
replace name_1990 = "Maus and Nordmann" if name_1990 == "Maus-Nordmann"
replace name_1990 = "Huang Shi Hue" if name_1990 == "Dr. Shi H. Huang"
replace name_1990 = "YC Wang" if name_1990 == "Y.C. Wang"

replace country_1990 = "Malaysia/Singapore" if name_1990 == "Kwek/Quek" 

rename name_1990 name 
rename country_1990 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-91"
 
order name country id_1990 id_1991 id_1992 id_1993 id_1994 id_1995 id_1996 id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1990 age_1991 age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1990 wealth_1991 wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1990 family_1991 family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_199018 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //118 duplicates, 1 triplet
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-90", replace

*******************
*199018-1989 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-90", clear

matchit id_199018 name using "1989minusUS.dta", idusing(id_1989) txtusing(name_1989)

gsort -similscore

joinby id_199018 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-90"
joinby id_1989 using "1989minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 id_199718 id_199618 id_199518 id_199418 id_199318 id_199218 id_199118 id_199018 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 id_1996 id_1995 id_1994 id_1993 id_1992 id_1991 id_1990 id_1989 /// 
country country_1989 name name_1989 similscore ///
age_1989 age_1990 age_1991 age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1989 wealth_1990 wealth_1991 wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1989 family_1990 family_1991 family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1989 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-89", replace

*Changes in 1989 name variable 
use "1989minusUS.dta", clear

replace name_1989 = "Fentener van Vlissingen" if name_1989 == "Fentener Van Vlissingen"
replace name_1989 = "von Oppenheim" if name_1989 == "Von Oppenheim"
replace name_1989 = "Paul, Albert and Ralph Reichmann" if name_1989 == "Albert, Paul and Ralph Reichmann"
replace name_1989 = "Abdul Aziz Al-Sulaiman" if name_1989 == "Abdul-Aziz A. Al-Sulaiman"
replace name_1989 = "Samuel Lord Vestey and Edmund Vestey" if name_1989 == "Lord Vestey and Edmund"
replace name_1989 = "von Siemens" if name_1989 == "Von Siemens"
replace name_1989 = "Kenneth Thomson" if name_1989 == "Kenneth Roy Thomson"
replace name_1989 = "Baron Hans Heinrich Thyssen-Bornesmisza" if name_1989 == "Hans Heinrich Thyssen-Bornemisza"
replace name_1989 = "Tadahiro Yoshida" if name_1989 == "Tadao Yoshida"
replace name_1989 = "Hideki Yokoi" if name_1989 == "Hieki Yokoi"
replace name_1989 = "Suliman Olayan" if name_1989 == "Suliman Saleh Olayan"
replace name_1989 = "Swarovski" if name_1989 == "Swaraovski"
replace name_1989 = "Friedrich Flick Jr" if name_1989 == "Friedrich Karl Flick"
replace name_1989 = "Bin-Mahfouz" if name_1989 == "Bin Mahfouz"
replace name_1989 = "Seydoux/Schlumberger families" if name_1989 == "Schlumberger/Seydoux"
replace name_1989 = "Garza-Sada" if name_1989 == "Garza Sada"
replace name_1989 = "August & Wilhelm von Finck" if name_1989 == "Wilhelm Von Finck August Von Finck"

rename name_1989 name 
rename country_1989 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-90"
 
order name country id_1989 id_1990 id_1991 id_1992 id_1993 id_1994 id_1995 id_1996 id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1989 age_1990 age_1991 age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1989 wealth_1990 wealth_1991 wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1989 family_1990 family_1991 family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_198918 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //122 duplicates, 1 triplet
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-89", replace

*******************
*198918-1988 merge*
*******************

use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-89", clear

matchit id_198918 name using "1988minusUS.dta", idusing(id_1988) txtusing(name_1988)

gsort -similscore

joinby id_198918 using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-89"
joinby id_1988 using "1988minusUS.dta" 

order id_201718 id_201618 id_201518 id_201418 id_201318 id_201218 id_201118 id_201018 id_200918 id_200818 id_200718 id_200618 id_200518 id_200418 id_200318 id_200218 id_200118 id_200018 id_199918 id_199818 id_199718 id_199618 id_199518 id_199418 id_199318 id_199218 id_199118 id_199018 id_198918 ///
id_2018 id_2017 id_2016 id_2015 id_2014 id_2013 id_2012 id_2011 id_2010 id_2009 id_2008 id_2007 id_2006 id_2005 id_2004 id_2003 id_2002 id_2001 id_2000 id_1999 id_1998 id_1997 id_1996 id_1995 id_1994 id_1993 id_1992 id_1991 id_1990 id_1989 id_1988 /// 
country country_1988 name name_1988 similscore ///
age_1988 age_1989 age_1990 age_1991 age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1988 wealth_1989 wealth_1990 wealth_1991 wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1988 family_1989 family_1990 family_1991 family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018 

bys name_1988 (similscore): keep if _n == _N
keep if similscore != 1 
gsort -similscore

save "${SavePath}/statadata/harmonized_names/matchit2/matchit_18-88", replace

*Changes in 1988 name variable 
use "1988minusUS.dta", clear

replace name_1988 = "Sheikh Zayed Bin Sultan Al Nahyan" if name_1988 == "Sheikh Zayed Bin Sultan Al Nahayan"
replace name_1988 = "Prince Johannes Von Thurn Und Taxis" if name_1988 == "Prince Johannes Thurn Und Taxis"
replace name_1988 = "Baron Hans Heinrich Thyssen-Bornesmisza" if name_1988 == "Baron Heinrich Thyssen-Bornemisza"
replace name_1988 = "Alfred Heineken" if name_1988 == "Alfred Henry Heineken"
replace name_1988 = "August von Finck" if name_1988 == "August Von Finck"
replace name_1988 = "Vehbi M. Koc" if name_1988 == "Vehbi Koc"
replace name_1988 = "Abdul Aziz Al-Sulaiman" if name_1988 == "Abdul-Aziz Al Suliman"
replace name_1988 = "Friedrich Flick Jr" if name_1988 == "Friedrich Karl Flick"
replace name_1988 = "Erivan Haub" if name_1988 == "Erivan Karl Haub"
replace name_1988 = "Gerald Cavendish Grosvenor" if name_1988 == "Gerald Grosvenor"
replace name_1988 = "Li Ka-shing" if name_1988 == "Li Ka-Shing"
replace name_1988 = "Sheikh Jaber Al-ahmed Al-jaber Al-sabah" if name_1988 == "Sheikh Jaber Ahmed Al Sabah"
replace name_1988 = "Y.K. Pao" if name_1988 == "Sir Y. K. Pao"
replace name_1988 = "Suliman Olayan" if name_1988 == "Suliman Saleh Oyalan"
replace name_1988 = "Anton Dressmann" if name_1988 == "Anton Caspar Rudolph Dreesmann"
replace name_1988 = "YC Wang" if name_1988 == "Y.C. Wang"

duplicates drop name_1988 country_1988, force //Dropping duplicate observation of Genshiro Kawamoto

rename name_1988 name 
rename country_1988 country
merge 1:1 name country using "${SavePath}/statadata/harmonized_names/harmonized_names2/18-89"
 
order name country id_1988 id_1989 id_1990 id_1991 id_1992 id_1993 id_1994 id_1995 id_1996 id_1997 id_1998 id_1999 id_2000 id_2001 id_2002 id_2003 id_2004 id_2005 id_2006 id_2007 id_2008 id_2009 id_2010 id_2011 id_2012 id_2013 id_2014 id_2015 id_2016 id_2017 id_2018 ///
age_1988 age_1989 age_1990 age_1991 age_1992 age_1993 age_1994 age_1995 age_1996 age_1997 age_1998 age_1999 age_2000 age_2001 age_2002 age_2003 age_2004 age_2005 age_2006 age_2007 age_2008 age_2009 age_2010 age_2011 age_2012 age_2013 age_2014 age_2015 age_2016 age_2017 age_2018 ///
wealth_1988 wealth_1989 wealth_1990 wealth_1991 wealth_1992 wealth_1993 wealth_1994 wealth_1995 wealth_1996 wealth_1997 wealth_1998 wealth_1999 wealth_2000 wealth_2001 wealth_2002 wealth_2003 wealth_2004 wealth_2005 wealth_2006 wealth_2007 wealth_2008 wealth_2009 wealth_2010 wealth_2011 wealth_2012 wealth_2013 wealth_2014 wealth_2015 wealth_2016 wealth_2017 wealth_2018 ///
family_1988 family_1989 family_1990 family_1991 family_1992 family_1993 family_1994 family_1995 family_1996 family_1997 family_1998 family_1999 family_2000 family_2001 family_2002 family_2003 family_2004 family_2005 family_2006 family_2007 family_2008 family_2009 family_2010 family_2011 family_2012 family_2013 family_2014 family_2015 family_2016 family_2017 family_2018  

sort name
gen id_198818 = _n 
drop _merge 

duplicates tag name, gen(nametag) 
tab nametag 
browse if nametag > 0 //124 duplicates, 2 triplet
drop nametag 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-88", replace

*Making some general changes* 
use "${SavePath}/statadata/harmonized_names/harmonized_names2/18-88", clear 

replace country = "South Korea" if country == "Korea" 
replace country = strtrim(country) 

save "${SavePath}/statadata/harmonized_names/harmonized_names2/18-88", replace















