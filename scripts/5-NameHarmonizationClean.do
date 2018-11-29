*#############################################################################################*
*							                                  								  *
*THIS DO FILE GENERATES NAME-HARMONIZED DATASETS (CLEAN, NOT SHOWING THE DIRTY WORK BEHIND IT)*				
*							  							      								  *
*#############################################################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

cd ${SavePath}/statadata/yearlyminusUS

*2015*
use WorldBillionaires2015minusUS, clear

replace Name_2015 = "Wang Wei (young)" if Name_2015 == "Wang Wei" & Age_2015 == 46 

save WorldBillionaires2015minusUS, replace

*2014* 
use WorldBillionaires2014minusUS, clear

replace Name_2014 = "Erika Pohl-Stroeher" if Name_2014 == "Erika Pohl-Stroher"

save WorldBillionaires2014minusUS, replace 

*2013* 
use WorldBillionaires2013minusUS, clear

replace Name_2013 = "Alejandro Santo Domingo" if Name_2013 == "Alejandro Santo Domingo Davila"
replace Name_2013 = "Hubert d'Ornano" if Name_2013 == "Hubert D'Ornano"
replace Name_2013 = "Gina Rinehart" if Name_2013 == "Georgina Rinehart"
     
save WorldBillionaires2013minusUS, replace 

*2012* 
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

save WorldBillionaires2012minusUS, replace 

*2011*
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

replace Country_2011 = "" if Country_2011 == "NA"

save WorldBillionaires2011minusUS, replace 

*2010* 
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

save WorldBillionaires2010minusUS, replace 

*2009* 
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

save WorldBillionaires2009minusUS, replace 

*2008* 
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

save WorldBillionaires2008minusUS, replace 

*2007* 
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

save WorldBillionaires2007minusUS, replace 

*2006* 
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

save WorldBillionaires2006minusUS, replace 

*2005* 
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

save WorldBillionaires2005minusUS, replace 

*2004* 
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

replace Country_2004 = "" if Country_2004 == "n/a"

save WorldBillionaires2004minusUS, replace 

*2003* 
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

save WorldBillionaires2003minusUS, replace 

*2002* 
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

save WorldBillionaires2002minusUS, replace 

*2001* 
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

save WorldBillionaires2001minusUS, replace 

*2000* 
use WorldBillionaires2000minusUS, clear

replace Name_2000 = "Zhong Sheng Jian" if Name_2000 == "Sheng Jian Zhong"
replace Name_2000 = "Hong Piow Teh" if Name_2000 == "Teh Hong Piow"
replace Name_2000 = "Tseng Shin-Yi" if Name_2000 == "Tseng Shin-yi"
replace Name_2000 = "Wei Yin-Chun" if Name_2000 == "Yin-Chun Wei"
replace Name_2000 = "Wu Chung-Yi" if Name_2000 == "Wu Chung-yi"

save WorldBillionaires2000minusUS, replace 

*1999* 
use WorldBillionaires1999minusUS, clear

replace Name_1999 = "Zhong Sheng Jian" if Name_1999 == "Sheng Jian Zhong"
replace Name_1999 = "Hong Piow Teh" if Name_1999 == "Teh Hong Piow"
replace Name_1999 = "Tseng Shin-Yi" if Name_1999 == "Tseng Shin-yi"
replace Name_1999 = "Wei Yin-Chun" if Name_1999 == "Yin-Chun Wei"
replace Name_1999 = "Wu Chung-Yi" if Name_1999 == "Wu Chung-yi"

save WorldBillionaires1999minusUS, replace 

*1998* 
use WorldBillionaires1998minusUS, clear

replace Name_1998 = "Charles Bronfman" if Name_1998 == "Charles R. Bronfman"
replace Name_1998 = "Belmiro de Azevedo" if Name_1998 == "Belmiro Azevedo"
replace Name_1998 = "Guenter Herz" if Name_1998 == "Gunter Herz"
replace Name_1998 = "Cheng Yu-tung" if Name_1998 == "Cheng Yu-Tung"
replace Name_1998 = "James, Arthur &#38; John Irving" if Name_1998 == "James, Arthur and John Irving"
replace Name_1998 = "Carlos Ardila LÃ¼lle" if Name_1998 == "Carlos Ardila Lulle"
replace Name_1998 = "Saleh Al Rajhi" if Name_1998 == "Saleh Bin Abdul Aziz Al Rajhi"
replace Name_1998 = "Mustafa Rahmi Koc" if Name_1998 == "Rahmi Koc"

replace Country_1998 = "" if Country_1998 == "?" 
replace Country_1998 = "South Korea" if Country_1998 == "Korea" 

save WorldBillionaires1998minusUS, replace 

*1997* 
use WorldBillionaires1997minusUS, clear
    
drop if Name_1997 == "Prince Alwaleed Bin Talal Al Saud" // Deleting duplicate observation of Prince Alwaleed Bin Talal Alsaud 

replace Name_1997 = "Teng Fong and Robert Ng" if Name_1997 == "Robert and Teng Fong Ng"
replace Name_1997 = "Amir Jaber Al-Ahmed Al-Jaber Al-Sabah" if Name_1997 == "Sheikh Jaber Al-Ahmed Al-Jaber Al-Sabah"
replace Name_1997 = "Ananda Krishnan" if Name_1997 == "T. Ananda Krishnan"
replace Name_1997 = "Maersk Mr-Kinney Moller" if Name_1997 == "Maersk Mc-Kinney Moller"
replace Name_1997 = "Charles Bronfman" if Name_1997 == "Charles R. Bronfman"
replace Name_1997 = "Dhirubhai Ambani" if Name_1997 == "Dhirubai Ambani"
replace Name_1997 = "King Faud Bin Abdul Aziz Alsaud" if Name_1997 == "King Fahd Bin Abdulaziz Alsaud"
replace Name_1997 = "Anthony Bamford" if Name_1997 == "Sir Anthony Bamford"
replace Name_1997 = "Luis Carlos Sarmiento" if Name_1997 == "Luis Carlos Sarmiento Ángulo"
replace Name_1997 = "Rafik al-Hariri" if Name_1997 == "Rafik Al-Hariri"
replace Name_1997 = "Spiro Latsis" if Name_1997 == "Spiros Latsis"
replace Name_1997 = "Koo Bon-Moo" if Name_1997 == "Koo Bon-moo"
replace Name_1997 = "Lee Kun-Hee" if Name_1997 == "Lee Kun-hee"
replace Name_1997 = "James, Arthur &#38; John Irving" if Name_1997 == "James, Arthur and John Irving"
replace Name_1997 = "Ferdinand Piech" if Name_1997 == "Ferdinand Piëch"
replace Name_1997 = "Carlos Ardila LÃ¼lle" if Name_1997 == "Carlos Ardila Lulle"
replace Name_1997 = "Brenninkmeyer" if Name_1997 == "Brenninkmeijer"
replace Name_1997 = "Guenter Herz" if Name_1997 == "Günter Herz"
replace Name_1997 = "Kumar Birla" if Name_1997 == "Kumar Mangalam Birla"
replace Name_1997 = "Mustafa Rahmi Koc" if Name_1997 == "Rahmi Koc"
replace Name_1997 = "Saleh Al Rajhi" if Name_1997 == "Saleh Bin Abdul Aziz Al-Rahji"

replace Country_1997 = "India" if Country_1997 == "lndia" 
replace Country_1997 = "Indonesia" if Country_1997 == "lndonesia" 
replace Country_1997 = "Italy" if Country_1997 == "ltaly"
replace Country_1997 = "South Korea" if Country_1997 == "Korea" 
 

replace Wealth_1997 = Wealth_1997/1000 if Wealth_1997 > 1000 

save WorldBillionaires1997minusUS, replace 

*1996* 
use WorldBillionaires1996minusUS, clear

duplicates drop Name Country, force //Deleting duplicate observation of AndrT 

replace Name_1996 = "Carlos Slim Helu" if Name_1996 == "Carlos Slim Hel7"
replace Name_1996 = "Antonio Ermirio de Moraes" if Name_1996 == "Antonio Ermfrio de Moraes"
replace Name_1996 = "Ananda Krishnan" if Name_1996 == "T. Ananda Krishnan"
replace Name_1996 = "Roberto Gonzalez Barrera" if Name_1996 == "Roberto Gonz_lez Barrera"
replace Name_1996 = "John Gokongwei, Jr." if Name_1996 == "John Gokongwei Jr."
replace Name_1996 = "Julio Mario Santo Domingo" if Name_1996 == "Julio Santo Domingo"
replace Name_1996 = "Maersk Mr-Kinney Moller" if Name_1996 == "Maersk McKinney Moller"
replace Name_1996 = "Eugenio Garza Laguera" if Name_1996 == "Eugenio Garza Lagnera"
replace Name_1996 = "Yosbiaki Tsutsumi" if Name_1996 == "Yoshiaki Tsutsumi"
replace Name_1996 = "Luis Carlos Sarmiento" if Name_1996 == "Luis Carlos Sarmiento Angulo"
replace Name_1996 = "Gianni Agnelli" if Name_1996 == "Giovanni Agnelli"
replace Name_1996 = "Jaime Zobel de Ayala" if Name_1996 == "Jamie Zobel de Ayala"
replace Name_1996 = "Gerard Mulliez" if Name_1996 == "GTrard Mulliez"
replace Name_1996 = "Seydoux/Schlumberger" if Name_1996 == "Families Seydoux/Schlumberger"
replace Name_1996 = "Hong Piow Teh" if Name_1996 == "Teh Hong Piow"
replace Name_1996 = "Lee Kun-Hee" if Name_1996 == "Lee Kun-hee"
replace Name_1996 = "John Dorrance, III." if Name_1996 == "John T. III Dorrance"
replace Name_1996 = "Carlos Ardila LÃ¼lle" if Name_1996 == "Carlos Ardila Lulle"
replace Name_1996 = "Emilio Botin" if Name_1996 == "Emilio Botfn"
replace Name_1996 = "Reinhold Wuerth" if Name_1996 == "Reinhold Wnrth"
replace Name_1996 = "Chang Yung Fa" if Name_1996 == "Chang Yung-fa"
replace Name_1996 = "Guenter Herz" if Name_1996 == "Gnnter Herz"
replace Name_1996 = "Brenninkmeyer" if Name_1996 == "Brenninkmeijer"
replace Name_1996 = "Jean-Louis Dumas-Hermes" if Name_1996 == "Jean-Louis Dumas (HermFs)"
replace Name_1996 = "Saleh Kamel" if Name_1996 == "Saleh Abdullah Kamel"
replace Name_1996 = "Shi Wen Long" if Name_1996 == "Shi Wen-long"
replace Name_1996 = "Alberto Bailleres Gonzalez" if Name_1996 == "Alberto BaillFres"
replace Name_1996 = "Rafik al-Hariri" if Name_1996 == "Rafic Hariri"
replace Name_1996 = "Julio Bozano" if Name_1996 == "Julio Rafael de Aragpo Bozano"
replace Name_1996 = "Yue-che Wang" if Name_1996 == "Yue-Che (Y.C.) Wang"
replace Name_1996 = "Henry Fok" if Name_1996 == "Henry Ying-tung Fok"
replace Name_1996 = "Mustafa Rahmi Koc" if Name_1996 == "Rahmi Kot"
replace Name_1996 = "Yeoh Tiong Lay" if Name_1996 == "Tiong-lay Yeoh"
replace Name_1996 = "Abilio dos Santos Diniz" if Name_1996 == "Abflio Diniz"

replace Country_1996 = "South Korea" if Country_1996 == "Korea" 

save WorldBillionaires1996minusUS, replace 

*1995* 
use WorldBillionaires1995minusUS, clear

replace Name_1995 = "Friedrich Karl Jr. Flick" if Name_1995 == "Friedrich Karl Flick Jr."
replace Name_1995 = "Theo and Karl Albrecht" if Name_1995 == "Karl and Theo Albrecht"
replace Name_1995 = "Kenkichi Nakajimi" if Name_1995 == "Kenkichi Nakajima"
replace Name_1995 = "Ananda Krishnan" if Name_1995 == "T. Ananda Krishnan"
replace Name_1995 = "Anacleto Angelini" if Name_1995 == "Ancleto Angelini"
replace Name_1995 = "John Gokongwei, Jr." if Name_1995 == "John Gokongwei Jr."
replace Name_1995 = "Emilio Azc_rraga Milmo" if Name_1995 == "Emilio Azcarraga Milmo"
replace Name_1995 = "Julio Mario Santo Domingo" if Name_1995 == "Julio Santo Domingo"
replace Name_1995 = "Kenneth Thomson" if Name_1995 == "Kenneth R. Thomson"
replace Name_1995 = "Maersk Mr-Kinney Moller" if Name_1995 == "Maersk McKinney Moller"
replace Name_1995 = "Albert von Thurn und Taxis" if Name_1995 == "Prince Albert von Thurn und Taxis"
replace Name_1995 = "Paul Sacher and Oeri and Hoffman" if Name_1995 == "Paul Sacher and Hoffmann"
replace Name_1995 = "Reinhold Wuerth" if Name_1995 == "Reinhold Wurth"
replace Name_1995 = "Yosbiaki Tsutsumi" if Name_1995 == "Yoshiaki Tsutsumi"
replace Name_1995 = "Luis Carlos Sarmiento" if Name_1995 == "Luis Carlos Sarmiento Angulo"
replace Name_1995 = "Stefan Schwrghuber" if Name_1995 == "Stefan Schorghuber"
replace Name_1995 = "Andrew Gotianun" if Name_1995 == "Andrew Gotianun Sr."
replace Name_1995 = "Guenter Herz" if Name_1995 == "Gunter Herz"
replace Name_1995 = "Mochtar Riady" if Name_1995 == "Mochter Riady"
replace Name_1995 = "Lee Kun-Hee" if Name_1995 == "Lee Kun-hee"
replace Name_1995 = "Alberto Bailleres Gonzalez" if Name_1995 == "Alberto Bailleres"
replace Name_1995 = "John Dorrance, III." if Name_1995 == "John T. Dorrance III"
replace Name_1995 = "Carlos Ardila LÃ¼lle" if Name_1995 == "Carlos Ardila Lulle"
replace Name_1995 = "Lee Hon Chiu" if Name_1995 == "Hon Chiu Lee"
replace Name_1995 = "Jaime Zobel de Ayala" if Name_1995 == "Zamie Zobel de Ayala"
replace Name_1995 = "Chang Yung Fa" if Name_1995 == "Chang Yung-fa"
replace Name_1995 = "Brenninkmeyer" if Name_1995 == "Brenninkmeijer"
replace Name_1995 = "Yaw Teck-seng" if Name_1995 == "Yaw Teck Seng"
replace Name_1995 = "Julio Bozano" if Name_1995 == "Julio Rafael de Aragao Bozano"
replace Name_1995 = "Yue-che Wang" if Name_1995 == "Yue-Che (Y.C.) Wang"

replace Country_1995 = "South Korea" if Country_1995 == "Korea" 

save WorldBillionaires1995minusUS, replace 

*1994* 
use WorldBillionaires1994minusUS, clear

replace Name_1994 = "Friedrich Karl Jr. Flick" if Name_1994 == "Friedrich Karl Flick Jr."
replace Name_1994 = "Baron Hans Heinrich Thyssen-Bornesmisza" if Name_1994 == "Baron Hans Heinrich Thyssen-Bornemisza"
replace Name_1994 = "Theo and Karl Albrecht" if Name_1994 == "Karl and Theo Albrecht"
replace Name_1994 = "Kenkichi Nakajimi" if Name_1994 == "Kenkichi Nakajima"
replace Name_1994 = "John Gokongwei, Jr." if Name_1994 == "John Gokongwei Jr."
replace Name_1994 = "Anacleto Angelini" if Name_1994 == "Ancleto Angelini"
replace Name_1994 = "Michel David-Weill" if Name_1994 == "Michel David-Well"
replace Name_1994 = "Emilio Azc_rraga Milmo" if Name_1994 == "Emilio Azcarraga Milmo"
replace Name_1994 = "Paul Sacher and Oeri and Hoffman" if Name_1994 == "Paul Sacher and Hoffman"
replace Name_1994 = "Kenneth Thomson" if Name_1994 == "Kenneth R. Thomson"
replace Name_1994 = "Albert von Thurn und Taxis" if Name_1994 == "Prince Albert von Thurn und Taxis"
replace Name_1994 = "Kenshin Oshima" if Name_1994 == "Kenshim Oshima"
replace Name_1994 = "Roberto Marinho" if Name_1994 == "Robert Marinho"
replace Name_1994 = "Yosbiaki Tsutsumi" if Name_1994 == "Yoshiaki Tsutsumi"
replace Name_1994 = "Luis Carlos Sarmiento" if Name_1994 == "Luis Carlos Sarmiento Angulo"
replace Name_1994 = "Ryoichi Jinnai" if Name_1994 == "Ryoichinnai"
replace Name_1994 = "Eugenio Lopez" if Name_1994 == "Eugenio Lopez Jr."
replace Name_1994 = "Schickedanz" if Name_1994 == "Schickendanz"
replace Name_1994 = "Jaime Zobel de Ayala" if Name_1994 == "Zobel de Ayala"
replace Name_1994 = "Kwok Brothers" if Name_1994 == "Kwok brothers"
replace Name_1994 = "Rafik al-Hariri" if Name_1994 == "Rafik Hariri"
replace Name_1994 = "Alberto Bailleres Gonzalez" if Name_1994 == "Alberto Bailleres"
replace Name_1994 = "Hiroshi Yamauchi" if Name_1994 == "Hiroshi Yamuachi"
replace Name_1994 = "Carlos Ardila LÃ¼lle" if Name_1994 == "Carlos Ardila Lulle"
replace Name_1994 = "Lee Hon Chiu" if Name_1994 == "Hon Chiu Lee"
replace Name_1994 = "Chang Yung Fa" if Name_1994 == "Chang Yung-fa"
replace Name_1994 = "Jorge Larrea" if Name_1994 == "Jorge Larrea Ortega"
replace Name_1994 = "Saleh Kamel" if Name_1994 == "Saleh Abdullah Kamel"
replace Name_1994 = "Julio Bozano" if Name_1994 == "Juilo Bozano"
replace Name_1994 = "Huang Shi-hui" if Name_1994 == "Huang Shi Hue"
replace Name_1994 = "Yue-che Wang" if Name_1994 == "Yue-Che (Y.C.) Wang"

replace Country_1994 = "South Korea" if Country_1994 == "Korea" 

save WorldBillionaires1994minusUS, replace 

*1993* 
use WorldBillionaires1993minusUS, clear

replace Name_1993 = "Wilhelm and August von Finck" if Name_1993 == "August and Wilhelm von Finck"
replace Name_1993 = "Baron Hans Heinrich Thyssen-Bornesmisza" if Name_1993 == "Baron Hans Heinrich Thyssen-Bornemisza"
replace Name_1993 = "Sophonpanichi" if Name_1993 == "Sophonpanich"
replace Name_1993 = "Kenkichi Nakajimi" if Name_1993 == "Kenkichi Nakajima"
replace Name_1993 = "Fentener van Vlissingen" if Name_1993 == "Fentener Van Vlissingen"
replace Name_1993 = "Friedrich Karl Jr. Flick" if Name_1993 == "Friedrich Karl Flick"
replace Name_1993 = "Perez Companc" if Name_1993 == "Perez Compane"
replace Name_1993 = "Emilio Azc_rraga Milmo" if Name_1993 == "Emilio Azcarraga Milmo"
replace Name_1993 = "Paul Sacher and Oeri and Hoffman" if Name_1993 == "Paul Sacher and Hoffmann"
replace Name_1993 = "Yosbiaki Tsutsumi" if Name_1993 == "Yoshiaki Tsutsumi"
replace Name_1993 = "Jaime Zobel de Ayala" if Name_1993 == "Zobel de Ayala"
replace Name_1993 = "Alberto Bailleres Gonzalez" if Name_1993 == "Alberto Bailleres"
replace Name_1993 = "Chang Yung Fa" if Name_1993 == "Chang Yung-fa"
replace Name_1993 = "Morita Akio" if Name_1993 == "Akio Morita"
replace Name_1993 = "von Siemens" if Name_1993 == "Siemens"
replace Name_1993 = "Saleh Kamel" if Name_1993 == "Saleh Abdullah Kamel"
replace Name_1993 = "Rafik al-Hariri" if Name_1993 == "Rajik Hariri"
replace Name_1993 = "Yue-che Wang" if Name_1993 == "Yue-Che (Y.C.) Wang"
replace Name_1993 = "James, Arthur &#38; John Irving" if Name_1993 == "James, Arthur and Jack Irving"

drop if Name_1993 == "Servitje Sendra" & Family_1993 == 0

replace Country_1993 = "South Korea" if Country_1993 == "Korea" 

save WorldBillionaires1993minusUS, replace 

*1992* 
use WorldBillionaires1992minusUS, clear

replace Name_1992 = "Wilhelm and August von Finck" if Name_1992 == "August and Wilhelm von Finck"
replace Name_1992 = "Baron Hans Heinrich Thyssen-Bornesmisza" if Name_1992 == "Baron Hans Heinrich Thyssen-Bornemisza"
replace Name_1992 = "Sophonpanichi" if Name_1992 == "Sophonpanich"
replace Name_1992 = "Kenkichi Nakajimi" if Name_1992 == "Kenkichi Nakajima"
replace Name_1992 = "Fentener van Vlissingen" if Name_1992 == "Fentener Van Vlissingen"
replace Name_1992 = "Edward (Ted) Rogers" if Name_1992 == "Edward S. (Ted) Rogers"
replace Name_1992 = "Emilio Azc_rraga Milmo" if Name_1992 == "Emilio Azcarraga Milmo"
replace Name_1992 = "Yohachiro Iwasaki" if Name_1992 == "Yohachiro Iawasaki"
replace Name_1992 = "Kunio Busujima" if Name_1992 == "Kunio Butsujima"
replace Name_1992 = "Yosbiaki Tsutsumi" if Name_1992 == "Yoshiaki Tsutsumi"
replace Name_1992 = "Kenneth Thomson" if Name_1992 == "Kenneth Roy Thomson"
replace Name_1992 = "von Siemens" if Name_1992 == "vons Siemens"
replace Name_1992 = "Yoshimoto" if Name_1992 == "Toshimoto"
replace Name_1992 = "Sebastiao Camargo" if Name_1992 == "Sabastiao Camargo"
replace Name_1992 = "Friedrich Karl Jr. Flick" if Name_1992 == "Friedrick Karl Flick Jr."
replace Name_1992 = "Karl-Heinz Kipp" if Name_1992 == "Karl Heinz Kipp"
replace Name_1992 = "Jaime Zobel de Ayala" if Name_1992 == "Zobel de Ayala"
replace Name_1992 = "Roberto Hernandez Ramirez" if Name_1992 == "Roberto Hernandez"
replace Name_1992 = "Brost and Funke" if Name_1992 == "Brost Funke"
replace Name_1992 = "Engelhorn" if Name_1992 == "Englhorn"
replace Name_1992 = "Bin-Mahfouz" if Name_1992 == "Bin Mahfouz"
replace Name_1992 = "Lee Shau Kee" if Name_1992 == "Lee Shau-kee"
replace Name_1992 = "Saleh Kamel" if Name_1992 == "Saleh Abdullah Kamel"
replace Name_1992 = "Rafik al-Hariri" if Name_1992 == "Rafik B. Hariri"
replace Name_1992 = "Maus and Nordmann" if Name_1992 == "Maus/Nordmann"
replace Name_1992 = "Kwek/Quek" if Name_1992 == "Quek/Kwek"
replace Name_1992 = "Erivan Haub" if Name_1992 == "Ervian Haub"
replace Name_1992 = "Yue-che Wang" if Name_1992 == "Yue-Che (Y.C.) Wang"
replace Name_1992 = "Mustafa Vehbi Koc" if Name_1992 == "Vehbi M. Koc"
replace Name_1992 = "Shin Kyuk-ho" if Name_1992 == "Shin Kyuk-ho (a.k.a. Takeo Shigemitsu)"

replace Country_1992 = "South Korea" if Country_1992 == "Korea" 

save WorldBillionaires1992minusUS, replace 

*1991*
use WorldBillionaires1991minusUS, clear

replace Name_1991 = "Lee" if Name_1991 == "Lee Shau-kee" & Country_1991 == "Singapore" 

replace Name_1991 = "Friedrich Karl Jr. Flick" if Name_1991 == "Friedrich Karl Flick Jr."
replace Name_1991 = "Wilhelm and August von Finck" if Name_1991 == "August and Wilhelm von Finck"
replace Name_1991 = "Sophonpanichi" if Name_1991 == "Sophonpanich"
replace Name_1991 = "Theo and Karl Albrecht" if Name_1991 == "Karl and Theo Albrecht"
replace Name_1991 = "Kenkichi Nakajimi" if Name_1991 == "Kenkichi Nakajima"
replace Name_1991 = "Fentener van Vlissingen" if Name_1991 == "Fentener Van Vlissingen"
replace Name_1991 = "von Siemens" if Name_1991 == "Von Siemens"
replace Name_1991 = "Albert von Thurn und Taxis" if Name_1991 == "Prince Albert von Thurn und Taxis"
replace Name_1991 = "Yosbiaki Tsutsumi" if Name_1991 == "Yoshiaki Tsutsumi"
replace Name_1991 = "Kenneth Thomson" if Name_1991 == "Kenneth Roy Thomson"
replace Name_1991 = "Baron Hans Heinrich Thyssen-Bornesmisza" if Name_1991 == "Hans Heinrich Thysen-Bornemisza"
replace Name_1991 = "Gianni Agnelli" if Name_1991 == "Giovanni Agnelli"
replace Name_1991 = "Tadahiro Yoshida" if Name_1991 == "Tadao Yoshida"
replace Name_1991 = "Yung-fa Chang" if Name_1991 == "Chang Yung-fa"
replace Name_1991 = "Karl-Heinz Kipp" if Name_1991 == "Karl Heinz Kipp"
replace Name_1991 = "Heinz Bauer" if Name_1991 == "Heinz Heinrich Bauer"
replace Name_1991 = "Lee Shau Kee" if Name_1991 == "Lee Shau-kee"
replace Name_1991 = "Maus and Nordmann" if Name_1991 == "Maus/Nordmann"
replace Name_1991 = "Shin Kyuk-ho" if Name_1991 == "Shin Kyuk-ho, a.k.a. Takeo Shigemitsu"
replace Name_1991 = "Chung Ju-yung" if Name_1991 == "Chung Yu-jung"
replace Name_1991 = "Vehbi Koc" if Name_1991 == "Vehbi M. Koc"
replace Name_1991 = "Suliman Olayan" if Name_1991 == "Suliman Saleh Olayan"
replace Name_1991 = "Saleh Kamel" if Name_1991 == "Saleh Abdullah Kamel"
replace Name_1991 = "Bin-Mahfouz" if Name_1991 == "Bin Mahfouz"
replace Name_1991 = "Rafik al-Hariri" if Name_1991 == "Rafik B. Hariri"
replace Name_1991 = "Nejat Ferit Eczacibasi" if Name_1991 == "Nejat F. Eczacibasi"

replace Country_1991 = "Malaysia/Singapore" if Name_1991 == "Kwek/Quek" 
replace Country_1991 = "South Korea" if Country_1991 == "Korea" 

save WorldBillionaires1991minusUS, replace 

*1990* 
use WorldBillionaires1990minusUS, clear

replace Name_1990 = "Samuel Lord Vestey and Edmund Vestey" if Name_1990 == "Samuel, Lord Vestey and Edmund Vestey"
replace Name_1990 = "Abdul Aziz Al-Sulaiman" if Name_1990 == "Abdul Aziz A. Al-Sulaiman"
replace Name_1990 = "Kenkichi Nakajimi" if Name_1990 == "Kenkichi Nakajima"
replace Name_1990 = "Fentener van Vlissingen" if Name_1990 == "Fentener Van Vlissingen"
replace Name_1990 = "Wilhelm and August von Finck" if Name_1990 == "Wilhelm and August Von Finck"
replace Name_1990 = "Friedrich Karl Jr. Flick" if Name_1990 == "Friedrich Karl Flick"
replace Name_1990 = "von Oppenheim" if Name_1990 == "Von Oppenheim"
replace Name_1990 = "von Siemens" if Name_1990 == "Von Siemens"
replace Name_1990 = "David Sainsbury" if Name_1990 == "David Sainbury"
replace Name_1990 = "Yosbiaki Tsutsumi" if Name_1990 == "Yoshiaki Tsutsumi"
replace Name_1990 = "Kenneth Thomson" if Name_1990 == "Kenneth Roy Thomson"
replace Name_1990 = "Baron Hans Heinrich Thyssen-Bornesmisza" if Name_1990 == "Hans Heinrich Thyssen-Bornemisza"
replace Name_1990 = "Sir Yue-kong Pao" if Name_1990 == "Sir Yue-Kong Pao"
replace Name_1990 = "Gianni Agnelli" if Name_1990 == "Giovanni Agnelli"
replace Name_1990 = "Tadahiro Yoshida" if Name_1990 == "Tadao Yoshida"
replace Name_1990 = "Karl-Heinz Kipp" if Name_1990 == "Karl Heinz Kipp"
replace Name_1990 = "Yung-fa Chang" if Name_1990 == "Chang Yung-fa"
replace Name_1990 = "Suliman Olayan" if Name_1990 == "Suliman Saleh Olayan"
replace Name_1990 = "Swarovski" if Name_1990 == "Swarovoski"
replace Name_1990 = "Morita Akio" if Name_1990 == "Akio Morita"
replace Name_1990 = "Bin-Mahfouz" if Name_1990 == "Bin Mahfouz"
replace Name_1990 = "Garza-Sada" if Name_1990 == "Garza Sada"
replace Name_1990 = "Rafik al-Hariri" if Name_1990 == "Rafik B. Hariri"
replace Name_1990 = "Maus and Nordmann" if Name_1990 == "Maus-Nordmann"
replace Name_1990 = "Mustafa Vehbi Koc" if Name_1990 == "Vehbi M. Koc"
replace Name_1990 = "Shin Kyuk-ho" if Name_1990 == "Shin Kyuk-ho a.k.a. Takeo Shigemitsu"

replace Country_1990 = "Malaysia/Singapore" if Name_1990 == "Kwek/Quek" 
replace Country_1990 = "South Korea" if Country_1990 == "Korea" 

save WorldBillionaires1990minusUS, replace 

*1989* 
use WorldBillionaires1989minusUS, clear

replace Name_1989 = "Seydoux/Schlumberger" if Name_1989 == "Schlumberger/Seydoux"
replace Name_1989 = "Kenkichi Nakajimi" if Name_1989 == "Kenkichi Nakajima"
replace Name_1989 = "Fentener van Vlissingen" if Name_1989 == "Fentener Van Vlissingen"
replace Name_1989 = "Friedrich Karl Jr. Flick" if Name_1989 == "Friedrich Karl Flick"
replace Name_1989 = "von Oppenheim" if Name_1989 == "Von Oppenheim"
replace Name_1989 = "Paul, Albert and Ralph Reichmann" if Name_1989 == "Albert, Paul and Ralph Reichmann"
replace Name_1989 = "Abdul Aziz Al-Sulaiman" if Name_1989 == "Abdul-Aziz A. Al-Sulaiman"
replace Name_1989 = "Samuel Lord Vestey and Edmund Vestey" if Name_1989 == "Lord Vestey and Edmund"
replace Name_1989 = "von Siemens" if Name_1989 == "Von Siemens"
replace Name_1989 = "Kenneth Thomson" if Name_1989 == "Kenneth Roy Thomson"
replace Name_1989 = "Baron Hans Heinrich Thyssen-Bornesmisza" if Name_1989 == "Hans Heinrich Thyssen-Bornemisza"
replace Name_1989 = "Tadahiro Yoshida" if Name_1989 == "Tadao Yoshida"
replace Name_1989 = "Hideki Yokoi" if Name_1989 == "Hieki Yokoi"
replace Name_1989 = "Suliman Olayan" if Name_1989 == "Suliman Saleh Olayan"
replace Name_1989 = "Swarovski" if Name_1989 == "Swaraovski"
replace Name_1989 = "Bin-Mahfouz" if Name_1989 == "Bin Mahfouz"
replace Name_1989 = "Garza-Sada" if Name_1989 == "Garza Sada"
replace Name_1989 = "Wilhelm and August von Finck" if Name_1989 == "Wilhelm Von Finck August Von Finck"
replace Name_1989 = "Mustafa Vehbi Koc" if Name_1989 == "Vehbi M. Koc"

save WorldBillionaires1989minusUS, replace 

*1988* 
use WorldBillionaires1988minusUS, clear

replace Name_1988 = "Sheikh Zayed Bin Sultan Al Nahyan" if Name_1988 == "Sheikh Zayed Bin Sultan Al Nahayan"
replace Name_1988 = "Prince Johannes Von Thurn Und Taxis" if Name_1988 == "Prince Johannes Thurn Und Taxis"
replace Name_1988 = "Friedrich Karl Jr. Flick" if Name_1988 == "Friedrich Karl Flick"
replace Name_1988 = "Theo and Karl Albrecht" if Name_1988 == "Karl Albrecht and Theo Albrecht"
replace Name_1988 = "Baron Hans Heinrich Thyssen-Bornesmisza" if Name_1988 == "Baron Heinrich Thyssen-Bornemisza"
replace Name_1988 = "Alfred Heineken" if Name_1988 == "Alfred Henry Heineken"
replace Name_1988 = "Yosbiaki Tsutsumi" if Name_1988 == "Yoshiaki Tsutsumi"
replace Name_1988 = "August von Finck" if Name_1988 == "August Von Finck"
replace Name_1988 = "Gianni Agnelli" if Name_1988 == "Giovanni Agnelli"
replace Name_1988 = "Abdul Aziz Al-Sulaiman" if Name_1988 == "Abdul-Aziz Al Suliman"
replace Name_1988 = "Erivan Haub" if Name_1988 == "Erivan Karl Haub"
replace Name_1988 = "Gerald Cavendish Grosvenor" if Name_1988 == "Gerald Grosvenor"
replace Name_1988 = "Li Ka-shing" if Name_1988 == "Li Ka-Shing"
replace Name_1988 = "Rudolf Oetker" if Name_1988 == "Rudolf August Oetker"
replace Name_1988 = "Edgar Miles Sr. Bronfman" if Name_1988 == "Edgar M. Bronfman"
replace Name_1988 = "Amir Jaber Al-Ahmed Al-Jaber Al-Sabah" if Name_1988 == "Sheikh Jaber Ahmed Al Sabah"
replace Name_1988 = "Y.K. Pao" if Name_1988 == "Sir Y. K. Pao"
replace Name_1988 = "Suliman Olayan" if Name_1988 == "Suliman Saleh Oyalan"
replace Name_1988 = "Anton Dressmann" if Name_1988 == "Anton Caspar Rudolph Dreesmann"
replace Name_1988 = "Sebastiao Camargo" if Name_1988 == "Sebastio Ferraz de Camargo Penteado"
replace Name_1988 = "Sulaiman Al Rajhi" if Name_1988 == "Suliman Abdul-Aziz Al Rajhi"

duplicates drop Name_1988 Country_1988, force //Dropping duplicate observation of Genshiro Kawamoto

save WorldBillionaires1988minusUS, replace 

*Changing unit of wealth for years 1988-1998* 
forval i = 1988/1998 {

	use WorldBillionaires`i'minusUS, clear
	replace Wealth_`i' = Wealth_`i' * 1000000000
	save WorldBillionaires`i'minusUS, replace 

}

*Deleting year suffix for each year* 
forval i = 1988/2015 { 

	use WorldBillionaires`i'minusUS, clear
	gen Year = `i' 
	rename *_`i' * 
	drop id 
	order Year Name Country Age 
	save WorldBillionaires`i'minusUS, replace 

} 

*Deleting Wealth_millions variable in years 1999-2015*
forval i = 1999/2015 { 

	use WorldBillionaires`i'minusUS, clear
	drop Wealth_millions
	save WorldBillionaires`i'minusUS, replace

}

*Appending datasets together* 
use WorldBillionaires2015minusUS, clear 

forval i = 2014(-1)1988 {

	append using WorldBillionaires`i'minusUS

}

order Year Name Country Wealth Age Family 
gsort Name -Year Name Country Wealth Age Family

*Creating id variable* 
egen id = group(Name) if Name != "Koo" & Name != "Lee" & Name != "Robert Miller" 

replace id = 2209 if Name == "Koo" & Country == "South Korea" 
replace id = 2210 if Name == "Koo" & Country == "Taiwan" 
replace id = 2211 if Name == "Lee" & Country == "Singapore" 
replace id = 2212 if Name == "Lee" & Country == "South Korea" 
replace id = 2213 if Name == "Robert Miller" & Country == "Canada" 
replace id = 2214 if Name == "Robert Miller" & (Country == "United Kingdom" | Country == "Hong Kong") 

*Creating dummy to indicate observation exists pre fill in* 
gen prefillin = 1 

*Saving harmonized dataset!* 
saveold "${SavePath}/statadata/harmonized_names/88-15_final", replace 

cd "${SavePath}/statadata/harmonized_names" 


use "${SavePath}/statadata/harmonized_names/88-15_final", clear
tset id Year, yearly 
bys id: keep if _n == 1
rename Name NewName
tempfile tempname
save `tempname'


use "${SavePath}/statadata/harmonized_names/88-15_final", clear
tset id Year, yearly
bys id Country: keep if _n == 1
keep id Country
drop if missing(Country)
bys id: gen t = _N
drop if t > 1
rename Country NewCountry
tempfile tempcountry
save `tempcountry'

use "${SavePath}/statadata/harmonized_names/88-15_final"
tset id Year, yearly
tsfill, full
merge m:1 id using `tempname', nogen
merge m:1 id using `tempcountry', nogen
replace Country = NewCountry if missing(Country) 
replace Name = NewName if missing(Name) 

drop NewName NewCountry t

rename *, lower

saveold "${SavePath}/statadata/harmonized_names/88-15_final", replace 
 
*Missing wealth values since 1991* 
browse if year >= 1991 & prefillin == 1 & wealth == .


