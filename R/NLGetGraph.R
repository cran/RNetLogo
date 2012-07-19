NLGetGraph <-
function(link.agentset="links", nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
 
  from <- NLReport(paste("map [[[who] of end1] of ?] sort ", link.agentset, collapse=""), nl.obj=nl.obj)        
  to <- NLReport(paste("map [[[who] of end2] of ?] sort ", link.agentset, collapse=""), nl.obj=nl.obj)
  if(!require(igraph)) stop("RNetLogo::NLGetGraph needs package igraph")
  retgraph = graph.data.frame(data.frame(from=from,to=to), directed=TRUE)

# old version (until 0.9.2)  
#  query <- c("[list ([who] of end1) ([who] of end2)] of ", link.agentset)
#  query <- paste(query, collapse="")
#  resobj <- NLReport(query, nl.obj)
#  #resobj <- lapply(resobj, function(x) {paste(c(x[[1]]," -> ",x[[2]]), collapse="")})
#  #return (resobj)
#  if(!require(igraph)) stop("RNetLogo::NLGetGraph needs package igraph")
#  resobj = data.frame(from=unlist(lapply(resobj,"[[",1)),
#                      to=unlist(lapply(resobj,"[[",2)))
#  retgraph = graph.data.frame(resobj, directed=TRUE)
  return (retgraph)
}

