*###################################################################*
*							                                        *
*THIS DO FILE CHANGES THE NAME ORDER FOR DATASETS OF YEARS 1989-1998*				
*							  							            *
*###################################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

cd ${SavePath}/statadata/yearlyminusUS

*1998* 
use WorldBillionaires1998minusUS, clear 

split Name_1998, parse(,) 

gen Name2 = Name_19982 + " " +  Name_19981 if Name_19983 == "" 
replace Name2 = "James, Arthur and John Irving" if Name_1998 == "Irving, James, Arthur and John" 
replace Name2 = "Walter, Thomas and Raymond Kwok" if Name_1998 == "Kwok, Walter, Thomas and Raymond" 

drop Name_1998 Name_19981 Name_19982 Name_19983 
rename Name2 Name_1998 
order Name_1998
replace Name_1998 = strtrim(Name_1998) 

replace Family_1998 = strpos(lower(Name_1998), "family") > 0
replace Name_1998 = subinstr(Name_`i', " & family", "", .) //removing the "& family" part of a lot of names

save WorldBillionaires1998minusUS, replace 

*1997* 
use WorldBillionaires1997minusUS, clear 

drop if Name_1997 == "" 

split Name_1997, parse(,) 

gen Name2 = Name_19972 + " " +  Name_19971 if Name_19973 == "" 
replace Name2 = "James, Arthur and John Irving" if Name_1997 == "Irving, James, Arthur and John" 
replace Name2 = "Walter, Thomas and Raymond Kwok" if Name_1997 == "Kwok, Walter, Thomas and Raymond" 

drop Name_1997 Name_19971 Name_19972 Name_19973 
rename Name2 Name_1997 
order Name_1997
replace Name_1997 = strtrim(Name_1997)

save WorldBillionaires1997minusUS, replace 

*1996* 
use WorldBillionaires1996minusUS, clear 

split Name_1996, parse(,) 

replace Name_19961 = strtrim(Name_19961) 
replace Name_19962 = strtrim(Name_19962) 
replace Name_19963 = strtrim(Name_19963) 

gen Name2 = Name_19962 + " " +  Name_19961 if Name_19962 != "Family" & Name_19963 == "" & Name_19962 != "Brothers"

replace Name2 = "Paul Sacher and Oeri and Hoffman Family" if Name_1996 == "Paul Sacher,Oeri and Hoffman, Family"
replace Name2 = "Johanna, Susanne and Stefan Quandt" if Name_1996 == "Quandt, Johanna, Susanne and Stefan" 

replace Name2 = Name_19961 + " " + Name_19962 if Name_19962 == "Family" | Name_19962 == "Brothers"

drop Name_1996 Name_19961 Name_19962 Name_19963 
rename Name2 Name_1996 
order Name_1996
replace Name_1996 = strtrim(Name_1996) 

save WorldBillionaires1996minusUS, replace 

*1995* 
use WorldBillionaires1995minusUS, clear 

drop if Name_1995 == "" 

save WorldBillionaires1995minusUS, replace 

*1994* 
use WorldBillionaires1994minusUS, clear 

drop if Name_1994 == "" 

save WorldBillionaires1994minusUS, replace 

*1992* 
use WorldBillionaires1992minusUS, clear 

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

save WorldBillionaires1992minusUS, replace 


*Creating family variable 
local years 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 
 
foreach i in `years' {

	use WorldBillionaires`i'minusUS, clear

	replace Family_`i' = strpos(lower(Name_`i'), "family") > 0 if Family_`i' != 1 
	
	replace Name_`i' = subinstr(Name_`i', " and family", "", .) //removing the "and family" part of a lot of names 
	replace Name_`i' = subinstr(Name_`i', " and Family", "", .) //removing the "and family" part of a lot of names 
	replace Name_`i' = subinstr(Name_`i', " family", "", .) //removing the "& family" part of a lot of names 
	replace Name_`i' = subinstr(Name_`i', " Family", "", .) //removing the " Family" part of a lot of names 

	save WorldBillionaires`i'minusUS, replace
	
 } 
