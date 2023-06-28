# biomonitoring
This is a dataset of metals concentrations in tree's leaves in the city of Taranto (Southern Italy).
Brifely the northern part of the city hosts a hige industrial park called, inside the industrial park there is a important steel plant called ILVA that is notorious for polluting the air inspite of EU regulations. Other sources of pollutions in the city are traffic and a military ship building. 
Traffic, the steel plant and the shipyard all contribute to the release of heavy metals in the air. Tree leaves uptake metals from the air and therefore can be used to understand the contaminations levels of the city. 
In this study I have used different plant species at different locations based on the availability of trees. 
The questions that I'd like. toanswer are:
1. Is there a difference in metal uptake between plant species
2. Does the proximity to the steel plant affect the levels of metals concentration in the plants or is picture more complex? I.e. the proximity to other sources of pollution has an equal weight on the metals concentrations in the plants. 

Columns of the csv:

A) Name of sites 1 to 29 plus four background sites (B1 to B4) these are sites outside of Taranto, they can be used for comparison but I am not including the MCclust analysis at the moment to keep things simple.
B) Tree species at each site
C) to I) The metals of interest the values are ug/g 
J) to N) distance in meters of each site to the cource of pollution (e.g. main road, railway, ILVA steel plant etc)
O) and P) the average dimensions of the leaves collected ineach site. 

R scripts:
1. Clusteranalysis.r contains the MClust analysis that I have done using only the metals. The results at the moment show that the tree species is the main driver ofclustering
2. PCA.r I performed a PCA to see the....
