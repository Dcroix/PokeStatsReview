library(shiny)
library(xlsx)
library(plotly)
shinyServer(function(input, output){
  data <- read.xlsx("pkmngen1.xlsx", sheetIndex = "Sheet1")
  data <- data[, c(2,3,5,6,7,8,9,10,11)]
  
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  x <- list(
    title = "Pokemon Type",
    titlefont = f
  )
  y <- list(
    title = "Chosen Attribute",
    titlefont = f
  )
 
  tab1 <- reactive({
    data1 <- data[data$Type1 == input$type,]
    data1 <- data1[order(data1$Total, decreasing = 1),]
    head(data1, input$slider1)
  })
  
  tab2 <- reactive({
    data2 <- data[data$Type1 == input$type,]
    data2 <- data2[order(data2$Attack, decreasing = 1),]
    head(data2, input$slider1)
  })
  
  tab3 <- reactive({
    data3 <- data[data$Type1 == input$type,]
    data3 <- data3[order(data3$Defense, decreasing = 1),]
    head(data3, input$slider1)
  })
  
  tab4 <- reactive({
    data4 <- data[data$Type1 == input$type,]
    data4 <- data4[order(data4$SpecialAtk, decreasing = 1),]
    head(data4, input$slider1)
  })
  
  tab5 <- reactive({
    data5 <- data[data$Type1 == input$type,]
    data5 <- data5[order(data5$SpecialDef, decreasing = 1),]
    head(data5, input$slider1)
  })
  
  tab6 <- reactive({
    data6 <- data[data$Type1 == input$type,]
    data6 <- data6[order(data6$Speed, decreasing = 1),]
    head(data6, input$slider1)
  })

  output$table1 <- renderTable({
    if(input$att1){
      tab1()
    }
  }) 
  output$table2 <- renderTable({
    if(input$att2){
      tab2()
    }
  })
  output$table3 <- renderTable({
    if(input$att3){
      tab3()
    }
  })
  output$table4 <- renderTable({
    if(input$att4){
      tab4()
    }
  })
  output$table5 <- renderTable({
    if(input$att5){
      tab5()
    }
  })
  output$table6 <- renderTable({
    if(input$att6){
      tab6()
    }
  })
  output$table7 <- renderPlotly({
    plot_ly(data = data, y = ~get(input$ctype), x = ~Type1, type = "box", color = data$Type1, colors = c("olivedrab1", "gray8", "goldenrod2",
                 "yellow1", "orchid1", "sienna3", "red2", "peachpuff2", "magenta4", "forestgreen", 
                 "khaki3", "paleturquoise3", "ivory3", "purple3", "orchid4", 
                 "thistle4", "slategray3", "royalblue1")) %>% layout(xaxis = x, yaxis = y)
  })
})
