NLCommand <-
function(..., nl.obj=NULL)
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
  
  # preprocessing: evaluate the commands
  commands <- lapply(list(...), function(x) {eval.commandobject(x)})
  # put all commands together to one string to be evaluated by NetLogo
  command <- paste(commands, collapse=" ")

  .jcall(nl.obj, "V", "command", .jnew("java/lang/String", command))
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

