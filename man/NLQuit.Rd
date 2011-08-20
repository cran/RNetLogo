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
