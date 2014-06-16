\name{NLGetPatches}
\alias{NLGetPatches}
\title{
  Reports the values of patch variables as a data.frame (optional as a list, matrix or simple vector)
}
\description{
  \code{NLGetPatches} is an easy way to access variables of all patches (default) or of 
  a subset of patches.
}
\usage{
NLGetPatches(patch.var, patchset="patches", as.matrix=FALSE, 
             as.data.frame=TRUE, patches.by.row=FALSE,
             as.vector=FALSE, nl.obj=NULL)
}
\arguments{
  \item{patch.var}{
  A string or vector/list of strings with the names of patch variables to report.
}
  \item{patchset}{
  (optional) A string defining which patches to request. 
  By default, values of all patches are returned.
}
  \item{as.matrix}{
  (optional) If this variable is \code{TRUE} (default is \code{FALSE}), the function will return the result as a matrix representing the NetLogo world.
  (This option is Only available, if the argument \code{patchset} is not used, i.e. if you request all patches and only one patch variable, i.e. length of \code{patch.var} is 1.)
}
  \item{as.data.frame}{
  (optional) If \code{TRUE} (default) the function returns a data.frame with one column for each \code{patch.var} and one row for each patch. 
  The column names are taken from the names of the \code{patch.var} argument. 
  If \code{FALSE} the function will return a list instead of a data.frame 
  (little bit faster, when not using \code{patches.by.row=TRUE}).   
}
  \item{patches.by.row}{
  (optional) This argument has an effect only in combination with \cr
  \code{as.data.frame=FALSE}, i.e. when a list is returned.  
  If \code{patches.by.row=FALSE} (default) the returned list contains one list element for each \code{patch.var}. Each list element contains a vector with the values of the different patches (\code{patchset}).
  If \code{patches.by.row=TRUE} the returned list contains one list element for each patch. Each list element contains a vector with the values of the different requested patch variables \cr
  (\code{patch.var}). Attention: \code{patches.by.row=TRUE} makes the function very slow, especially when many patches are requested.
} 
  \item{as.vector}{
  (optional) Set this argument to \code{TRUE} for getting the result as a simple vector in case of requesting only one patch variable.
  This is the fastest way to access one patch variable. It does not make sense to set this variable to \code{TRUE} together with \code{as.data.frame=TRUE} or
  \code{as.matrix=TRUE}, but \code{as.vector} is processed first and will win the race if you accidentally set \code{as.data.frame} or \code{as.matrix} to \code{TRUE} as well. 
  By default \code{as.vector} is \code{FALSE}.
} 
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  It's possible to use all the variables of a patch, which can be found in NetLogo's Agent Monitors.
  See the vignette \code{performanceNotes.pdf} for performance details and notes on changes since version 0.9.3.

}
\value{
  Returns a data.frame (optional a list) with the variable value(s) of a patch/patches of a patchset. 
  One row for each patch and one column for each patch variable.
  The result is sorted (like using \code{sort patchset} in NetLogo), e.g. patches are sorted from upper left to lower right.
  
  To get the same result as with default settings until RNetLogo version 0.9.2 use: \cr
  \code{as.data.frame=FALSE} and \code{patches.by.row=TRUE}.
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
nl.path <- "C:/Program Files/NetLogo 5.0.5"
NLStart(nl.path)
# NLLoadModel(...)

allpatches <- NLGetPatches(c("pxcor","pycor","pcolor"))
str(allpatches)

# only a subset of patches
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
\keyword{interface}
\keyword{NLGetPatches}
\keyword{RNetLogo}
