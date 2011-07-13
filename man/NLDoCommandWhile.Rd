\name{NLDoCommandWhile}
\alias{NLDoCommandWhile}
\title{
  Repeated execution of a command in the referenced NetLogo instance while a reporter returns TRUE.
}
\description{
  \code{NLDoCommandWhile} function is used to execute a NetLogo command (submitted as a string)
  in the submitted NetLogo instance more than one time. It works like \code{\link{NLCommand}} but will
  be repeated while the reporter returns \code{TRUE}.
}
\usage{
NLDoCommandWhile(condition, ..., nl.obj=NULL)
}
\arguments{
  \item{condition}{
  A string with a NetLogo conditional reporter.
}
  \item{...}{
  An undefined number of string(s) with the NetLogo command(s) to be executed. See \link{NLCommand} for details.
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  This function is used to execute a command for more than one time. It could be used
  to run a simulation (e.g. calling "go") while a variable is lower a boundary value. 
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
nl.path <- "C:/Program Files/NetLogo 4.1.3"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
NLDoCommandWhile("burned-trees < 2200", "go")
}
}
\keyword{ ~NLDoCommandWhile }
\keyword{ ~RNetLogo }
