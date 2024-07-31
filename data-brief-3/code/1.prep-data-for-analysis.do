/********************************************************************************\
  Project: ECON 255 - Data Brief 3

  File Name: prep-data-for-analysis.do

  Description: This program prepares the data for analysis


*******************************************************************************/


	/* import raw csv of household pulse data */
		import delimited "$data/raw/household-pulse/pulse2023_puf_62.csv", clear
		
		

/******************************************************************************/      
/************************    clean the data  **********************************/          
/******************************************************************************/



	replace tspndfood = . if tspndfood < 0
	
	replace income = . if income < 0
	
	replace thhld_numper = . if thhld_numper < 0
	
	replace anywork = . if anywork < 0
	
	replace tenure = . if tenure < 0	
			
			
	/* save the cleaned data */ 
		save "$data/data-for-analysis.dta", replace
			
			
			
			
			