/********************************************************************************\
  Project: ECON 255 - Data Brief 3
  
  File Name: 3.run-regressions.do

  Description: This program performs regressions on the data

*******************************************************************************/


	/* import data for analysis */
		use "$data/data-for-analysis.dta", replace
	
	

/******************************************************************************/      
/**********************    run  regressions  **********************************/          
/******************************************************************************/




/******************************************************************************/      
/*****************    display results in table   ******************************/          
/******************************************************************************/


	esttab r* using "$output/tables/table-1.rtf", ///
			se label replace /// SEs in parantheses, variable labels, replace output
			stats(N r2) /// put n obs and R2 in table
			starlevels(* 0.05 ** 0.01 *** 0.001) 
		
		