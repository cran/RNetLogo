\name{NLSourceFromString}
\alias{NLSourceFromString}
\title{
  Creates or appends NetLogo code from R. 
}
\description{
  \code{NLSourceFromString} is a way to create/append a NetLogo model's source code dynamically from R.
}
\usage{
NLSourceFromString(..., append.model=TRUE, nl.obj=NULL)
}
\arguments{
  \item{...}{
  An undefined number of strings containing NetLogo model source code to be printed into the procedures tab.
  Line breaks within a string can be represented as \code{\\n}.  
}
  \item{append.model}{
  (optional) Determines whether existing code in the procedures tab (i.e. a loaded model) will be appended by the new code or will be replaced.
  By default, all existing code will be appended.
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  This function only works with NetLogo instances with GUI. It doesn't work in headless mode.
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <rnetlogo@gmx.de>
}
\seealso{
  \code{\link{NLReport}},
  \code{\link{NLGetAgentSet}},
  \code{\link{NLGetGraph}},
  \code{\link{NLDfToList}}
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.1.0"
NLStart(nl.path)
setup <- "to setup\n ca\n crt 10\nend \n"
go <- "to go\n ask turtles [\n  set xcor random-xcor\n  
       set ycor random-ycor\n ]\nend \n"
reporter1 <- "to-report noturtles\n report count turtles\n end \n"
NLSourceFromString(setup,go,reporter1, append.model=FALSE)
NLCommand("setup")
NLCommand("go")
noturtles <- NLReport("noturtles")
print(noturtles)
}
}
\keyword{interface}
\keyword{NLSourceFromString}
\keyword{RNetLogo}
