NLDoCommand <-
function(iterations, ..., nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
    
    # preprocessing: evaluate the commands
  commands <- lapply(list(...), function(x) {eval.commandobject(x)})
  # put all commands together to one string to be evaluated by NetLogo
  command <- paste(commands, collapse=" ")
 
  .jcall(nl.obj, "V", "doCommand", .jnew("java/lang/String", command), .jnew("java/lang/Integer", as.integer(iterations)) )
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

