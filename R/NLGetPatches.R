NLGetPatches <-
#function(patch.var, patchset="patches", as.matrix=FALSE, as.data.frame=FALSE, df.col.names=NULL, nl.obj=NULL)
function(patch.var, patchset="patches", as.matrix=FALSE, as.data.frame=TRUE, patches.by.row=FALSE, as.vector=FALSE, nl.obj=NULL)
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

  # check for empty patchset
  #if (NLReport(paste("count",patchset),nl.obj=nl.obj) == 0) {
  if (!(NLReport(paste("any? ",patchset),nl.obj=nl.obj))) {
    stop("The requested patchset is empty")
  }
  
  
  # create a vector
  if (as.vector == TRUE) {
    if (length(patch.var) != 1) {
      stop("as.vector=TRUE makes only sense if you request just one patch variable.")
    }
    pvar <- c("map [[",patch.var,"] of ?] sort ", patchset)
    pvar <- paste(pvar, collapse="")
    resobj <- NLReport(pvar, nl.obj=nl.obj)  
  }
  else {
    # create a data.frame
    if ((as.data.frame == TRUE) || (as.matrix == TRUE)) { 
      str <- lapply(patch.var, function(x) {paste("NLReport(\"map [[",x,"] of ?] sort ",patchset,"\",nl.obj=nl.obj)",sep="")})
      str <- paste(str, collapse=",")
      str <- paste("resobj <- data.frame(",str,")",sep=" ")
      eval(parse(text=str))  
      names(resobj) <- patch.var
      if (as.matrix == TRUE)
      {
        if (patchset != "patches") {
          stop("as.matrix can only be used for the all patches (i.e. patchset=\"patches\")")
        }
        if (length(patch.var) > 1) {
          stop("It does not make sense to create a matrix with more than one patch.var.")
        }
        resobj <- matrix(unlist(resobj), NLReport('world-width',nl.obj=nl.obj))
        resobj <- t(resobj)
      }
    }
    # create a list
    else {
      if (patches.by.row == TRUE) {
        avar <- lapply(patch.var, function(x) {paste(c("[",x,"] of ?"), collapse="")} )
        avar <- c("map [(list ",avar,")] sort ", patchset)
      } 
      else {
        avar <- lapply(patch.var, function(x) {paste(c("map [[",x,"] of ?] sort", patchset), collapse=" ")})
        avar <- paste(c("(list",avar,")"), collapse=" ")
      }
      avar <- paste(avar, collapse="")
      resobj <- NLReport(avar, nl.obj=nl.obj)
      if (patches.by.row == FALSE) {
        names(resobj) <- patch.var
      }
    }
  }
  
# old version (until 0.9.2) 
#  if (length(patch.var) == 1) {
#    pvar <- c("map [[",patch.var,"] of ?] sort ", patchset)
#  }
#  else {
#    if (as.data.frame == TRUE)
#    {
#      pvar <- lapply(patch.var, function(x) {paste(c("map [[",x,"] of ?] sort", patchset), collapse=" ")})
#      pvar <- paste(c("(list",pvar,")"), collapse=" ")
#    }
#    else
#    {
#      pvar <- lapply(patch.var, function(x) {paste(c("[",x,"] of ?"), collapse="")} )
#      pvar <- c("map [(list ",pvar,")] sort ", patchset)
#    }
#  }
#  pvar <- paste(pvar, collapse="")
#  resobj <- NLReport(pvar, nl.obj=nl.obj)
#  
#  if ((patchset == "patches") && (as.matrix == TRUE))
#  {
#    resobj <- matrix(resobj, NLReport('world-width',nl.obj=nl.obj))
#    resobj <- t(resobj)
#  }
#  # transform result to data.frame
#  if ((as.data.frame == TRUE) && (is.list(resobj)))
#  {
#    if (length(patch.var) == 1)
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

