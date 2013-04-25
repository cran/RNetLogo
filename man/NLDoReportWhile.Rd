\name{NLDoReportWhile}
\alias{NLDoReportWhile}
\title{
  Repeats execution of a command and a reporter in the referenced NetLogo instance while a conditional reporter returns \code{TRUE}.
}
\description{
  \code{NLDoReportWhile} function executes a NetLogo command (submitted as a string)
  more than one time  and executes the reporter after each iteration. 
  It works like \code{\link{NLDoReport}} but will be repeated while the conditional reporter returns \code{TRUE}.
}
\usage{
NLDoReportWhile(condition, command, reporter, as.data.frame=FALSE, 
                df.col.names=NULL, max.minutes=10, nl.obj=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{condition}{
  A string with a NetLogo conditional reporter.
}
  \item{command}{
  A string with the NetLogo command to be executed. 
}
  \item{reporter}{
  A string containing a NetLogo reporter. 
  This argument can also be an R vector containing multiple strings with different NetLogo reporters (separated by commas), like \code{c("count patches", "count turtles")}. (A similar effect can be reached by using a NetLogo reporter returning a NetLogo list, like \code{"(list count patches count agents)"} as a single string argument. But the result will not be an R list with a nested R lists but an R list with nested R vectors because NetLogo lists are converted to R vectors.)
}
  \item{as.data.frame}{
  (optional) If \code{TRUE} the function will return a data.frame instead a list. Default is \code{FALSE} which returns a list.
}
  \item{df.col.names}{
  (optional) If \code{as.data.frame=TRUE} defines the names of the columns of the returned data.frame. 
  The argument is a vector containing the names as strings in the same order as the reporters. 
}
  \item{max.minutes}{
  (optional) If \code{max.minutes > 0} the execution stops after the defined number of minutes (with an error and no return value). By default, all executions are stoped after 5 minutes, to prevent the execution of endless loops. If you need more time, increase the value. If you're sure what you do, you can set this value to 0. Then, it will run while the condition is true (i.e. endlessly when the condition is never met. In GUI mode, you can press "Tools --> Halt" in the NetLogo menu to interrupt a running process.). This can speed up the execution, because the time checking is not applied in this case. 
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  This function executes a command more than one time and reports a value or a number of values after
  each iteration. It is usually used to call a procedure (e.g. "go") while a variable is below a boundary value and save the value of a state variable each time. 
  Attention: Make sure that the condition switches from \code{TRUE} to \code{FALSE} sometime, 
  otherwise you will run an endless loop (which is stopped after 10 minutes by default, see argument \code{max.minutes}).
}
\value{
  A list/nested list with the value(s) of the reporter after each execution of the command.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLDoCommandWhile}},
  \code{\link{NLReport}},
  \code{\link{NLDoReport}}
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.0.4"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
burnedLower2200 <- NLDoReportWhile("burned-trees < 2200", "go", 
                                   "burned-trees")
str(burnedLower2200)
}
}
\keyword{interface}
\keyword{NLDoReportWhile}
\keyword{RNetLogo}
