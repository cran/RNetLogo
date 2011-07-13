NLSourceFromString <-
function(..., append.model=TRUE, nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
    
  if(.rnetlogo$startedGUI)
  {
    # preprocessing: evaluate the commands
    model.source <- lapply(list(...), function(x) {eval.commandobject(x)})
    # put all commands together to one string to be evaluated by NetLogo
    model.source <- paste(c(...), collapse="\n")
  
    .jcall(nl.obj, "V", "sourceFromString", .jnew("java/lang/String", model.source), .jnew("java/lang/Boolean",append.model))
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
  else
  {
    stop('NLSourceFromString is only available if NetLogo was started with GUI.')
  }
}

