## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4
)
library(hagis)

## ----load_data-----------------------------------------------------------
Pathotype.Data <- system.file("extdata", "practice_data_set.csv", package = "hagis")
Pathotype.Data <- read.csv(Pathotype.Data, stringsAsFactors = FALSE)
head(Pathotype.Data)

## ----remove-gene---------------------------------------------------------
Pathotype.Data$Rps <- gsub(pattern = "Rps ", replacement = "", x = Pathotype.Data$Rps)
head(Pathotype.Data)

## ----example-function, eval=FALSE----------------------------------------
#  Rps.summary <- summarize_gene(x = Pathotype.Data,
#                               cutoff = 60,
#                               control = "susceptible",
#                               sample = "Isolate",
#                               gene = "Rps",
#                               perc_susc = "perc.susc")

## ----shared-args---------------------------------------------------------
hagis_args <- list(x = Pathotype.Data,
                   cutoff = 60,
                   control = "susceptible",
                   sample = "Isolate",
                   gene = "Rps",
                   perc_susc = "perc.susc")

## ---- echo=TRUE----------------------------------------------------------
Rps.summary <- do.call(summarize_gene, hagis_args)

Rps.summary

## ----pander-print-Rps, echo=TRUE-----------------------------------------
library(pander)

pander(Rps.summary)

## ----plot-summary, echo=TRUE---------------------------------------------
plot(Rps.summary, type = "percentage")

plot(Rps.summary, type = "count")

## ----complexities, echo=TRUE, message=FALSE, warning=FALSE---------------
complexities <- do.call(calculate_complexities, hagis_args)

complexities

## ----pander-print-complexities-------------------------------------------
pander(complexities$grouped_complexities)

pander(complexities$indvidual_complexities)

## ----summary-complexities------------------------------------------------
pander(summary(complexities))

## ----complexities-plot---------------------------------------------------
plot(complexities, type = "percentage")

plot(complexities, type = "count")

## ----calculate-diversities, echo=TRUE------------------------------------
diversity <- do.call(calculate_diversities, hagis_args)
diversity

## ----diversity-pander----------------------------------------------------
pander(diversity)

## ----diversities-table---------------------------------------------------
diversities_table(diversity)

## ----individual-pathotypes-----------------------------------------------
individual_pathotypes(diversity)

## ----set-up-adv.plot-----------------------------------------------------
library(ggplot2)

Rps.plot <- plot(Rps.summary, type = "percentage")

Rps.plot

## ----change-plot-theme---------------------------------------------------
Rps.plot <- Rps.plot +
  theme_minimal()

Rps.plot

## ----change-plot-font----------------------------------------------------
Rps.plot <- Rps.plot +
  theme(
    text = element_text(
      face = "bold",
      family = "serif"
    ))

Rps.plot

## ----horizontal-plot-----------------------------------------------------
Rps.plot <- Rps.plot +
  coord_flip()

Rps.plot

## ----use-Colors----------------------------------------------------------
plot(Rps.summary, type = "percentage", color = "#18453b") +
  theme_bw() +
  theme(
    text = element_text(
      face = "bold",
      family = "serif"
    ))

