qui{
*#############################################################################################*
*							                                  								  *
*THIS DO FILE GENERATES NAME-HARMONIZED DATASETS (CLEAN, NOT SHOWING THE DIRTY WORK BEHIND IT)*				
*							  							      								  *
*#############################################################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

cd ${SavePath}/statadata/yearlyminusUS2

*2017* 
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

save "2017minusUS.dta", replace 

*2016* 
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

save "2016minusUS.dta", replace 

*2015*
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

save "2015minusUS.dta", replace 

*2014* 
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

save "2014minusUS.dta", replace 

*2013* 
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

save "2013minusUS.dta", replace 

*2012* 
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

save "2012minusUS.dta", replace  

*2011*
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

save "2011minusUS.dta", replace  

*2010* 
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

save "2010minusUS.dta", replace  

*2009* 
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

save "2009minusUS.dta", replace  

*2008* 
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

save "2008minusUS.dta", replace   

*2007* 
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

save "2007minusUS.dta", replace   

*2006* 
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

save "2006minusUS.dta", replace   
 
*2005* 
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

save "2005minusUS.dta", replace   

*2004* 
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

save "2004minusUS.dta", replace    

*2003* 
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

save "2003minusUS.dta", replace     

*2002* 
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

save "2002minusUS.dta", replace     

*2001* 
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

save "2001minusUS.dta", replace      

*2000* 
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
replace name_2000 = "Abdul Aziz Al Ghurair" if name_2000 == "Abdul-Aziz Al-Ghurair"
replace name_2000 = "Saleh Al Rajhi" if name_2000 == "Saleh bin Abdul Aziz Al Rajhi"
replace name_2000 = "Mustafa Rahmi Koc" if name_2000 == "Rahmi Koc"
replace name_2000 = "Terry Gou" if name_2000 == "Terry Kuo"
replace name_2000 = "John Dorrance, III." if name_2000 == "John T. Dorrance 3rd"
replace name_2000 = "YC Wang" if name_2000 == "Y.C. Wang" 

save "2000minusUS.dta", replace      

*1999* 
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

save "1999minusUS.dta", replace       

*1998* 
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

save "1998minusUS.dta", replace        

*1997* 
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
replace name_1997 = "Oeri, Hoffman & Sacher" if name_1997 == "Hoffman and Sacher Oeri"
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

save "1997minusUS.dta", replace         

*1996* 
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
replace name_1996 = "Oeri, Hoffman & Sacher" if name_1996 == "Oeri and Hoffman Paul Sacher"
replace name_1996 = "Henry Fok" if name_1996 == "Henry Ying-tung Fok"
replace name_1996 = "Mustafa Rahmi Koc" if name_1996 == "Rahmi Kot"
replace name_1996 = "Stroeher" if name_1996 == "Strwher"
replace name_1996 = "Yeoh Tiong Lay" if name_1996 == "Tiong-lay Yeoh"
replace name_1996 = "Abilio dos Santos Diniz" if name_1996 == "Abflio Diniz"
replace name_1996 = "Theodore Arison" if name_1996 == "Ted Arison"

save "1996minusUS.dta", replace          

*1995* 
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
replace name_1995 = "Brost & Funke" if name_1995 == "Brost and Funke"
replace name_1995 = "Oeri, Hoffman & Sacher " if name_1995 == "Paul Sacher and Hoffmann" 

save "1995minusUS.dta", replace          

*1994* 
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
replace name_1994 = "Yue-che Wang" if name_1994 == "Yue-Che (Y.C.) Wang"
replace name_1994 = "Brost & Funke" if name_1994 == "Brost and Funke"
replace name_1994 = "Oeri, Hoffman & Sacher" if name_1994 == "Paul Sacher and Hoffman"
replace name_1994 = "Theodore Arison" if name_1994 == "Ted Arison"

save "1994minusUS.dta", replace           

*1993* 
use "1993minusUS.dta", clear

replace name_1993 = "Baron Hans Heinrich Thyssen-Bornesmisza" if name_1993 == "Baron Hans Heinrich Thyssen-Bornemisza"
replace name_1993 = "Sophonpanichi" if name_1993 == "Sophonpanich"
replace name_1993 = "Johanna, Susanne & Stefan Quandt" if name_1993 == "Johanna, Susanne and Stefan Quandt"
replace name_1993 = "Klaus J Jacobs" if name_1993 == "Klaus Jacobs"
replace name_1993 = "Fentener van Vlissingen" if name_1993 == "Fentener Van Vlissingen"
replace name_1993 = "Emilio Azc_rraga Milmo" if name_1993 == "Emilio Azcarraga Milmo"
replace name_1993 = "August & Wilhelm von Finck" if name_1993 == "August and Wilhelm von Finck"
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
replace name_1993 = "Brost & Funke" if name_1993 == "Brost and Funke"
replace name_1993 = "Oeri, Hoffman & Sacher" if name_1993 == "Paul Sacher and Hoffmann"

drop if name_1993 == "Servitje Sendra" & family_1993 == 0

save "1993minusUS.dta", replace            

*1992* 
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
replace name_1992 = "Brost & Funke" if name_1992 == "Brost Funke"
replace name_1992 = "Yue-che Wang" if name_1992 == "Yue-Che (Y.C.) Wang"

replace name_1992 = "Shin Kyuk-Ho" if name_1992 == "Shin Kyuk-ho (a.k.a. Takeo Shigemitsu)" //After creating final dataset name edit

save "1992minusUS.dta", replace             

*1991*
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
replace name_1991 = "Nejat Ferit Eczacibasi" if name_1991 == "Nejat F. Eczacibasi"
replace name_1991 = "Heinz Bauer" if name_1991 == "Heinz Heinrich Bauer"
replace name_1991 = "Bin-Mahfouz" if name_1991 == "Bin Mahfouz"
replace name_1991 = "TsaiæWan-lin" if name_1991 == "Tsai Wan-lin"
replace name_1991 = "Lee Shau Kee" if name_1991 == "Lee Shau-kee"
replace name_1991 = "Saleh Kamel" if name_1991 == "Saleh Abdullah Kamel"
replace name_1991 = "Rafik Al-Hariri" if name_1991 == "Rafik B. Hariri"
replace name_1991 = "Maus and Nordmann" if name_1991 == "Maus/Nordmann"
replace name_1991 = "YC Wang" if name_1991 == "Y.C. Wang"

replace name_1991 = "Lee" if name_1991 == "Lee Shau Kee" & country_1991 == "Singapore" 

replace country_1991 = "Malaysia/Singapore" if name_1991 == "Kwek/Quek"

replace name_1991 = "Shin Kyuk-Ho" if name_1991 == "Shin Kyuk-ho (a.k.a. Takeo Shigemitsu)" //After creating final dataset name edit

save "1991minusUS.dta", replace              

*1990* 
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

replace name_1990 = "Shin Kyuk-Ho" if name_1990 == "Shin Kyuk-ho (a.k.a. Takeo Shigemitsu)" //After creating final dataset name edit

save "1990minusUS.dta", replace               

*1989* 
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
replace name_1989 = "Seydoux/Schlumberger" if name_1989 == "Schlumberger/Seydoux"
replace name_1989 = "Garza-Sada" if name_1989 == "Garza Sada"
replace name_1989 = "August & Wilhelm von Finck" if name_1989 == "Wilhelm Von Finck August Von Finck"
replace name_1989 = "Rafik Al-Hariri" if name_1989 == "Rafik Bahauddin Hariri"

save "1989minusUS.dta", replace                

*1988* 
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
replace name_1988 = "Sulaiman Al Rajhi" if name_1988 == "Suliman Abdul-Aziz Al Rajhi"
replace name_1988 = "King Faud Bin Abdul Aziz Alsaud" if name_1988 == "KING FAHD BIN ABDUL AZIZ AL SAUD"
replace name_1988 = "Queen Elizabeth II" if name_1988 == "QUEEN ELIZABETH II"
replace name_1988 = "Karl & Theo Albrecht" if name_1988 == "Karl Albrecht and Theo Albrecht"


duplicates drop name_1988 country_1988, force //Dropping duplicate observation of Genshiro Kawamoto 

save "1988minusUS.dta", replace  

*Changing unit of wealth for years 1988-1998* 
forval i = 1988/1995 {

	use "`i'minusUS.dta", clear
	replace wealth_`i' = wealth_`i' * 1000000000
	save "`i'minusUS.dta", replace 

}              

*Deleting year suffix for each year* 
forval i = 1988/2018 { 

	use "`i'minusUS.dta", clear
	gen year = `i' 
	rename *_`i' * 
	drop id 
	order year name country age family
	save "`i'minusUS.dta", replace 

} 

*Appending datasets together* 
use "2018minusUS.dta", clear 

forval i = 2017(-1)1988 {

	append using "`i'minusUS.dta"

}

order year name country wealth age family 
gsort name -year country wealth age family

*Changing Korea to South Korea* 
replace country = "South Korea" if country == "Korea" 

*Creating id variable* 
egen id = group(name) if name != "Koo" & name != "Lee" & name != "Robert Miller" 

replace id = 2895 if name == "Koo" & country == "South Korea" 
replace id = 2896 if name == "Koo" & country == "Taiwan" 
replace id = 2897 if name == "Lee" & country == "Singapore" 
replace id = 2898 if name == "Lee" & country == "South Korea" 
replace id = 2899 if name == "Robert Miller" & country == "Canada" 
replace id = 2900 if name == "Robert Miller" & (country == "United Kingdom" | country == "Hong Kong") 

*Creating dummy to indicate observation exists pre fill in* 
gen prefillin = 1 

*Saving harmonized dataset!* 
saveold "${SavePath}/statadata/harmonized_names/harmonized_names2/88-18_final", replace 

cd "${SavePath}/statadata/harmonized_names/harmonized_names2" 

use "${SavePath}/statadata/harmonized_names/harmonized_names2/88-18_final", clear
tset id year, yearly 
bys id: keep if _n == 1
rename name newname
tempfile tempname
save `tempname'

use "${SavePath}/statadata/harmonized_names/harmonized_names2/88-18_final", clear
tset id year, yearly
bys id country: keep if _n == 1
keep id country
drop if missing(country)
bys id: gen t = _N
drop if t > 1
rename country newcountry
tempfile tempcountry
save `tempcountry'

use "${SavePath}/statadata/harmonized_names/harmonized_names2/88-18_final"
tset id year, yearly
tsfill, full
merge m:1 id using `tempname', nogen
merge m:1 id using `tempcountry', nogen
replace country = newcountry if missing(country) 
replace name = newname if missing(name) 

drop newname newcountry t

rename *, lower

saveold "${SavePath}/statadata/harmonized_names/harmonized_names2/88-18_final", replace 

*Filling in ages for previous years if missing age but appeared in Forbes* 
use "${SavePath}/statadata/harmonized_names/harmonized_names2/88-18_final", clear

gsort id -year 
quietly by id: replace age = age[_n-1] - 1 if missing(age)  
replace age = . if missing(prefillin) 

sort id year 

*Creating family name* 
gen reversed = reverse(name)  
split reversed, p(" ") 
gen lastname = reverse(reversed1) 

drop reversed*

keep if prefillin == 1 


/*  */
gen name_standardize = name
replace name_standardize = subinstr(name_standardize, "Jr.", "", .)
replace name_standardize = subinstr(name_standardize, ",", "", .)
replace name_standardize = subinstr(name_standardize, ",", "", .)
replace name_standardize = trim(name)
gen lastname2 = regexs(1) if regexm(name_standardize, " ([a-zA-Z0-9\-\/]*)$")
replace lastname2 = name if missing(lastname2)



bysort id: gen yearorder = _n //want to keep oldest observation for familyname purposes
keep if yearorder == 1 
drop yearorder 

sort lastname year id

gen familyname = . 
x
replace familyname = "Giovanni Agnelli" if name == "Giovanni Agnelli" | name == "Agnelli" | name == "Umberto Agnelli"
replace familyname = "Lia Maria Aguiar" if name == "Lia Maria Aguiar" | name == "Lina Maria Aguiar" 
replace familyname = "Al-Ghanim" if name == "Al-Ghanim" | name == "Bassam Alghanim" | name == "Kutayba Alghanim" 
replace familyname = "Rafik Al-Hariri" if name == "Rafik Al-Hariri" | name == "Saad Hariri" | ///
name == "Ayman Hariri" | name == "Fahd Hariri" | name == "Hind Hariri" | name == "Nazek Hariri"
replace familyname = "Mohamed Abdul Mohsin Al-Kharafi" if name == "Mohamed Abdul Mohsin Al-Kharafi" | ///
name == "Al-Kharafi" | name == "Jassim Al-Kharafi" | name == "Nasser Al-Kharafi" | name == "Fawzi Al-Kharafi" | ///
name == "Mohannad Al-Kharafi" 
replace familyname = "Sheikh Rashid Bin Said Al Maktoum" if name == "Sheikh Rashid Bin Said Al Maktoum" | name == "Makhtoum bin Rashid Al-Maktoum" 
replace familyname = "Sulaiman Al Rajhi" if name == "Sulaiman Al Rajhi" | name == "Saleh Al Rajhi" | ///
name == "Abdullah Al Rajhi" | name == "Mohammed Al Rajhi" 
replace familyname = "Karl & Theo Albrecht" if name == "Karl & Theo Albrecht" | name == "Albrecht" | ///
name == "Karl Albrecht" | name == "Theo Albrecht" | name == "Berthold & Theo Jr. Albrecht" 
replace familyname = "Abdulaziz Bin Hamad Algosaibi" if name == "Abdulaziz Bin Hamad Algosaibi" | ///
name == "Saud Abdul Aziz Algosaibi" | name == "Sulaiman Algosaibi"
replace familyname = "Abdul Majeed Alhokair" if name == "Abdul Majeed Alhokair" | name == "Fawaz Alhokair" | name == "Salman Alhokair"
replace familyname = "King Faud Bin Abdul Aziz Alsaud" if name == "King Faud Bin Abdul Aziz Alsaud" | ///
name == "Prince Alwaleed Bin Talal Alsaud" 
replace familyname = "Ambani" if name == "Ambani" | name == "Dhirubhai Ambani" | name == "Mukesh & Anil Ambani" | ///
name == "Anil Ambani" | name == "Mukesh Ambani"
replace familyname = "Americo Amorim" if name == "Americo Amorim" | name == "Maria Fernanda Amorim" 
replace familyname = "Alexei Ananyev" if name == "Alexei Ananyev" | name == "Dmitry Ananyev" 
replace familyname = "Eduardo Belmont Anderson" if name == "Eduardo Belmont Anderson" | name == "Juan Fernando Belmont Anderson" 
replace familyname = "Andrade" if name == "Andrade" | name == "Roberto and Gabriel Andrade" | ///
name == "Sergio Lins Andrade"
replace familyname = "AndrT" if name == "AndrT" | name == "Henri and Eric Andre"
replace familyname = "Alexandra Andresen" if name == "Alexandra Andresen" | name == "Katharina Andresen"
replace familyname = "Aramburuzabala" if name == "Aramburuzabala" | name == "Maria Asuncion Aramburuzabala"
replace familyname = "Arango" if name == "Arango" | name == "Jeronimo Arango"
replace familyname = "Theodore Arison" if name == "Theodore Arison" | name == "Shari Arison"
replace familyname = "Anant Asavabhokhin" if name == "Anant Asavabhokhin" | name == "Boonsong Asavabhokhin"
replace familyname = "Zobel de Ayala" if name == "Zobel de Ayala" | name == "Jaime Zobel de Ayala" | ///
name == "Jaime Augusto Zobel de Ayala"
replace familyname = "Mohammed Bahwan" if name == "Mohammed Bahwan" | name == "Suhail Bahwan" 
replace familyname = "Rahul Bajaj" if name == "Rahul Bajaj" | name == "Shishir Bajaj" | name == "Bajaj"
replace familyname = "Benu Gopal Bangur" if name == "Benu Gopal Bangur" | name == "Krishna Kumar Bangur" 
replace familyname = "Emanuella Barilla" if name == "Emanuella Barilla" | name == "Guido Barilla" | ///
name == "Luca Barilla" | name == "Paolo Barilla"
replace familyname = "Heinz Bauer" if name == "Heinz Bauer" | name == "Yvonne Bauer" 
replace familyname = "Anne Beaufour" if name == "Anne Beaufour" | name == "Henri Beaufour" 
replace familyname = "Benetton" if name == "Benetton" | name == "Luciano Benetton" | name == "Carlo Benetton" | ///
name == "Gilberto Benetton" | name == "Giuliana Benetton"  
replace familyname = "Fabio Bertarelli" if name == "Fabio Bertarelli" | name == "Ernesto And Fabio Bertarelli" | ///
name == "Ernesto Bertarelli" | name == "Dona Bertarelli" 
replace familyname = "Emmanuel Besnier" if name == "Emmanuel Besnier" | name == "Jean-Michel Besnier"
replace familyname = "Salem Ahmed Bin Mahfouz" if name == "Salem Ahmed Bin Mahfouz" | name == "Bin-Mahfouz" | ///
name == "Mohamed Salim Bin Mahfouz" | name == "Khalid Bin Mahfouz" 
replace familyname = "Birla" if name == "Birla" | name == "Kumar Birla" 
replace familyname = "Juergen Blickle" if name == "Juergen Blickle" | name == "Rainer Blickle" 
replace familyname = "Christoph Blocher" if name == "Christoph Blocher" | name == "Rahel Blocher" | ///
name == "Markus Blocher" 
replace familyname = "Albert Blokker" if name == "Albert Blokker" | name == "Els Blokker"
replace familyname = "Adisai Bodharamik" if name == "Adisai Bodharamik" | name == "Pete Bodharamik"
replace familyname = "Koo South Korea" if name == "Koo Bon-Moo" | name == "Koo Bon-Joon" | name == "Koo Bon-Neung" ///
name == "Koo Bon-Sik" | (name == "Koo" & country == "South Korea")




x



 browse if strpos(lower(name), "johan") > 0

}
replace name_standardize = trim(name)
