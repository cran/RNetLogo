\name{NLDoCommand}
\alias{NLDoCommand}
\title{
  Repeats execution of a command in the referenced NetLogo instance a defined number of times.
}
\description{
  \code{NLDoCommand} executes a NetLogo command (submitted as a string)
  in the submitted NetLogo instance more than one time. It works like \code{\link{NLCommand}}.
}
\usage{
NLDoCommand(iterations, ..., nl.obj=NULL)
}
\arguments{
  \item{iterations}{
  An integer defining the number of times the command is executed.
}
  \item{...}{
  An undefined number of string(s) with the NetLogo command(s) to be executed. See \link{NLCommand} for details.
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  This function is used to execute a command more than one time. It is usually used
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
nl.path <- "C:/Program Files/NetLogo 5.0.4"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
NLDoCommand(10, "go")
}
}
\keyword{interface}
\keyword{NLDoCommand}
\keyword{RNetLogo}
