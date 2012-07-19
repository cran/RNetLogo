\name{NLGetPatches}
\alias{NLGetPatches}
\title{
  Reports the values of the variables of the patches as a data.frame (optional as a list, matrix or simple vector)
}
\description{
  \code{NLGetPatches} is an easy-to-use way to access variables of all patches (default) or of 
  an subset of patches.
}
\usage{
NLGetPatches(patch.var, patchset="patches", as.matrix=FALSE, 
             as.data.frame=TRUE, patches.by.row=FALSE,
             as.vector=FALSE, nl.obj=NULL)
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
  (optional) If this variable is \code{TRUE} (default is \code{FALSE}), the function will return the result as a matrix representing the NetLogo world.
  (Only available if you don't change the argument \code{patchset}, i.e. if you request the all patches/the whole world and you request only one patch variable, 
  i.e. length of \code{patch.var} is 1.)
}
  \item{as.data.frame}{
  (optional) If \code{TRUE} (default) the function returns a data.frame with a column for each patch.var and a row for each patch. 
  The column names are taken from the names of the \code{patch.var} argument. 
  If \code{FALSE} the function will return a list instead of a data.frame 
  (a little bit faster, when not using \code{patches.by.row=TRUE}) .   
}
  \item{patches.by.row}{
  (optional) Has an effect only in combination with \code{as.data.frame=FALSE}, i.e. a list should be returned.  
  If \code{patches.by.row=FALSE} (default) the returned list contains one list element for each patch.var. Each list element contain a vector with the values of the different patches (\code{patchset}).
  If \code{patches.by.row=TRUE} the returned list contains one list element for each patch. Each list element contain a vector with the values of the different request patch variables (\code{patch.var}).
  Attention: \code{patches.by.row=TRUE} makes the function very slow, especially when many patches are requested.
} 
  \item{as.vector}{
  (optional) If you request only one patch variable you can ask for getting the result as a simple vector by setting this argument to \code{TRUE}.
  This is the fastest way to access one patch variable. It does not make sense to set this variable to \code{TRUE} together with \code{as.data.frame=TRUE} or
  \code{as.matrix=TRUE}, but \code{as.vector} is processed first and will win the race if you accidently set \code{as.data.frame} or \code{as.matrix} to \code{TRUE} as well. 
  By default \code{as.vector} is \code{FALSE}.
} 
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  It's possible to use all the variables of a patch, which can be found in the inspect window.
  See the document \code{performanceNotes.pdf} in directory \code{performanceNote} in the installation directory of the package for
  performance details.
}
\value{
  Returns a data.frame (optional a list) with the value(s) of the patch/patchset variable(s). 
  One row for each patch and one column for each patch variable.
  The result is sorted (like using \code{sort patchset} in NetLogo, e.g. patches are sorted from upper left to lower right.
  
  To get the same result as with default settings until RNetLogo version 0.9.2 use: \code{as.data.frame=FALSE} and \code{patches.by.row=TRUE}.
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
NLStart("C:/Program Files/NetLogo 5.0")
# NLLoadModel(...)

allpatches <- NLGetPatches(c("pxcor","pycor","pcolor"))
str(allpatches)

# only a subset of all patches
subsetpatches <- NLGetPatches(c("pxcor","pycor","pcolor"), 
                              "patches with [pxcor < 5]")
str(subsetpatches)

# or as a list (slightly faster):
colors.list <- NLGetPatches(c("pxcor","pycor","pcolor"), 
                        "patches with [pxcor < 5]", as.data.frame=FALSE)
str(colors.list)

# or as a list with one list element for each patch
# (very slow!, not recommended especially for large patchsets)
colors.list2 <- NLGetPatches(c("pxcor","pycor","pcolor"), 
                        "patches with [pxcor < 5]", as.data.frame=FALSE, 
                        patches.by.row=TRUE)
str(colors.list2)
}
}
\keyword{ ~NLGetPatches }
\keyword{ ~RNetLogo }
