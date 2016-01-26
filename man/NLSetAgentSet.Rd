\name{NLSetAgentSet}
\alias{NLSetAgentSet}
\title{
  Sets a variable of one or more agent(s) to value(s) in a data.frame or vector. 
}
\description{
  \code{NLSetAgentSet} is an easy way to set the variable value(s) of one or more agent(s) (by specifying the name of the agent or the name of an agentset containing the agents) to the value(s) of a data.frame or vector.
}
\usage{
NLSetAgentSet(agentset, input, var.name=NULL, nl.obj=NULL)
}
\arguments{
  \item{agentset}{
  A string specifying the agent or agentset for which values should be changed.
}
  \item{input}{
  A data.frame or vector.
  If a data.frame, it must have one column with the corresponding agent variable name for each agent variable to be set and one row for each agent.
  The rows have to be sorted in the order NetLogo is processing the agentset with \code{sort agentset} (e.g. turtles are sorted by their who value). 
  If a vector, only one agent variable can be set and the name has to be given by the optional argument \code{var.name}.
}
  \item{var.name}{
  If \code{input} is a simple vector instead of a data.frame it gives the name of the agent variable as a string which should be set with the values of the vector submitted in \code{input}. With a vector you can only set one agent variable at a time. 
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  The agent variable values contained as columns in the input data.frame are changed. The columns of the data.frame have to be named exactly like the 
  agent variable which should get the values. The rows have to be sorted as NetLogo would process the agentset using the \code{sort} reporter. 
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <rnetlogo@gmx.de>
}
\seealso{
  \code{\link{NLSetPatches}},
  \code{\link{NLGetAgentSet}},
  \code{\link{NLGetGraph}},
  \code{\link{NLDfToList}}
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.3/app"
NLStart(nl.path)
# NLLoadModel(...)
ag <- NLGetAgentSet(c("xcor","ycor"),"turtles")
ag2 <- data.frame(xcor=ag$xcor, ycor=ag$xcor)
NLSetAgentSet("turtles", ag2)
}
}
\keyword{interface}
\keyword{NLSetAgentSet}
\keyword{RNetLogo}
