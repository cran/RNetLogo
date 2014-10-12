\name{NLDoCommandWhile}
\alias{NLDoCommandWhile}
\title{
  Repeats a command in the referenced NetLogo instance while a reporter returns \code{TRUE}.
}
\description{
  \code{NLDoCommandWhile} function executes a NetLogo command (submitted as a string)
  in the submitted NetLogo instance more than one time. It works like \code{\link{NLCommand}} but will
  be repeated as long as the reporter returns \code{TRUE}.
}
\usage{
NLDoCommandWhile(condition, ..., max.minutes=10, nl.obj=NULL)
}
\arguments{
  \item{condition}{
  A string with a NetLogo conditional reporter.
}
  \item{...}{
  An undefined number of string(s) with the NetLogo command(s) to be executed. See \link{NLCommand} for details.
}
  \item{max.minutes}{
  (optional) If \code{max.minutes > 0} the execution stops after the defined number of minutes (with an error). By default, all executions are stopped after 10 minutes, to prevent the execution of endless loops. If you need more time, increase the value. If you're sure what you do, you can set this value to 0. Then, it will run while the condition is true (i.e. endlessly when the condition is never met. In GUI mode, you can press "Tools --> Halt" in the NetLogo menu to interrupt a running process.). This can speed up the execution, because the time checking is not applied in this case. 
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  This function is used to execute a command for more than one time. It can be used, for example,
  to run a simulation (by calling "go") while a variable is below some limit. 
  
  The condition is evaluated before the submitted commands are executed. If the condition is \code{FALSE} at the   first evaluation, the commands will never be executed.
  
  Attention: Make sure that the condition switches from \code{TRUE} to \code{FALSE} sometime, 
  otherwise you will run an endless loop (which is stopped after 10 minutes by default, see argument \code{max.minutes}).
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <rnetlogo@gmx.de>
}
\seealso{
  \code{\link{NLCommand}},
  \code{\link{NLDoCommandWhile}},
  \code{\link{NLReport}}
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.1.0"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
NLDoCommandWhile("burned-trees < 500", "go")
}
}
\keyword{interface}
\keyword{NLDoCommandWhile}
\keyword{RNetLogo}
