/********************************************************************************\
  Project: ECON 255 - Data Brief 2

  File Name: prep-data-for-analysis.do

  Description: This program prepares the household pulse data for analysis

			  
  Data source: https://www.census.gov/programs-surveys/household-pulse-survey/datasets.html
*******************************************************************************/


	/* import raw csv of household pulse data */
		import delimited "$data/raw/household-pulse/pulse2023_puf_62.csv", clear
		
		

/******************************************************************************/      
/************************    clean the data  **********************************/          
/******************************************************************************/

	
	replace tspndfood = . if tspndfood < 0
	
	replace income = . if income < 0
	
	replace thhld_numper = . if thhld_numper < 0
	
	replace tspndprpd = . if tspndprpd < 0
	
	replace expns_dif = . if expns_dif < 0	
			
			
			
	/* save the cleaned data */ 
		save "$data/data-for-analysis.dta", replace
			
			
			
			
			