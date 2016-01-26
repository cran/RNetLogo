\name{RNetLogo-package}
\alias{RNetLogo-package}
\alias{RNetLogo}
\docType{package}
\title{
Provides an interface to the agent-based modelling platform NetLogo
}
\description{
Interface to use and access Wilensky's NetLogo (Wilensky 1999) from R (R Core Team 2014)
using either headless (no GUI) or interactive GUI mode. Provides functions to load
models, execute commands, and get values from reporters. 
Mostly analogous to the NetLogo Mathematica Link 
\url{https://github.com/NetLogo/Mathematica-Link}.
}
\details{
\tabular{ll}{
Package: \tab RNetLogo\cr
Type: \tab Package\cr
Version: \tab 1.0-2\cr
Date: \tab 2016-01-25\cr
License: \tab GNU GPL v2\cr
LazyLoad: \tab yes\cr
}
Start by creating a NetLogo instance by using \code{\link{NLStart}}. Then load a model with the function 
\code{\link{NLLoadModel}} and then use commands and reporters to do what you like.

It is possible to use NetLogo 3D. Just set the \code{is3d} argument in \code{\link{NLStart}} to \code{TRUE}. This functionality is experimental. All RNetLogo functions should work in NetLogo 3D as they do in conventional 2D NetLogo except \code{\link{NLSetPatches}}, which is not implemented to work with NetLogo 3D properly. \code{\link{NLSetPatchSet}} delivers a similar functionality usable also with NetLogo 3D but uses a data.frame instead of a matrix. 

\bold{Note for MAC users}: If you want to run RNetLogo in headless mode (without GUI, i.e. setting argument \code{gui=FALSE} in \code{\link{NLStart}}) you have to disable AWT before loading the package. Just execute \code{Sys.setenv(NOAWT=1)} before executing \code{library(RNetLogo)}.
  If you want to run RNetLogo in GUI mode you have to start it from the JGR application (see \url{https://cran.r-project.org/package=JGR} and the note at \url{http://groups.yahoo.com/group/netlogo-users/message/14817}). It can be necessary to run \code{Sys.setenv(NOAWT=1)} before loading the JGR package and run \code{Sys.unsetenv("NOAWT")} before starting JGR via \code{JGR()}.

\bold{Note for Linux users}: If you want to run RNetLogo in GUI mode you should start RNetLogo from JGR (see \url{https://cran.r-project.org/package=JGR}).

\bold{Note for Windows 32-bit users}: Starting RNetLogo (in GUI mode) on 32-bit Windows (not 64-bit Windows running in 32-bit mode) may fail in R version 2.15.2 and 2.15.3 (see description here: \url{https://stat.ethz.ch/pipermail/r-devel/2013-January/065576.html}). The reason could be the increased C stack size in 2.15.2 and 2.15.3. If you execute \code{Cstack_info()} you can see how large the C stack size is. The problem seems to be resolved with 3.0.0.
A workaround is to use R 2.15.1 or 3.x or to start RNetLogo from JGR (see \url{https://cran.r-project.org/package=JGR}) or RStudio (see \url{http://www.rstudio.com/}).  

If you want to increase the Java Heap Space and set other parameters of the Java Virtual Machine (JVM) see notes at \code{NLStart}.

See the tutorial published as Thiele (2014) for an introduction. Example codes for all functions can be found in the folder "\bold{examples}" in the installation path of the package. For \bold{performance notes} see the vignette "performanceNotes.pdf" and for an introduction how to \bold{run RNetLogo in parallel} on multicore computers or clusters/grids see the vignette "parallelProcessing.pdf".
}
\author{
  Jan C. Thiele <rnetlogo@gmx.de>
}
\references{
  For NetLogo see \url{http://ccl.northwestern.edu/netlogo}.
  
  For R Extension for NetLogo see \url{http://r-ext.sourceforge.net/}.
  
  For Rserve Extension for NetLogo see \url{http://rserve-ext.sourceforge.net/}.
  
  The RNetLogo package is analogous to (and inspired by) the NetLogo Mathematica Link \url{https://github.com/NetLogo/Mathematica-Link}.  
  
  Thiele, J. (2014) R Marries NetLogo: Introduction to the RNetLogo Package. Journal of Statistical Software 58(2) 1-41. \url{http://www.jstatsoft.org/v58/i02/}  
  
  Thiele, J., Kurth, W., Grimm, V. (2012) RNetLogo: An R Package for Running and Exploring Individual-Based Models Implemented in NetLogo. Methods in Ecology and Evolution 3(3) 480-483.
  
  R Core Team (2014) R: A Language and Environment for Statistical. R Foundation for Statistical Computing.Vienna, Austria. \url{http://www.R-project.org}.    
  
  Wilensky, U. (1999) NetLogo. \url{http://ccl.northwestern.edu/netlogo/}. Center for Connected Learning and Computer-Based Modeling, Northwestern University. Evanston, IL.  
}
\keyword{NetLogo}
\keyword{agent-based}
\keyword{individual-based}
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
nl.path <- "C:/Program Files/NetLogo 5.3/app"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
NLDoCommand(10, "go")
burned <- NLReport("burned-trees")
print(burned)
NLQuit()
}
}
