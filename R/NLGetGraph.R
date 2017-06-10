NLGetGraph <-
function(link.agentset="links", nl.obj=NULL)
{
  # get internal nl.obj if NULL
  if (is.null(nl.obj))
  {
    nl.obj <- "_nl.intern_"
  }
  # check for unknown nl.obj
  if (!(nl.obj %in% .rnetlogo$objects)) {
    stop(paste('There is no NetLogo reference stored under the name ',nl.obj,".", sep=""))
  }  
 
  # since NL 6.0:
  from <- NLReport(paste("map [[?] -> [[who] of end1] of ?] sort ", link.agentset, collapse=""), nl.obj=nl.obj)        
  #from <- NLReport(paste("map [[[who] of end1] of ?] sort ", link.agentset, collapse=""), nl.obj=nl.obj)        
  # since NL 6.0:
  to <- NLReport(paste("map [[?] -> [[who] of end2] of ?] sort ", link.agentset, collapse=""), nl.obj=nl.obj)
  #to <- NLReport(paste("map [[[who] of end2] of ?] sort ", link.agentset, collapse=""), nl.obj=nl.obj)
  #if(!require(igraph)) stop("RNetLogo::NLGetGraph needs package igraph")
  retgraph = graph.data.frame(data.frame(from=from,to=to), directed=TRUE)

  return (retgraph)
}

