/********************************************************************************\
  Project: ECON 255 - Data Brief 1

  File Name: prep-data-for-analysis.do

  Description: This program prepares the county opioid data for analysis

			  
  Data source: https://data.mendeley.com/datasets/dwfgxrh7tn/8
*******************************************************************************/


	/* import the 2015 massachusetts county-by-race seer panel */ 
		use "$data/county-opioid-panel", clear

	/* pick geographic subset */
		keep if F12424 == "CA"
			
	/* save the new data */ 
		save "$data/data-for-analysis.dta", replace
			
			
			
			
			