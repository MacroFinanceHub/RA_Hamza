*###########################################################*
*							                                *
*THIS DO FILE GENERATES YEAR-PAIRWISE DATASETS USING MATCHIT*				
*							  							    *
*###########################################################*

global SavePath "~/Dropbox/RA_Hamza/save" 
global DataPath "~/Dropbox/RA_Hamza/data"

cd ${SavePath}/statadata/yearlyminusUS

*Using matchit to generate matched datasets* 

local yearsmaster 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015
local yearsusing 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015

foreach i of local yearsmaster {

	foreach j of local yearsusing {
		
		if `i' < `j' {
		
		use WorldBillionaires`i'minusUS, clear 
		
		matchit id_`i' Name_`i' using "WorldBillionaires`j'minusUS.dta", idusing(id_`j') txtusing(Name_`j')
		
		gsort -similscore
		
		joinby id_`i' using WorldBillionaires`i'minusUS 
		joinby id_`j' using WorldBillionaires`j'minusUS
		
		save "${SavePath}/statadata/matchit_pairwise/matchit_`i'_`j'", replace

		}	
	}
 }
 
