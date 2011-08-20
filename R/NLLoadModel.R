NLLoadModel <-
function(model.path, nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
    
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

