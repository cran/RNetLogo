\name{RNetLogo-package}
\alias{RNetLogo-package}
\alias{RNetLogo}
\docType{package}
\title{
Provides an interface to the agent-based modelling plattform NetLogo
}
\description{
Interface to embed NetLogo into the R environment 
with headless (no GUI) and interactive GUI mode. Provides functions to load
models, execute commands and to get values from reporters. 
Mostly equivalent to NetLogo Mathematica Link 
\url{http://ccl.northwestern.edu/netlogo/docs/mathematica.html}.
}
\details{
\tabular{ll}{
Package: \tab RNetLogo\cr
Type: \tab Package\cr
Version: \tab 0.9\cr
Date: \tab 2011-07-13\cr
License: \tab GNU GPL v2\cr
LazyLoad: \tab yes\cr
}
Start with the creation of a NetLogo instance by using \code{\link{NLStart}}. Then load a model with the function 
\code{\link{NLLoadModel}} and then use a command and/or reporter to do what you like.

Please note, that the package is not tested with Mac OS. 
If you made experiences with the package on Mac, please let me know.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\references{
  For NetLogo see \url{http://ccl.northwestern.edu/netlogo}.
  For R Extension for NetLogo see \url{http://netlogo-r-ext.berlios.de}.
  The RNetLogo package is an equivalent (and inspired by) to the NetLogo Mathematica Link \url{http://ccl.northwestern.edu/netlogo/docs/mathematica.html}.
}
\keyword{ NetLogo }
\keyword{ agent-based }
\keyword{ individual-based }
\seealso{
\code{
  \link{NLStart},
  \link{NLLoadModel},
  \link{NLQuit},
  rJava package} 
}
\examples{
\dontrun{
library(RNetLogo)
nl.path <- "C:/Program Files/NetLogo 4.1.3"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
NLDoCommand(10, "go")
burned <- NLReport("burned-trees")
print(burned)
}
}
