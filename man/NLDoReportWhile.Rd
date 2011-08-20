\name{NLDoReportWhile}
\alias{NLDoReportWhile}
\title{
  Repeated execution of a command and a reporter in the referenced NetLogo instance while a conditional reporter returns TRUE.
}
\description{
  \code{NLDoReportWhile} function is used to execute a NetLogo command (submitted as a string)
  in the submitted NetLogo instance more than one time  and to execute the reporter after each iteration. 
  It works like \code{\link{NLDoReport}} but will be repeated while the conditional reporter returns \code{TRUE}.
}
\usage{
NLDoReportWhile(condition, command, reporter, as.data.frame=FALSE, 
                df.col.names=NULL, nl.obj=NULL)
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
  This function is used to execute a command for more than one time and will report a value or a number of values after
  each iteration. It is usually used to call a procedure (e.g. "go") while a variable is lower a boundary value and to 
  save the value of a state variable in each simulation step. 
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
nl.path <- "C:/Program Files/NetLogo 4.1.3"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
burnedLower2200 <- NLDoReportWhile("burned-trees < 2200", "go", 
                                   "burned-trees")
}
}
\keyword{ ~NLDoReportWhile }
\keyword{ ~RNetLogo }
