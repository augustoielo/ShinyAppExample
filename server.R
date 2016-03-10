library(shiny)

shinyServer(function(input,output){
        
        # Server logic goes here.
        output$plot <- renderPlot({
                if ( input$transform_x ) {
                        x <- switch(input$fX,
                                    log = log(pressure$temperature),
                                    sqrt = sqrt(pressure$temperature))
                        xlabel <- switch(input$fX,
                                         log = "Log Temperature (deg C)",
                                         sqrt = "Square Root Temperature (deg C)")
                } else {
                        x = pressure$temperature
                        xlabel = "Temperature (deg C)"
                }
                if ( input$transform_y ) {
                        y <- switch(input$fY,
                                    log = log(pressure$pressure),
                                    sqrt = sqrt(pressure$pressure))
                        ylabel <- switch(input$fY,
                                         log = "Log Pressure (mm)",
                                         sqrt = "Square Root Pressure (mm)")
                } else {
                        y = pressure$pressure
                        ylabel = "Pressure (mm)"
                }
                
                par(mar=c(6,5,6,3),oma=c(2,0,0,0))
                plot(x,y,pch=16,
                     ylab=ylabel,xlab=xlabel,
                     main="Vapor Pressure of Mercury as a Function of Temperature",
                     cex.lab=2,cex.main=2,cex.axis=2)
                
                if ( input$fit ) {
                        if ( input$method == "lm" ) {
                                fit = lm(y~x)
                                lines(x,fit$fitted.values,lwd=2)
                                rss=sum(residuals(fit)^2)
                        } else if ( input$method == "spline" ) {
                                fit = smooth.spline(x,y,spar=input$smooth)
                                lines(fit,lwd=2)
                                rss=sum((predict(fit,x)$y - y)^2)
                        } else if ( input$method == "poly" ) {
                                fit = lm(y ~ poly(x,input$degree))
                                lines(x,fit$fitted.values,lwd=2)
                                rss=sum(residuals(fit)^2)
                        }
                        if ( input$confint && input$method != "spline" ) {
                                expected <- predict(fit,data.frame(x),interval="confidence")
                                polygon(c(x,rev(x)),c(expected[,'upr'],rev(expected[,'lwr'])),
                                        col=gray(0,0.25),border=F)
                        }
                        legend("left",
                               paste("Squared Residuals",round(rss,3)),
                               bty="n",cex=2)
                }
        })
        
        output$stats_x <- renderTable({
                
                if ( input$transform_x ) {
                        x <- switch(input$fX,
                                    log = log(pressure$temperature),
                                    sqrt = sqrt(pressure$temperature))
                } else {
                        x = pressure$temperature
                }
                
                data.frame(
                        Statistic=c("Mean","Standard Deviation","Median","IQR"),
                        Value=c(mean(x),sd(x),median(x),IQR(x))
                )
                
        })
        
        output$stats_y <- renderTable({
                
                if ( input$transform_y ) {
                        y <- switch(input$fY,
                                    log = log(pressure$pressure),
                                    sqrt = sqrt(pressure$pressure))
                } else {
                        y = pressure$pressure
                }
                
                data.frame(
                        Statistic=c("Mean","Standard Deviation","Median","IQR"),
                        Value=c(mean(y),sd(y),median(y),IQR(y))
                )
                
        })
        
})