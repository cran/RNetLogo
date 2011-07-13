NLQuit <-
function(nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
    
  .jcall(nl.obj, "V", "KillWorkspace")

  #print("jinit")
  #.jinit(force.init=TRUE)
  #print("detach RNetLogo")
  #detach("package:RNetLogo")

  # see http://osdir.com/ml/lang.r.rosuda.devel/2007-01/msg00052.html
  #print("doneJVM")
  #.Call("doneJVM")

  #print("detach rJava")
  #detach("package:rJava")

  # free the instance
  nl.obj <- NULL
  # call the garbage collector
  .jcall('java/lang/System', 'V', 'gc')
  # java error handling
  if (!is.null(e<-.jgetEx()))
  {
    if (.jcheck(silent=TRUE))
    {
      print(e)
      stop()
    }
  } 
  setwd(.rnetlogo$savedworkingdir[2])
}

