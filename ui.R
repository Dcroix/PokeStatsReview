##Third Example - More Functions
library(shiny)
library(plotly)
shinyUI(fluidPage(
  img(src = "pic.png", height = 150, width = 1000),
  titlePanel("Project for Data Science Course of Johns Hopkins University"),
  h3("Author: Paolo G. Hilado"),
  h3("Data Source: Leonard Greski"), 
  helpText(target = "_blank", a("Link to the dataset", 
    href="https://github.com/lgreski/pokemonData")),
  sidebarLayout(
    sidebarPanel(
      h3(tags$i("Check which Pokemon Type leads in Selected Attributes.")),
      radioButtons("ctype", label = "Select Attribute for Comparison using Boxplots. Boxplot Color Fill is Customized to match Pokemon Type Color", 
                   choices = c("Total", "Attack", "Defense",
                "SpecialAtk", "SpecialDef", "Speed")),
      h3(tags$i("Preparing for Competitive Online Pokemon Battle? 
                Review the top Pokemon for each type and chosen attribute.")),
      h4("Choose the main type of the Pokemon"),
      selectInput(inputId = "type", label = "Type", choices = c("Grass", "Fire", "Water", "Bug", "Normal", "Poison", "Electric", 
          "Ground", "Fairy", "Fighting", "Psychic", "Rock", "Ghost", "Ice", "Dragon")),
      h4("Choose the attribute to which they will be ranked"),
      checkboxInput("att1", "Total", value = 1),
      checkboxInput("att2", "Attack", value = 0),
      checkboxInput("att3", "Defense", value = 0),
      checkboxInput("att4", "Special Attack", value = 0),
      checkboxInput("att5", "Special Defense", value = 0),
      checkboxInput("att6", "Speed", value = 0),
      sliderInput("slider1", "How many Pokemon do you wish to show?", 10, 100, 0)
    ),
    mainPanel(
      h3("Top Pokemon Based on the Selected Type and Attribute"),
      plotlyOutput("table7"),
      tableOutput("table1"),
      tableOutput("table2"),
      tableOutput("table3"),
      tableOutput("table4"),
      tableOutput("table5"),
      tableOutput("table6")
    )
  )
))