---
title: "The Effect of Vitamin C on Tooth Growth in Guinea Pigs"
author: "JRB"
date: "September 16, 2016"
output: html_document
geometry: margin=1in
fontsize: 8pt
---



##Introduction
We propose to analyze the length of odontoblasts for 60 guinea pigs that have received one of three dose levels of Vitamin C by of of two delivery methods (orange juice OJ) or ascorbic acid (VC). We will first perform some exploratory data analysis to generate some hypothesis that we will be statistically tested.  

##Exploratory Data Analysis 

We fill first plot the data set to represent the density of observations and some key statistics for each combination of delivery method at each dose level. The graph will compare side by side the tooth length for dose level for both OJ and VC. 


<img src="figure/load dataset and some basic plotting-1.png" title="plot of chunk load dataset and some basic plotting" alt="plot of chunk load dataset and some basic plotting" style="display: block; margin: auto;" />
The figure illustrates that increasing doses of vitamin C would correspond to 
longer teeth and that the mean of admistration could impact tooth growth also.
Table 1 provides a summary of the `ToothGrowth` data set.

  
  



From the summary table we can formulate the following hypothesis that could be submitted to a statistical testing.
The hypothesis are:  

#. Tooth length increases as dose increases
#. Mean of delivery has an impact on tooth growth 


-------------------------------------------------
 dose   supp   n   Mean   Std.Dev   Sample Error 
------ ------ --- ------ --------- --------------
 0.5     OJ   10  13.23    4.46         1.41     

 0.5     VC   10   7.98    2.75         0.87     

 1.0     OJ   10  22.70    3.91         1.24     

 1.0     VC   10  16.77    2.52         0.80     

 2.0     OJ   10  26.06    2.66         0.84     

 2.0     VC   10  26.14    4.80         1.52     
-------------------------------------------------

Table: Summary Statistics for tooth length by dose and supplement

##Inference  

We have generated three hypothesis that we would like to test againts the null hypothesis. 

###Hypothesis 1:  "Tooth length increases as dose increases"  
To test this hypothesis, we will compare tooth length means at different dose levels (regardless of mean of administration). We will test the null hypothesis that the samples are drawn from populations of the same mean.

####*Example: Test 1: 0.5 mg vs 1 mg* 
This section explains our general methodology for hypothesis testing. All results will be summarized in table 2.
$\mu_1$ is the mean of tooth length for the 1 mg group  
$\mu_2$ is the mean of tooth length for the 0.5 mg group
$H_0: \mu_1=\mu_2$  
$H_3: \mu_1>\mu_2$  















