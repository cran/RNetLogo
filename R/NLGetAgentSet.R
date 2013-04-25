NLGetAgentSet <-
#function(agent.var, agentset, as.data.frame=FALSE, df.col.names=NULL, nl.obj=NULL)
function(agent.var, agentset, as.data.frame=TRUE, agents.by.row=FALSE, as.vector=FALSE, nl.obj=NULL)
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
  
  # check for empty agentset
  #if (NLReport(paste("count",agentset),nl.obj=nl.obj) == 0) {    
  if (!(NLReport(paste("any? ",agentset),nl.obj=nl.obj))) {
    stop("The requested agentset is empty")
  }

  # create a vector
  if (as.vector == TRUE) {
    if (length(agent.var) != 1) {
      stop("as.vector=TRUE makes only sense if you request just one agent variable.")
    }
    avar <- c("map [[",agent.var,"] of ?] sort ", agentset)
    avar <- paste(avar, collapse="")
    resobj <- NLReport(avar, nl.obj=nl.obj)  
  }
  else {
    # create a data.frame
    if (as.data.frame == TRUE) { 
      str <- lapply(agent.var, function(x) {paste("NLReport(\"map [[",x,"] of ?] sort ",agentset,"\",nl.obj=nl.obj)",sep="")})
      str <- paste(str, collapse=",")
      str <- paste("resobj <- data.frame(",str,")",sep=" ")
      eval(parse(text=str))  
      names(resobj) <- agent.var
    }
    else {
      # create an "old-style" list
      if (agents.by.row == TRUE) {
        avar <- lapply(agent.var, function(x) {paste(c("[",x,"] of ?"), collapse="")} )
        avar <- c("map [(list ",avar,")] sort ", agentset)
      } 
      # create a "new-style" list
      else {
        avar <- lapply(agent.var, function(x) {paste(c("map [[",x,"] of ?] sort", agentset), collapse=" ")})
        avar <- paste(c("(list",avar,")"), collapse=" ")
      }
      avar <- paste(avar, collapse="")
      resobj <- NLReport(avar, nl.obj=nl.obj)
      if (agents.by.row == FALSE) {
        names(resobj) <- agent.var
      }
    }
  }  
# old version (until 0.9.2)   
#  if (length(agent.var) == 1) {
#    avar <- c("map [[",agent.var,"] of ?] sort ", agentset)
#  }
#  else {
#    if (as.data.frame == TRUE)
#    {
#      avar <- lapply(agent.var, function(x) {paste(c("map [[",x,"] of ?] sort", agentset), collapse=" ")})
#      avar <- paste(c("(list",avar,")"), collapse=" ")
#    }
#    else
#    {
#      avar <- lapply(agent.var, function(x) {paste(c("[",x,"] of ?"), collapse="")} )
#      avar <- c("map [(list ",avar,")] sort ", agentset)
#    }
#  }
#  
#  avar <- paste(avar, collapse="")
#  resobj <- NLReport(avar, nl.obj=nl.obj)
#  
#  # transform result to data.frame
#  if ((as.data.frame == TRUE) && (is.list(resobj)))
#  {
#    if (length(agent.var) == 1)
#    {
#      resobj <- data.frame(do.call("rbind",resobj))
#      length.of.col <- lapply(resobj, function(x) {length(x[[1]])})
#      resobj[c(which(length.of.col==1))] <- as.data.frame(lapply(resobj[c(which(length.of.col==1))], function(x) { unlist(x) })) 
#    }
#    else
#    {
#      resobj <- as.data.frame(resobj)
#    }
#    if (length(df.col.names) > 0)
#    {
#      names(resobj) <- df.col.names
#    }
#  }  
  return (resobj)
}

