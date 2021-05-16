---
output:
  html_document: default
---



# (PART) APPENDIX {-}

# Tutorials {#tutorials}

A set of practical exercises on key concepts presented throughout this book is available either on the web or locally, instructions follow.

**Run tutorials on the web**

the exercises are published on the shinyapp.io server and can be freely accessed with the links below:

[Pareto charts](https://thoth.shinyapps.io/pareto/)  
This tutorial builds on the *The dial polishing workshop* case study from the Design for Six Sigma chapter, train building pareto charts using the `{qichart2}` package and explore how playing with different variables gives new insights into apparently simple data collections.

[Anova](https://thoth.shinyapps.io/anova/)  
This tutorial explores how the p value is calculated by playing with a dynamic anova chart. This exercise is based on the *The e-bike frame hardening process* of the DOE Interactions chapter.

**Run tutorials locally**

The tutorials can also be run locally which can be convinient as they load faster. This also allows for further exploration as the original tutorial code becomes available.

Install the `{industRial}` and `{learnr}` packages, with:

```{}
devtools::install_github("J-Ramalho/industRial")
install.packages("learnr)
```

load the packages:

```{}
library(industRial)
library(learnr)
```

and list the tutorials with:


```r
learnr::available_tutorials(package = "industRial")
```

```
Available tutorials:
* industRial
  - anova      : "industRial practice"
  - capability : "industRial practice"
  - pareto     : "industRial practice" 
```

choose a tutorial and run it as follows:

```{}
learnr::run_tutorial(package = "industRial", "anova")
```

The original files are available in the package tutorials folder. Their names correspond to the tutorial names listed before so there is a simple way to open the desired file, e.g.: 

```{}
rstudioapi::navigateToFile(
  paste0(.libPaths()[1], "/industRial/tutorials/anova/anova.Rmd")
  )
```




