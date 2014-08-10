library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Interactive plotting with shiny"),
  sidebarPanel(
    h3('Plotting Iris dataset'),
    p('Controls below can be used to select subsets of the three species (setosa, virginica, versicolor), and pairs of numeric variables (petal and sepa width and length) for plotting.'),
    h5('select species to include:'),
    checkboxGroupInput("id2", "species",
                       c('setosa'='setosa',
                         'versicolor'='versicolor',
                         'virginica'='virginica'),
                       selected=c('setosa','versicolor','virginica')
                       ),
    h5('select abcissa:'),
    selectInput("xvar",label="x axis",
                choices=colnames(iris)[1:4],
                selected='Petal.Length'
                ),
    h5('select ordinate:'),
    selectInput('yvar',label='y axis',
                choices=colnames(iris)[1:4],
                selected='Petal.Width'
                )
    
  ),
  mainPanel(
    h3('Results:'),
    p('The selected data are plotted along with the calculated median value for each species:'),
    plotOutput('scat'),
    br(),
    h6("RA Fisher's iris dataset"),
    a("(wikipedia link)",href="https://en.wikipedia.org/wiki/Iris_flower_data_set",target="_blank")
  )
))