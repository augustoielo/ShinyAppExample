# Shiny App Example
Course Project: Shiny Application and Reproducible Pitch

## 1. Instructions for this Course Project

1. Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application. 
2. Deploy the application on Rstudio's shiny server.
3. Share the application link by pasting it into the text box below. 
4. Share your server.R and ui.R code on github. 

The application must include the following:

1. Some form of input (widget: textbox, radio button, checkbox, ...).
2. Some operation on the ui input in sever.R.
3. Some reactive output displayed as a result of server calculations.
4. You must also include enough documentation so that a novice user could use your application.
5. The documentation should be at the Shiny website itself. Do not post to an external link.

The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.  

## 2. Shiny Application description

This really simple Shiny App shows a regression example between temperature in degrees Celsius and vapor pressure of mercury in millimeters (of mercury), and how transformation of the input and output affects the regression model.

The app includes 3 checkbox and some dropdown inputs controlling these values:

*Y Transformation                  To take transformation of y variable(stopping distance)
*X Transformation                  To take transformation of x variable(car speed)
*Fit a curve line to the data      Fit a line on the plot
    **Log                           Log transformation
    **Square Root                   Square root transformation
*95% Confidence Interval           Draw a 95% confidence interval range
  

## 3. Run the Shiny Application

Go to [https://augustoielo.shinyapps.io/ExampleApp/](https://augustoielo.shinyapps.io/ExampleApp/)
