/********************************************************************************\
  Project: ECON 255 - Data Brief 1

  File Name: main.do

  Description: This program runs all files for data brief 1
			  
*******************************************************************************/


	/* clear anything in memory */
		clear all
		capture log close

	/* create a global macro for your working directory */
		global root "/Users/michellewang/Desktop/econ-255-fa23/data-brief-1"

	  
	/* create global macros for your data, code, and output folders */
		global data "$root/data"
		global code "$root/code"
		global output "$root/output"
		global logs "$root/logs"
		
	
/******************************************************************************/      
/*********************    run do-files for data brief  ************************/          
/******************************************************************************/	
		
	/* open a log file for all operations */
		log using "$logs/data-brief-1.log", replace
		
		/* clean up county opioid data for analysis */
			do "$code/1.prep-data-for-analysis.do"
		
		/* create figures for data brief */
			do "$code/2.create-visualizations.do"
		
		/* run main regression for data brief */
			do "$code/3.run-regressions.do"
		
	/* close the log file */
		log close
	
	
		
	  
