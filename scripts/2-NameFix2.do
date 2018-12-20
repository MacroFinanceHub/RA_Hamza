*##################################################################################*
*							                                        			   *
*THIS DO FILE CHANGES THE NAME ORDER FOR DATASETS OF YEARS 1996-2002, 1992, 1994-95*				
*							  							            			   *
*##################################################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

cd ${SavePath}/statadata/yearlyminusUS2

*2002* 
use "2002minusUS.dta", clear 

split name_2002, parse(,) 

gen name2 = name_20022 + " " +  name_20021 if name_20023 == "" 

replace name2 = "Walter, Thomas & Raymond Kwok" if name_2002 == "Kwok, Walter, Thomas & Raymond" 
replace name2 = "James, Arthur & John Irving" if name_2002 == "Irving, James, Arthur & John" 

drop name_2002 name_20021 name_20022 name_20023 
rename name2 name_2002 
order name_2002
replace name_2002 = strtrim(name_2002) 

save "2002minusUS.dta", replace 

*2001* 
use "2001minusUS.dta", clear 

split name_2001, parse(,) 

gen name2 = name_20012 + " " +  name_20011 if name_20013 == ""

replace name2 = "Walter, Thomas & Raymond Kwok" if name_2001 == "Kwok, Walter, Thomas, Raymond"  
replace name2 = "James, Arthur & John Irving" if name_2001 == "Irving, James, Arthur & John" 

drop name_2001 name_20011 name_20012 name_20013 name_20014
rename name2 name_2001 
order name_2001
replace name_2001 = strtrim(name_2001) 

save "2001minusUS.dta", replace 

*2000* 
use "2000minusUS.dta", clear 

split name_2000, parse(,) 

gen name2 = name_20002 + " " +  name_20001 if name_20003 == ""

replace name2 = "Walter, Thomas & Raymond Kwok" if name_2000 == "Kwok, Walter, Thomas, Raymond"  
replace name2 = "James, Arthur & John Irving" if name_2000 == "Irving, James, Arthur and John" 

drop name_2000 name_20001 name_20002 name_20003 name_20004
rename name2 name_2000 
order name_2000
replace name_2000 = strtrim(name_2000) 

save "2000minusUS.dta", replace 

*1999* 
use "1999minusUS.dta", clear 

split name_1999, parse(,) 

gen name2 = name_19992 + " " +  name_19991 if name_19993 == ""

replace name2 = "Walter, Thomas & Raymond Kwok" if name_1999 == "Kwok, Walter, Thomas, Raymond"  
replace name2 = "James, Arthur & John Irving" if name_1999 == "Irving, James, Arthur and John" 
replace name2 = "Robert Bosch Jr." if name_1999 == "Bosch, Robert, Jr."
replace name2 = "Srichand & Gopichand Hinduja" if name_1999 == "Hinduja, Srichand, Gopichand"
replace name2 = "Oeri, Hoffman & Sacher" if name_1999 == "Oeri, Hoffmann and Sacher"

drop name_1999 name_19991 name_19992 name_19993 name_19994
rename name2 name_1999 
order name_1999
replace name_1999 = strtrim(name_1999) 

save "1999minusUS.dta", replace

*1998* 
use "1998minusUS.dta", clear 

split name_1998, parse(,) 

gen name2 = name_19982 + " " +  name_19981 if name_19983 == ""

replace name2 = "Walter, Thomas & Raymond Kwok" if name_1998 == "Kwok, Walter, Thomas, and Raymond"  
replace name2 = "James, Arthur & John Irving" if name_1998 == "Irving, James, Arthur and John" 
replace name2 = "Dietmar Hopp & sons" if name_1998 == "Hopp, Dietmar and sons" 

drop name_1998 name_19981 name_19982 name_19983 name_19984
rename name2 name_1998 
order name_1998
replace name_1998 = strtrim(name_1998) 

save "1998minusUS.dta", replace

*1997* 
use "1997minusUS.dta", clear 

split name_1997, parse(,) 

gen name2 = name_19972 + " " +  name_19971 if name_19973 == ""

replace name2 = "Walter, Thomas & Raymond Kwok" if name_1997 == "Kwok, Walter, Thomas, Raymond"  
replace name2 = "James, Arthur & John Irving" if name_1997 == "Irving, James, Arthur and John" 

drop name_1997 name_19971 name_19972 name_19973 name_19974
rename name2 name_1997 
order name_1997
replace name_1997 = strtrim(name_1997) 

save "1997minusUS.dta", replace

*1996* 
use "1996minusUS.dta", clear 

split name_1996, parse(,) 

gen name2 = name_19962 + " " +  name_19961 if name_19963 == ""

replace name2 = "Johanna, Susanne & Stefan Quandt" if name_1996 == "Quandt, Johanna, Susanne and Stefan"  

drop name_1996 name_19961 name_19962 name_19963 
rename name2 name_1996 
order name_1996
replace name_1996 = strtrim(name_1996) 

duplicates drop name_1996 country_1996, force

save "1996minusUS.dta", replace

*1995* 
use "1995minusUS.dta", clear 

drop if Name_1995 == "" 

save "1995minusUS.dta", replace 

*1994* 
use "1994minusUS.dta", clear 

drop if Name_1994 == "" 

save "1994minusUS.dta", replace 

*1992* 
use "1992minusUS.dta", clear 

split Name_1992, parse(,)

replace Name_19921 = strtrim(Name_19921) 
replace Name_19922 = strtrim(Name_19922)

gen Name2 = Name_19922 + " " +  Name_19921 

replace Name2 = "K.C. Irving and sons James, Arthur and Jack" if Name_1992 == "K.C. Irving and sons James, Arthur and Jack" 
replace Name2 = "Johanna, Susanne and Stefan Quandt" if Name_1992 == "Johanna, Susanne and Stefan Quandt" 

drop Name_1992 Name_19921 Name_19922  
rename Name2 Name_1992 
order Name_1992
replace Name_1992 = strtrim(Name_1992) 

drop if Name_1992 == "" 

save "1992minusUS.dta", replace

