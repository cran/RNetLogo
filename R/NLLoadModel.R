NLLoadModel <-
function(model.path, nl.obj=NULL)
{
  # get internal nl.obj if NULL
  if (is.null(nl.obj))
  {
    nl.obj <- "_nl.intern_"
  }
  # get NetLogo reference
  if (nl.obj %in% names(.rnetlogo$objects)) {
    nl.obj <- .rnetlogo$objects[[nl.obj]]
  } else {
    stop(paste('There is no NetLogo reference stored under the name ',nl.obj,".", sep=""))
  } 
    
  .jcall(nl.obj, "V", "loadModel", .jnew("java/lang/String", model.path))
  # java error handling
  if (!is.null(e<-.jgetEx()))
  {
    if (.jcheck(silent=TRUE))
    {
      print(e)
      stop()
    }
  }
}

