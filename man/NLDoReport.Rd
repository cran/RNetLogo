\name{NLDoReport}
\alias{NLDoReport}
\title{
  Repeated execution of a command and a reporter in the referenced NetLogo instance for a defined number of repetitions.
}
\description{
  \code{NLDoReport} function is used to execute a NetLogo command (submitted as a string)
  in the NetLogo instance for more than one time and to execute the reporter after each iteration. 
  It works like a combination of \code{\link{NLReport}} and \code{\link{NLDoCommand}}.
}
\usage{
NLDoReport(iterations, command, reporter, as.data.frame=FALSE, 
           df.col.names=NULL, nl.obj=NULL)
}
\arguments{
  \item{iterations}{
  An interger defining the number of repetitions of the execution.
}
  \item{command}{
  A string with the NetLogo command to be executed. 
}
  \item{reporter}{
  A string conataining a NetLogo reporter.
  (Or a vector/list containing multiple strings with different reporters - but the same effect can be reached via \code{(list var1 var2 var3)}.) 
}
  \item{as.data.frame}{
  (optional) If \code{TRUE} the function will return a data.frame instead a list. Default is \code{FALSE} which returns a list.
}
  \item{df.col.names}{
  (optional) If \code{as.data.frame=TRUE} you can define the names of the columns of the returned data.frame via this parameter. 
  Input should be a vector containing the names as strings in the same order as the submitted reporters. 
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  This function is used to execute a command for more than one time and report a value or a number of values after
  each iteration. It is often used to call a procedure (e.g. "go") for a defined number of times and will save the value of
  a state variable in each simulation step. 
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
nl.path <- "C:/Program Files/NetLogo 5.0"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
burned10 <- NLDoReport(10, "go", "burned-trees")
initburned10 <- NLDoReport(10, "go", c("initial-trees","burned-trees"), 
                as.data.frame=TRUE, df.col.names=c("initial","burned"))
}
}
\keyword{ ~NLDoReport }
\keyword{ ~RNetLogo }
