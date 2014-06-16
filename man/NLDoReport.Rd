\name{NLDoReport}
\alias{NLDoReport}
\title{
  Repeats a command and a reporter in the referenced NetLogo instance a defined number of times.
}
\description{
  \code{NLDoReport} executes a NetLogo command (submitted as a string)
  in the NetLogo instance for more than one time, and executes the reporter after each iteration. 
  It works like a combination of \code{\link{NLReport}} and \code{\link{NLDoCommand}}.
}
\usage{
NLDoReport(iterations, command, reporter, as.data.frame=FALSE, 
           df.col.names=NULL, nl.obj=NULL)
}
\arguments{
  \item{iterations}{
  An integer defining how many times the command is repeated.
}
  \item{command}{
  A string with the NetLogo command to be executed. 
}
  \item{reporter}{
  A string containing a NetLogo reporter.
  This argument can also be an R vector containing multiple strings with different NetLogo reporters (separated by commas), like \code{c("count patches", "count turtles")}. (A similar effect can be reached by using a NetLogo reporter returning a NetLogo list, like \cr
  \code{"(list count patches count agents)"} as a single string argument. But the result will not be an R list with nested R lists but an R list with nested R vectors because NetLogo lists are converted to R vectors.)
}
  \item{as.data.frame}{
  (optional) If \code{TRUE} the function will return a data.frame instead of a list. Default is \code{FALSE}, which returns a list.
}
  \item{df.col.names}{
  (optional) If \code{as.data.frame=TRUE}, contains the names of the columns of the returned data.frame. 
  The argument is a vector containing the names as strings in the same order as the submitted reporters. 
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  This function is used to execute a command more than one time and report a value or a number of values after
  each iteration. It is often used to call a procedure (e.g. "go") for a defined number of times and save the value of a state variable each time. 
}
\value{
  A list/nested list or data.frame with the value(s) of the reporter after each execution of the command.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLDoCommand}},
  \code{\link{NLReport}},
  \code{\link{NLDoReportWhile}}
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.0.5"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
burned10 <- NLDoReport(10, "go", "burned-trees")
initburned10 <- NLDoReport(10, "go", c("initial-trees","burned-trees"), 
                as.data.frame=TRUE, df.col.names=c("initial","burned"))
str(initburned10)
}
}
\keyword{interface}
\keyword{NLDoReport}
\keyword{RNetLogo}
