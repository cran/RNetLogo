\name{NLGetAgentSet}
\alias{NLGetAgentSet}
\title{
  Reports the values of the variables of the agent or agentset as a list
}
\description{
  \code{NLGetAgentSet} is an easy-to-use way to access variables of an agent or an agentset.
  An agent is a turtle, breed, patch or link. An agentset is a collection of agents. 
}
\usage{
NLGetAgentSet(agent.var, agentset, as.data.frame=FALSE, 
              df.col.names=NULL, nl.obj=NULL)
}
\arguments{
  \item{agent.var}{
  A string or vector/list of strings with the names of the agent/agentset variables.
}
  \item{agentset}{
  A string specifying the agent or agentset to be queried.
}
  \item{as.data.frame}{
  (optional) If \code{TRUE} (and agent.var is a list or vector) the function will return a data.frame instead a list. Default is \code{FALSE} which returns a list.
  Tip: If you want to get more than one agent variable (agent.var is a list or vector with length > 1) it's much more faster to ask for a data.frame instead of a list with nested lists for each agent.
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
  It's possible to use all the variables of an agent, which can be found in the inspect window.
  It isn't possible to get values from different types of agents (i.e. turtles, patches, links) with one
  call of \code{NLGetAgentSet}.
}
\value{
  Returns a list with the value(s) of the agent/agentset variable(s). 
  One (nested) list for each agent.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLReport}},
  \code{\link{NLGetPatches}},
  \code{\link{NLGetGraph}}
}
\examples{
\dontrun{
NLStart("C:/Program Files/NetLogo 4.1.3")
NLCommand("create-turtles 10")
colors <- NLGetAgentSet(c("who","xcor","ycor","color"), 
                        "turtles with [who < 5]")
# it's equivalent to (but unsorted):
# colors <- NLReport("[(list who xcor ycor color)] of turtles 
#                     with [who < 5]")
}
}
\keyword{ ~NLGetAgentSet }
\keyword{ ~RNetLogo }
