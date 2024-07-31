/********************************************************************************\
  Project: ECON 255 - Data Brief 1
  
  File Name: 3.run-regressions.do

  Description: This program performs regressions on the data

*******************************************************************************/


	/* import data for analysis */
		use "$data/data-for-analysis.dta", replace
	

/******************************************************************************/      
/*****************    run bivariate regressions  ******************************/          
/******************************************************************************/


	/* column (1) */
		// run regression of number of medical doctors per 100,000 residents on 
		// veteran population estimate
		reg MD_PC F11396, robust
		est sto col1
	/*
	Linear regression                               Number of obs     =        519
													F(1, 517)         =      64.83
													Prob > F          =     0.0000
													R-squared         =     0.0516
													Root MSE          =     149.64

	------------------------------------------------------------------------------
				 |               Robust
		   MD_PC | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
	-------------+----------------------------------------------------------------
		  F11396 |   .0005839   .0000725     8.05   0.000     .0004415    .0007264
		   _cons |   217.0944   7.523627    28.86   0.000     202.3137     231.875
	------------------------------------------------------------------------------
	*/
	
	/* column (2) */
		// run regression of opioid pill distribution on number of medical 
		// doctors per 100,000 residents
		reg DOSAGE_UNIT MD_PC, robust
		est sto col2
	/*
	Linear regression                               Number of obs     =        519
													F(1, 517)         =      31.37
													Prob > F          =     0.0000
													R-squared         =     0.0491
													Root MSE          =     2.9e+07

	------------------------------------------------------------------------------
				 |               Robust
	 DOSAGE_UNIT | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
	-------------+----------------------------------------------------------------
		   MD_PC |   43226.78   7717.757     5.60   0.000     28064.76     58388.8
		   _cons |    8467451    1518612     5.58   0.000      5484041    1.15e+07
	------------------------------------------------------------------------------
	*/
		
	/* column (3) */
		// run regression of opioid pill distribution on veteran population estimate
		reg DOSAGE_UNIT F11396, robust
		est sto col3
	/*	
	Linear regression                               Number of obs     =        519
													F(1, 517)         =     439.96
													Prob > F          =     0.0000
													R-squared         =     0.9077
													Root MSE          =     9.1e+06

	------------------------------------------------------------------------------
				 |               Robust
	 DOSAGE_UNIT | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
	-------------+----------------------------------------------------------------
		  F11396 |    478.105   22.79388    20.98   0.000      433.325     522.885
		   _cons |    2322137   504568.7     4.60   0.000      1330880     3313394
	------------------------------------------------------------------------------
	*/

/******************************************************************************/      
/*****************    display results in table   ******************************/          
/******************************************************************************/


	esttab col*

	esttab col* using "$output/regression-table.xls", ///
		cells(b(star fmt(3)) se(fmt(3)) n(fmt(0))) ///
		label replace ///
		title("Regression Results") ///
		collabels("Column 1" "Column 2" "Column 3") ///
		stats(N se r2) ///
		starlevels(* 0.05 ** 0.01 *** 0.001) ///
		addnote("Table note here.") ///
		booktabs ///
		mtitles("Model 1") 
		
		
		