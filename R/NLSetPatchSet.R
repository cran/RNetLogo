NLSetPatchSet <-
function(patch.var, input, nl.obj=NULL)
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
  
  if (!is.data.frame(input)) {
    stop("Input has to be a data.frame.")
  }
  
  if (length(patch.var) != 1) {
    stop("You have to submit one patch variable name with argument patch.var")
  }
    
  
  if (.rnetlogo$nl3d == TRUE) {
      # for NetLogo 3D:
    
      if (ncol(input) != 4) {
        stop("Input must have four columns: x, y, z, <patch.var>")
      }
      
      set.patch.3D <- function(nl.obj, patch.var, value, pxcor, pycor, pzcor)
      {
        xindex <- pxcor
        yindex <- pycor
        zindex <- pzcor
        NLCommand('ask patch',pxcor,pycor,pzcor,'[','set',patch.var,value,']',nl.obj=nl.obj)
      }
              
      invisible(apply(input, 1, function(x) {set.patch.3D(nl.obj, patch.var, x[4], x[1], x[2], x[3])}))      
  }
  else {
    # for conventional 2D NetLogo:      

    if (ncol(input) != 3) {
      stop("Input must have three columns: x, y, <patch.var>")
    }
    
    set.patch.2D <- function(nl.obj, patch.var, value, pxcor, pycor)
    {
      xindex <- pxcor
      yindex <- pycor
      NLCommand('ask patch',pxcor,pycor,'[','set',patch.var,value,']',nl.obj=nl.obj)
    }
    
    invisible(apply(input, 1, function(x) {set.patch.2D(nl.obj, patch.var, x[3], x[1], x[2])}))      
  }
    
}
