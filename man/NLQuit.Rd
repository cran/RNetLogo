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
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\section{Warning }{
  There is currently no way to kill a NetLogo instance with GUI completly. After executing \code{NLQuit} you
  can't run \code{NLStart} again. You have to quit your R session first and start a new one. 
  The reason is, that NetLogo quits itself via System.exit (and has no funcionality to quit all threads manually) but executing System.exit will terminate the whole JVM which will terminate also rJava and finally R.).
  It can happen that some memory is not released although you have executed NLQuit. Therefore, it is a good idea to start a new R session whenever it is possible (e.g. if you are going to load a new model).  
} 
\seealso{
 \code{\link{NLStart}}
}
\examples{
\dontrun{
NLStart("C:/Program Files/NetLogo 4.1.3")
NLQuit()
}
}
\keyword{ ~NLQuit }
\keyword{ ~RNetLogo }
