/********************************************************************************\
  Project: ECON 255 - Data Brief 2
  
  File Name: 2.create-visualizations.do

  Description: This program creates DB2 visualizations

*******************************************************************************/

	/* import data cleaned by previous do file */ 
		use "$data/data-for-analysis.dta", clear
		

		
/******************************************************************************/      
/***************************    create figures   ******************************/          
/******************************************************************************/	
	

		
	/* create bar graph for income */
	gen incomecap = ""
	replace incomecap = "1. Less than $25,000" if income == 1
	replace incomecap = "2. $25,000 - $34,999" if income == 2
	replace incomecap = "3. $35,000 - $49,999" if income == 3
	replace incomecap = "4. $50,000 - $74,999" if income == 4
	replace incomecap = "5. $75,000 - $99,999" if income == 5
	replace incomecap = "6. $100,000 - $149,999" if income == 6
	replace incomecap = "7. $150,000 - $199,999" if income == 7
	replace incomecap = "8. $200,000 and above" if income == 8
	
	graph bar (mean) tspndfood if income > 0, over(incomecap, lab(angle(30) labsize(2))) ///
		ytitle("Mean Food Spending (Dollars)", size(3)) ///
		blabel(bar)
	graph export "$output/figures/bargraph1.png", replace
	
	
	/* create scatterplot for number of people in household */
	preserve
		collapse (mean) tspndfood, by(thhld_numper)
        graph twoway ///
			(scatter tspndfood thhld_numper) ///
			(lfit tspndfood thhld_numper), ///
			ytitle("Mean Food Spending (Dollars)", size(3)) ///
			xtitle("Total Number of People in Household", size(3)) ///
		/* export the scatterplot to output folder */
		graph export "$output/figures/scatterplot1.png", replace	
	restore
	
	/* create scatterplot for employment status */
	gen empstat = "Employed"
	replace empstat = "Not Employed" if anywork == 2
	
	graph bar (mean) tspndfood if anywork > 0, over(empstat) ///
		ytitle("Mean Food Spending (Dollars)", size(3)) ///
		blabel(bar)
	graph export "$output/figures/bargraph2.png", replace
	
	/* create bar graph for housing tenure */
	gen tenurecap = "1. Owned free and clear"
	replace tenurecap = "2. Owned w/ mortgage or loan" if tenure == 2
	replace tenurecap = "3. Rented" if tenure == 3
	replace tenurecap = "4. Occupied w/o rent" if tenure == 4
	
	graph bar tspndfood if tenure > 0, over(tenurecap, lab(angle(30) labsize(2))) ///
		ytitle("Mean Food Spending (Dollars)", size(3)) ///
		blabel(bar)	
	graph export "$output/figures/bargraph3.png", replace
	