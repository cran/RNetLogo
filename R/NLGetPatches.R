NLGetPatches <-
function(patch.var, patchset="patches", as.matrix=FALSE, as.data.frame=FALSE, df.col.names=NULL, nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
    
  if (NLReport(paste("count",patchset),nl.obj=nl.obj) == 0) {
    stop("The requested patchset is empty")
  }
  
  if (length(patch.var) == 1) {
    pvar <- c("map [[",patch.var,"] of ?] sort ", patchset)
  }
  else {
    if (as.data.frame == TRUE)
    {
      pvar <- lapply(patch.var, function(x) {paste(c("map [[",x,"] of ?] sort", patchset), collapse=" ")})
      pvar <- paste(c("(list",pvar,")"), collapse=" ")
    }
    else
    {
      pvar <- lapply(patch.var, function(x) {paste(c("[",x,"] of ?"), collapse="")} )
      pvar <- c("map [(list ",pvar,")] sort ", patchset)
    }
  }
  pvar <- paste(pvar, collapse="")
  resobj <- NLReport(pvar, nl.obj=nl.obj)
  
  if ((patchset == "patches") && (as.matrix == TRUE))
  {
    resobj <- matrix(resobj, NLReport('world-width',nl.obj=nl.obj))
    resobj <- t(resobj)
  }
  # transform result to data.frame
  if ((as.data.frame == TRUE) && (is.list(resobj)))
  {
    if (length(patch.var) == 1)
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

