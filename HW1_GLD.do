
*import data
import excel "/Users/gel2132/Desktop/assignment1-research-methods.xlsx", sheet("assignment1-res
> earch-methods") firstrow

* run regression model1: 
regress calledback EliteSchoolCandidate MaleCandidate

* install the "estout" package: 
ssc install estout

*store command
estimates store m1 

*run regression model2:
regress calledback EliteSchoolCandidate MaleCandidate 

*store command
estimates store model 2

*create table, includes 
esttab m1 model2, se r2 ar2

*export table for easy access in word
esttab m1 model2 using "regressiontabell.rtf", se r2 ar2 replace


