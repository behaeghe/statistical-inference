## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)
library(dplyr);library(knitr);library(pander)
require(broom);require(stargazer)
panderOptions('digits',2)
panderOptions('round',2)

## ----load dataset and some basic plotting, echo=FALSE,fig.align='center',fig.height=4, fig.width=6----
data("ToothGrowth")

library(ggplot2)
g <- ggplot(
                data=ToothGrowth,
                aes(x=interaction(supp,dose),y=len)
                )
g + geom_violin(
                aes(fill=supp),
                scale="area") + 
    stat_summary(fun.data ="mean_se",
                 colour="white") + 
    scale_fill_brewer(palette="Blues") + 
    theme_minimal() + 
    geom_boxplot(width=0.1) +
    ggtitle("Tooth length by dose and supplement") +
    xlab("Supplement and Dose") +
    ylab("Length")

## ----stats, echo=FALSE---------------------------------------------------
        tbTooth <- tbl_df(ToothGrowth)
        ToothSummaryAll <- tbTooth %>% 
                        group_by(dose,supp) %>% 
                        summarise( 
                                n(),
                                mn =mean(len),
                                s=round(sd(len),2),
                                sem=round(sd(len)/sqrt(n()),2)
                                )
        ToothSummaryDose <- tbTooth %>% 
                        group_by(dose) %>% 
                        summarise( 
                                n(),
                                mn =mean(len),
                                s=round(sd(len),2),
                                sem=round(sd(len)/sqrt(n()),2)
                                )
    

## ----table1--------------------------------------------------------------
            ToothSummarySupp <- tbTooth %>% 
                        group_by(supp) %>% 
                        summarise( 
                                n(),
                                mn =mean(len),
                                s=round(sd(len),2),
                                sem=round(sd(len)/sqrt(n()),2)
                                )
        names(ToothSummarySupp)[-1] <- c("n","Mean","Std.Dev","Sample Error")

## ----table3--------------------------------------------------------------
        names(ToothSummaryAll)[-(1:2)] <- c("n","Mean","Std.Dev","Sample Error")
        pander(ToothSummaryAll,caption="Summary Statistics for tooth length by dose and supplement",alignment=c("center"))

## ----confidence interval for dosewise comparison, message=FALSE, warning=FALSE, include=FALSE----

D0.5 <- subset(ToothGrowth,dose==0.5)
D1 <- subset(ToothGrowth,dose==1)
D2 <- subset(ToothGrowth,dose==2)
D105 <- subset(ToothGrowth,dose %in% c(1,0.5))
D12 <- subset(ToothGrowth,dose %in% c(2,1))
D205 <- subset(ToothGrowth,dose %in% c(2,0.5))

ttest <- NULL
ttest <- cbind(t.test(D1$len,D0.5$len,alternative="greater"),
               t.test(D2$len,D1$len,alternative="greater"),
               t.test(D2$len,D0.5$len,alternative ="greater")
               )
#formatting the data name

colnames(ttest) <- c("Test 1: 0.5 vs 1 mg","Test 2: 1 vs 2 mg", "Test 3: 0.5 vs 2 mg")
rbind(ttest,c(
        round(qt(0.95,ttest[,1]$parameter),2),
        round(qt(0.95,ttest[,2]$parameter),2),
        round(qt(0.95,ttest[,3]$parameter),2)
      ))


## ----t.test len ~ supp, echo=FALSE---------------------------------------
        testlenbysupp <- t.test(data=ToothGrowth,len ~ supp,alternative="greater")

## ----t.test len ~supp @ 0.5mg, echo=FALSE--------------------------------
        res0.5 <- t.test(data=D0.5,len ~ supp,alternative="greater")

## ----t.test len ~supp @ 1mg, echo=FALSE----------------------------------
        res1 <- t.test(data=D1,len ~ supp,alternative="greater")

## ----t.test len ~supp @ 2mg, echo=FALSE----------------------------------
        res2 <- t.test(data=D2,len ~ supp,alternative="greater")

## ----table 1-------------------------------------------------------------
pander(ToothSummarySupp,caption ="Summary statistics for tooth length by supplement",alignment="center") 

## ----table2--------------------------------------------------------------
        names(ToothSummaryDose)[-1] <- c("n","Mean","Std.Dev","Sample Error")
        pander(ToothSummaryDose,caption="Summary statistics for tooth length by dose",alignment="center")

