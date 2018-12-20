*#############################################################################*
*							                                  				  *
*THIS DO FILE CHECKS IMPORTS & CLEANS POPULATION & WEALTH DATA FROM WORLD BANK*				
*							  							      			      *
*#############################################################################*
global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

*Importing population data* 

import delimited "${DataPath}/worldbankdata/API_SP.POP.TOTL_DS2_en_csv_v2_10224786.csv", varnames(5) clear

import delimited "${DataPath}/worldbankdata/API_SP.POP.TOTL_DS2_en_csv_v2_10224786.csv", varnames(5) clear
