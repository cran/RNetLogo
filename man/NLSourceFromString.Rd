\name{NLSourceFromString}
\alias{NLSourceFromString}
\title{
  Function to create/append model source code from R to NetLogo. 
}
\description{
  \code{NLSourceFromString} gives the oportunity to create/append a NetLogo model source code dynamically from R.
}
\usage{
NLSourceFromString(..., append.model=TRUE, nl.obj=NULL)
}
\arguments{
  \item{...}{
  An undefined number of strings containing NetLogo model source code which should be printed into the procedures tab.
  Line brakes within a string can be obtained be typing \code{\\n}.  
}
  \item{append.model}{
  (optional) Determines wheter existing code in the procedures tab (i.e. a loaded model) will be appended by the new code or will be replaced.
  By default, all existing code will be appended.
}
  \item{nl.obj}{
  (optional) A variable holding a reference to an NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  This function only works with NetLogo instances with GUI. It doesn't work in headless mode.
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLReport}},
  \code{\link{NLGetAgentSet}},
  \code{\link{NLGetGraph}},
  \code{\link{NLDfToList}}
}
\examples{
\dontrun{
NLStart("C:/Program Files/NetLogo 4.1.3")
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
\keyword{ ~NLSourceFromString }
\keyword{ ~RNetLogo }
