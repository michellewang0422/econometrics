/********************************************************************************\
  Project: ECON 255 - Data Brief 2
  
  File Name: 3.run-regressions.do

  Description: This program performs regressions on the data

*******************************************************************************/


	/* import data for analysis */
		use "$data/data-for-analysis.dta", replace
	
		
	/* generate employed variable */
		gen emp_binary = (anywork == 1)

/******************************************************************************/      
/**********************    run  regressions  **********************************/          
/******************************************************************************/

regress tspndfood i.income, robust
est sto col1

regress tspndfood i.income thhld_numper, robust
est sto col2

regress tspndfood i.income thhld_numper emp_binary, robust
est sto col3

regress tspndfood i.income thhld_numper emp_binary if tenure > 0, robust
est sto col4

/******************************************************************************/      
/*****************    display results in table   ******************************/          
/******************************************************************************/

esttab col* using "$output/tables/regression-table.rtf", ///
		///cells(b(star fmt(4)) se(fmt(4)) n(fmt(0))) ///
		label replace ///
		title("Regression Results") ///
		collabels("Income" "People in Household" "Employment Status" "Tenure") ///
		stats(N se r2) ///
		starlevels(* 0.05 ** 0.01 *** 0.001) ///
		addnote("Calculations from the Pulse Survey. Linear Regressions of household spending on food on income, total number of people in the household, employment status in the last 7 days, and housing tenure. * Significant at 5% ** Significant at 1% *** Significant at 0.1%") ///
		mtitles("Model 1") 
		
		