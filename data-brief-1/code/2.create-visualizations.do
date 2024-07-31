/********************************************************************************\
  Project: ECON 255 - Data Brief 1
  
  File Name: 2.create-visualizations.do

  Description: This program creates DB1 visualizations

*******************************************************************************/

	/* import data cleaned by previous do file */ 
		use "$data/data-for-analysis.dta", clear
		
		
/******************************************************************************/      
/***************************    create figure 1  ******************************/          
/******************************************************************************/	
	

	/* create histogram */
        hist MD_PC, ///
            bin(18) frequency ///
            title("Histogram of Number of Medical Doctors") ///
            xtitle("Number of Medical Doctors per 100,000 Residents") ///
            ytitle("Frequency") ///

    /* export the histogram to output folder */
        graph export "$output/f1.png", replace
	
	
/******************************************************************************/      
/***************************    create figure 2  ******************************/          
/******************************************************************************/


	/* create histogram, removing outliers greater than 100000000 */
        hist DOSAGE_UNIT if DOSAGE_UNIT < 100000000, ///
            bin(30) frequency ///
            title("Histogram of Opioid Prescribing") ///
            xtitle("Total number of opioid pills distributed") ///
            ytitle("Frequency") ///

    /* export the histogram to output folder */
        graph export "$output/f2.png", replace
		
/******************************************************************************/      
/***************************    create figure 3  ******************************/          
/******************************************************************************/

	/* freeze the data */
        preserve

		/* create numeric YR variable */
			destring YR, replace
		
        /* collapse to annual average */
            collapse (mean) DOSAGE_UNIT, by(YR)

        /* set the time series by year */
            tsset YR

        /* create a line plot of opioid dosage */
            tsline DOSAGE_UNIT, ///
            title("Time Series Plot of Opioid Prescribing") ///
            xtitle("Year") ///
            ytitle("Total number of opioid pills distributed")
			
		/* export the plot to output folder */
        graph export "$output/f3.png", replace

    /* unfreeze the data */
        restore






