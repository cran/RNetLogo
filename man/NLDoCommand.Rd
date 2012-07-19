\name{NLDoCommand}
\alias{NLDoCommand}
\title{
  Repeated execution of a command in the referenced NetLogo instance for a defined number of repetitions.
}
\description{
  \code{NLDoCommand} function is used to execute a NetLogo command (submitted as a string)
  in the submitted NetLogo instance more than one time. It works like \code{\link{NLCommand}}.
}
\usage{
NLDoCommand(iterations, ..., nl.obj=NULL)
}
\arguments{
  \item{iterations}{
  An interger defining the number of repetitions of the execution.
}
  \item{...}{
  An undefined number of string(s) with the NetLogo command(s) to be executed. See \link{NLCommand} for details.
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  This function is used to execute a command for more than one time. It is usually used
  to call a procedure (e.g. "go") for a defined number of times. 
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLCommand}},
  \code{\link{NLDoCommandWhile}},
  \code{\link{NLReport}}
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.0"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
NLDoCommand(10, "go")
}
}
\keyword{ ~NLDoCommand }
\keyword{ ~RNetLogo }
