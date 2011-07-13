\name{NLGetPatches}
\alias{NLGetPatches}
\title{
  Reports the values of the variables of the patches as a list
}
\description{
  \code{NLGetPatches} is an easy-to-use way to access variables of all patches (default) or of 
  an subset of patches.
}
\usage{
NLGetPatches(patch.var, patchset="patches", as.matrix=FALSE, 
             as.data.frame=FALSE, df.col.names=NULL, 
             nl.obj=NULL)
}
\arguments{
  \item{patch.var}{
  A string or vector/list of strings with the names of patch-variables to be reported.
}
  \item{patchset}{
  (optional) A string defining which patches should be requested. 
  By default, values of all patches will be returned.
}
  \item{as.matrix}{
  (optional) If this variable is \code{TRUE}, the function will return the  result as a matrix representing the NetLogo world.
  (Only available if you don't change the argument \code{patchset}, i.e. if you request the all patches/the whole world.)
}
  \item{as.data.frame}{
  (optional) If \code{TRUE} (and patch.var is a list or vector) the function will return a data.frame instead a list. Default is \code{FALSE} which returns a list.
  Tip: If you want to get more than one patch variable (patch.var is a list or vector with length > 1) it's much more faster to ask for a data.frame instead of a list with nested lists for each patch.
}
  \item{df.col.names}{
  (optional) If \code{as.data.frame=TRUE} you can define the names of the columns of the returned data.frame via this parameter. 
  Input should be a vector containing the names as strings in the same order as the submitted reporters. 
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  It's possible to use all the variables of a patch, which can be found in the inspect window.
}
\value{
  Returns a list with the values of the patches variable(s). 
  One (nested) list for each patch.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLReport}},
  \code{\link{NLGetAgentSet}},
  \code{\link{NLGetGraph}}
}
\examples{
\dontrun{
NLStart("C:/Program Files/NetLogo 4.1.3")
allpatches <- NLGetPatches(c("pxcor","pycor","pcolor"))
subsetpatches <- NLGetPatches(c("pxcor","pycor","pcolor"), 
                              "patches with [pxcor < 5]")
# it's equivalent to (but unsorted):
# subsetpatches <- NLReport("[(list pxcor pycor pcolor)] 
#                           of patches with [pxcor < 5]")
# and
# subsetpatches <- NLGetAgentSet(c("pxcor","pycor","pcolor"), 
#                                "patches with [pxcor < 5]")
}
}
\keyword{ ~NLGetPatches }
\keyword{ ~RNetLogo }
