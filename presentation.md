Shiny App Example
========================================================
author: Augusto Ielo
date: 2016/10/03
transition:rotate

App
============================

Shiny Application
* URL: [https://augustoielo.shinyapps.io/ExampleApp/](https://augustoielo.shinyapps.io/ExampleApp/)
* A shiny-App showing a really simple regression model between temperature in degrees Celsius and vapor pressure of mercury in millimeters (of mercury).



Pressure dataset - Description
========================================================

A data frame with 19 observations on 2 variables that gives the Vapor Pressure of Mercury as a Function of Temperature.

* temperature	numeric	temperature (deg C)
* pressure	numeric	pressure (mm)

Source: Weast, R. C., ed. (1973) Handbook of Chemistry and Physics. CRC Press.

References: McNeil, D. R. (1977) Interactive Data Analysis. New York: Wiley.

Pressure dataset - Summary
========================================================


```r
summary(pressure)
```

```
  temperature     pressure       
 Min.   :  0   Min.   :  0.0002  
 1st Qu.: 90   1st Qu.:  0.1800  
 Median :180   Median :  8.8000  
 Mean   :180   Mean   :124.3367  
 3rd Qu.:270   3rd Qu.:126.5000  
 Max.   :360   Max.   :806.0000  
```

User Interface
========================================================

![User Interface](./presentation-figure/UI.PNG)
