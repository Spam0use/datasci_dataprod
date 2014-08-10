library(shiny)
#library(ggplot2)
data(iris)
shinyServer(
  function(input, output) {
    #output$oid2 = renderPrint({input$id2})   #debug
    output$scat = renderPlot({if(length(input$id2)>0){dat=subset(iris,Species %in% input$id2)
                              cols=2:4
                              names(cols)=c('setosa','versicolor','virginica')
                              x=dat[[input$xvar]]
                              y=dat[[input$yvar]]
                              meds=aggregate(dat[,c(input$xvar,input$yvar)],list(dat$Species),median)
                              plot(x,y,pch=19,col=cols[dat$Species],xlab=input$xvar,ylab=input$yvar)
                              points(meds[,2:3],pch=13,col=cols[meds[,1]],cex=2)
                              legend('topleft',legend=c(input$id2,paste('median',input$id2)),col=rep(cols[input$id2],2),pch=rep(c(19,13),c(length(input$id2),length(input$id2))))
                              }})
  }
)