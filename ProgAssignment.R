## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)
library(dplyr);library(knitr);library(pander)
panderOptions('digits',2)
panderOptions('round',2)

#

## ----load dataset and some basic plotting, echo=FALSE,fig.align='center'----
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
        ToothSummarySupp <- tbTooth %>% 
                        group_by(supp) %>% 
                        summarise( 
                                n(),
                                mn =mean(len),
                                s=round(sd(len),2),
                                sem=round(sd(len)/sqrt(n()),2)
                                )

## ----table1--------------------------------------------------------------
        names(ToothSummarySupp)[-1] <- c("n","Mean","Std.Dev","Sample Error")
        pander(ToothSummarySupp,caption="Summary statistics for tooth length by supplement",alignment="center") 

## ----table2--------------------------------------------------------------
        names(ToothSummaryDose)[-1] <- c("n","Mean","Std.Dev","Sample Error")
        pander(ToothSummaryDose,caption="Summary statistics for tooth length by dose",alignment="center",justify="right")

## ----table3--------------------------------------------------------------
        names(ToothSummaryAll)[-(1:2)] <- c("n","Mean","Std.Dev","Sample Error")
        pander(ToothSummaryAll,caption="Summary Statistics for tooth length by dose and supplement",alignment=c("center"))

