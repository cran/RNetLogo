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
  A string conataining a NetLogo reporter.
  (Or a vector of strings.)
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  Every reporter (= a command which will return a value), which can be called in the NetLogo Command Center, 
  can be called with \code{NLReport}. 
}
\value{
  A list or, if necessary, a nested list with the reported values.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLDoReport}},
  \code{\link{NLDoReportWhile}},
  \code{\link{NLGetPatches}},
  \code{\link{NLGetAgentSet}} 
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.0"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
NLDoCommandWhile("burned-trees < 2200", "go")
noburned <- NLReport("burned-trees")
}
}
\keyword{ ~NLReport }
\keyword{ ~RNetLogo }
