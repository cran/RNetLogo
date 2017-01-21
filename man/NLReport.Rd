\name{NLReport}
\alias{NLReport}
\title{
  Reports a value or list of values
}
\description{
  \code{NLReport} reports NetLogo data back to R. 
}
\usage{
NLReport(reporter, nl.obj=NULL)
}
\arguments{
  \item{reporter}{
  A string containing a NetLogo reporter.
  (Or a vector of strings.)
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  Every reporter (commands which return a value) that can be called in the NetLogo Command Center 
  can be called with \code{NLReport}. 
}
\value{
  A vector of length one if only one value is returned. Otherwise it is a list or, if necessary, a nested list with the reported values.
}
\author{
  Jan C. Thiele <rnetlogo@gmx.de>
}
\seealso{
  \code{\link{NLDoReport}},
  \code{\link{NLDoReportWhile}},
  \code{\link{NLGetPatches}},
  \code{\link{NLGetAgentSet}} 
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 6.0/app"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
NLDoCommand(10, "go")
noburned <- NLReport("burned-trees")
str(noburned)
}
}
\keyword{interface}
\keyword{NLReport}
\keyword{RNetLogo}
