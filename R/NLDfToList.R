NLDfToList <- 
function(in.data.frame, nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
    
  merge.key.values <- function(in.df, curr.name, nl.obj)
  {
    set.base <- paste(c('set',curr.name), collapse=" ")
    set.values <- eval.commandobject(in.df[,curr.name])    
    NLCommand(set.base, set.values, nl.obj=nl.obj) 
  }
  command <- lapply(names(in.data.frame), function(x) {merge.key.values(in.data.frame, x, nl.obj)})
}