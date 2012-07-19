NLSetPatches <-
function(patch.var, in.matrix, nl.obj=NULL)
{
  if (is.null(nl.obj))
    nl.obj <- .rnetlogo[["nl.intern"]]
    
  if (!is.matrix(in.matrix))
  {
   stop('First argument must be a matrix!')
  }

  min.pxcor <- NLReport("min-pxcor", nl.obj=nl.obj)
  max.pxcor <- NLReport("max-pxcor", nl.obj=nl.obj)
  min.pycor <- NLReport("min-pycor", nl.obj=nl.obj)
  max.pycor <- NLReport("max-pycor", nl.obj=nl.obj)

  xdim <- min.pxcor:max.pxcor
  ydim <- min.pycor:max.pycor
  
  dims <- dim(in.matrix)
  if ((length(xdim) != dims[2]) || (length(ydim) != dims[1]))
  {
    stop(paste('matrix dimensions (',dims[2],dims[1],') do not fit NetLogo World dimensions (',length(xdim),length(ydim),')'))
  }
  
  set.patch <- function(nl.obj, in.matrix, patch.var, pxcor, pycor)
  {
    xindex <- pxcor - min.pxcor
    yindex <- pycor - min.pycor
    value <- in.matrix[xindex+1,yindex+1]
    NLCommand('ask patch',pxcor,pycor,'[','set',patch.var,value,']',nl.obj=nl.obj)
  }
  
  in.matrix <- t(in.matrix)
  in.matrix <- in.matrix[,ncol(in.matrix):1] 
  noreturn <- lapply(xdim, function(x) {
                            lapply(ydim, function(y) { set.patch(nl.obj, in.matrix, patch.var, x, y)})
                            })
}

