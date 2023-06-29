# Biomonitoring
This is a dataset of metals concentrations in tree's leaves in the city of Taranto (Southern Italy).
Briefly the northern part of the city hosts a huge industrial park called, inside the industrial park there is an important steel plant called ILVA that is notorious for polluting the air despite EU regulations. Other sources of pollutions in the city are traffic and a military ship building. 
Traffic, the steel plant and the shipyard all contribute to the release of heavy metals in the air. Tree leaves uptake metals from the air and therefore can be used to understand the contaminations levels of the city. 
In this study I have used different plant species at different locations based on the availability of trees. 

The questions that I'd like to answer are:
1. Is there a difference in metal uptake between plant species
2. Does the proximity to the steel plant affect the levels of metals concentration in the plants or is picture more complex? I.e. the proximity to other sources of pollution has an equal weight on the metals concentrations in the plants. 

Columns of the csv:
A) Name of sites 1 to 29 plus four background sites (B1 to B4) these are sites outside of Taranto, they can be used for comparison, but I am not including the MCclust analysis for now to keep things simple.
B) Tree species at each site
C) to I) The metals of interest the values are ug/g 
J) to N) distance in meters of each site to the source of pollution (e.g. main road, railway, ILVA steel plant etc)
O) and P) the average dimensions of the leaves collected in each site. 

R scripts:
1. Clusteranalysis.r contains the MClust analysis. One analysis was with metals only and the results show that the tree species is the main driver of clustering. I then did a second analysis with metals and distance to pollution sources. This one is a bit more complex to interpret so for this reason I also did a PCA. 
2. PCA.r I performed a PCA with the metals and distance to pollution sources. From the last plot I can see that pinus leaves have the highest concentrations of metals. One thing that I can also see is in the correll plot there is a negative correlation between most of the elements and prox to the bridge and military area, meaning that the closer we get to those places the higher the metals concentration is in the leaves.
