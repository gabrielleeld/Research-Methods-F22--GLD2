*import data
import excel "/Users/gel2132/Documents/GitHub/ResearchMethods-Repository/HW2/vaping-ban-panel.xlsx", sheet("v
> aping-ban-panel") firstrow clear

*make treatment var
*variables have weird names, sorry
generate nearinc=0
 
replace nearinc= 1 if StateId<=23

*make time pre post treatment var
generate Y81=0

replace Y81= 1 if Year>=2021
(500 real changes made)

*make interaction var. Will be called "Int"
g Int= Y81* nearinc

*regression for did
didregress (LungHospitalizations) (Int), group(StateId) time(Year) aggregate(standard)

*define panel data
xtset StateId Year

*regression for parallel trends
xtreg LungHospitalizations i.nearinc##c.Y81 if Year < 2021

estimates store m1 

esttab m1 using "regressiontabell3.rtf", se

*regression paralell trends estimator 
xtdidregress (LungHospitalizations) (Int), group(StateId) time(Year) aggregate(standard)

estimates store m2 

esttab m2 using "regressiontabell4.rtf", se

*table parallel trends
estat trendplots
