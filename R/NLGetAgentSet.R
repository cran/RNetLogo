NLGetAgentSet <-
function(agent.var, agentset, as.data.frame=FALSE, df.col.names=NULL, nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
    
  if (NLReport(paste("count",agentset),nl.obj=nl.obj) == 0) {
    stop("The requested agentset is empty")
  }
  
  if (length(agent.var) == 1) {
    avar <- c("map [[",agent.var,"] of ?] sort ", agentset)
  }
  else {
    if (as.data.frame == TRUE)
    {
      avar <- lapply(agent.var, function(x) {paste(c("map [[",x,"] of ?] sort", agentset), collapse=" ")})
      avar <- paste(c("(list",avar,")"), collapse=" ")
    }
    else
    {
      avar <- lapply(agent.var, function(x) {paste(c("[",x,"] of ?"), collapse="")} )
      avar <- c("map [(list ",avar,")] sort ", agentset)
    }
  }
  
  avar <- paste(avar, collapse="")
  resobj <- NLReport(avar, nl.obj=nl.obj)
  # transform result to data.frame
  if ((as.data.frame == TRUE) && (is.list(resobj)))
  {
    if (length(agent.var) == 1)
    {
      resobj <- data.frame(do.call("rbind",resobj))
      length.of.col <- lapply(resobj, function(x) {length(x[[1]])})
      resobj[c(which(length.of.col==1))] <- as.data.frame(lapply(resobj[c(which(length.of.col==1))], function(x) { unlist(x) })) 
    }
    else
    {
      resobj <- as.data.frame(resobj)
    }
    if (length(df.col.names) > 0)
    {
      names(resobj) <- df.col.names
    }
  }  
  return (resobj)
}

