### Test for upload part function #######

dataVertex <- read.csv("vertexAttributes.csv",header=FALSE,stringsAsFactors=FALSE)
dataRe <- read.csv("relationalData.csv",header=FALSE,stringsAsFactors=FALSE)
relations <- as.matrix(dataRe)
nodeInfo <- dataVertex
rownames(relations) <- nodeInfo$name
colnames(relations) <- nodeInfo$name
nrelations <- network(relations,directed=FALSE)

nw.reac <- reactive({
  inFile <- input$file1
  if(!is.null(inFile)) {
    plot(upload.nw())
    upload.nw()
  } else{
    if(input$goButton==0)return()  
    input$goButton
    isolate(eval(parse(text = input$dataset)))}
})