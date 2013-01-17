\name{NLQuit}
\alias{NLQuit}
\title{
  Quits a NetLogo instance.
}
\description{
  Quits the NetLogo workspace and closes the GUI window (if started with GUI).
}
\usage{
NLQuit(nl.obj=NULL)
}
\arguments{
  \item{nl.obj}{
  (optional) The reference to a NetLogo instance, if several have been started.
}
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\section{Warning }{
  There is currently no way to kill a NetLogo instance with GUI completely. After executing \code{NLQuit} on a GUI instance, you can't run \code{NLStart} again. 
  You have to quit your R session first and start a new one. 
  The reason is that NetLogo quits via System.exit (and has no functionality to quit all threads manually) but executing System.exit will terminate the whole JVM which will also terminate rJava and finally R. But there is a trick to run RNetLogo in GUI mode multiple times described in the document \code{parallelProcessing.pdf} in directory \code{parallelProcessing} in the installation directory of the package.
  It can happen that some memory is not released although you have executed \code{NLQuit}, because shutting down the running JVM via rJava and unloading the required libraries is not possible. 
  Therefore, it is a good idea to start a new R session if possible when you load a new model.  
} 
\seealso{
 \code{\link{NLStart}}
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.0.3"
NLStart(nl.path)
NLQuit()
}
}
\keyword{interface}
\keyword{NLQuit}
\keyword{RNetLogo}
