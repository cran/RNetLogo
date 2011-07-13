NLReport <-
function(reporter, nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
    
  if (length(reporter) == 1) 
  {
    resobj <- .jcall(nl.obj, "Ljava/lang/Object;", "report", .jnew("java/lang/String", reporter))       
    resobj <- eval.reportobject(resobj)
  }
  else {
    resobj <- .jcall(nl.obj, "[Ljava/lang/Object;", "report", .jarray(reporter))
    resobj <- lapply(resobj, function(x) {eval.reportobject(x)})
  } 
  # java error handling
  if (!is.null(e<-.jgetEx()))
  {
    if (.jcheck(silent=TRUE))
    {
      print(e)
      stop()
    }
  } 
  return (resobj)
}

