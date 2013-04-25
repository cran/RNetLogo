NLSetAgentSet <-
function(agentset, input, var.name=NULL, nl.obj=NULL) 
{
  # get internal nl.obj if NULL
  if (is.null(nl.obj))
  {
    nl.obj <- "_nl.intern_"
  }
  # check for unknown nl.obj
  if (!(nl.obj %in% names(.rnetlogo$objects))) {
    stop(paste('There is no NetLogo reference stored under the name ',nl.obj,".", sep=""))
  }  
  
  if (is.data.frame(input)) {
    if (length(input[[1]]) != NLReport(paste("count ",agentset,sep=" "), nl.obj=nl.obj)) {
      stop("Length of agentset not equal to length of input.")
    }
    # get agent variable names
    vars <- names(input)
    # construct processing string
    prev <- paste("(foreach sort ", agentset, sep="")
    ask <- "[ask ?1 ["
    sets <- paste(lapply(1:length(vars), 
                         function(x) 
                           paste("set ",vars[x]," ?",x+1," ", sep="")),collapse=" ")
    end <- "]])"
    inp <- paste(lapply(1:length(vars), 
                         function(x) 
                           paste("input[[\"",vars[x],"\"]]",sep="")),collapse=", ")
    str <- paste("NLCommand(\"",prev,"\",",inp,",\"",ask,sets,end,"\", nl.obj=nl.obj)", collapse="")
    # exec string
    eval(parse(text=str)) 
  }
  else if (is.vector(input)) {
    if (length(input) != NLReport(paste("count ",agentset,sep=" "), nl.obj=nl.obj)) {
      stop("Length of agentset not equal to length of input.")
    }
    if (length(var.name) != 1) {
      stop("For vector input you have to submit one agent variable name with argument var.name")
    }
    # construct processing string
    str <- paste("NLCommand(\" (foreach sort ", agentset, " \",input,\" [ask ?1 [set ",var.name," ?2]])\", nl.obj=nl.obj)", sep="")    
    # exec string
    eval(parse(text=str)) 
  }
  else {
    stop("Input has to be a data.frame or vector.")  
  }
}


