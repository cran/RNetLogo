\name{NLSetAgentSet}
\alias{NLSetAgentSet}
\title{
  Function to set agent variable(s) of a agentset to values in a data.frame. 
}
\description{
  \code{NLSetAgentSet} is an easy-to-use way to set the values of an agentset to the values of a data.frame (or from a vector).
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
  If a data.frame, it has to contain for each variable to set one column with the corresponding agent variable name and one row for each agent of the agentset.
  The rows have to be sorted in the order NetLogo is processing the agentset with \code{sort agentset} (e.g. turtles are sorted by their who value). 
  If a vector, only one agent variable can be set and the name has to be given by the optional argument \code{var.name}.
}
  \item{var.name}{
  If \code{input} is a simple vector instead of a data.frame you have to give the name of the agent variable as a string which should be set with 
  the values of the vector submitted in input. With a vector you can only set one agent variable at a time. 
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  The agent variable values contained as columns in the input data.frame are changed. The columns of the data.frame have to be named exacly like the 
  agent variable which should get the values. And the rows have to be ordered as NetLogo process the agentset using the \code{sort} reporter. 
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLSetPatches}},
  \code{\link{NLGetAgentSet}},
  \code{\link{NLGetGraph}},
  \code{\link{NLDfToList}}
}
\examples{
\dontrun{
NLStart("C:/Program Files/NetLogo 5.0")
# NLLoadModel(...)
ag <- NLGetAgentSet(c("xcor","ycor"),"turtles")
ag2 <- data.frame(xcor=ag$xcor, ycor=ag$xcor)
NLSetAgentSet("turtles", ag2)
}
}
\keyword{ ~NLSetAgentSet }
\keyword{ ~RNetLogo }
