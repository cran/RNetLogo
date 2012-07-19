\name{NLGetAgentSet}
\alias{NLGetAgentSet}
\title{
  Reports the values of the variables of the agent or agentset as a data.frame (optional as a list or vector)
}
\description{
  \code{NLGetAgentSet} is an easy-to-use way to access variables of an agent or an agentset (in a sorted way).
  An agent is a turtle, breed, patch, or link. An agentset is a collection of agents. 
}
\usage{
NLGetAgentSet(agent.var, agentset, as.data.frame=TRUE, 
              agents.by.row=FALSE, as.vector=FALSE, nl.obj=NULL)
}
\arguments{
  \item{agent.var}{
  A string or vector/list of strings with the names of the agent/agentset variables.
}
  \item{agentset}{
  A string specifying the agent or agentset to be queried.
}
  \item{as.data.frame}{
  (optional) If \code{TRUE} (default) the function will return a data.frame with a column for each agent.var and a row for each agent. 
  The column names are taken from the names of the \code{agent.var} argument.
  If \code{FALSE} the function will return a list instead of a data.frame 
  (a little bit faster, when not using \code{agents.by.row=TRUE}) . 
}
  \item{agents.by.row}{
  (optional) Has an effect only in combination with \code{as.data.frame=FALSE}, i.e. a list should be returned.  
  If \code{agents.by.row=FALSE} (default) the returned list contains one list element for each agent.var. Each list element contain a vector with the values of the different agents (\code{agentset}).
  If \code{agents.by.row=TRUE} the returned list contains one list element for each agent. Each list element contain a vector with the values of the different request agent variables (\code{agent.var}).
  Attention: \code{agents.by.row=TRUE} makes the function very slow, especially when many agents are requested.
} 
  \item{as.vector}{
  (optional) If you request only one agent variable you can ask for getting the result as a simple vector by setting this argument to \code{TRUE}.
  This is the fastest way to access one agent variable. It does not make sense to set this variable to \code{TRUE} together with \code{as.data.frame=TRUE}, 
  but \code{as.vector} is processed first and will win the race if you accidently set \code{as.data.frame} to \code{TRUE} as well. 
  By default \code{as.vector} is \code{FALSE}.
} 
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  It's possible to use all the variables of an agent, which can be found in the inspect window.
  It isn't possible to get values from different types of agents (i.e. turtles, patches, links) with one
  call of \code{NLGetAgentSet}.
  See the document \code{performanceNotes.pdf} in directory \code{performanceNote} in the installation directory of the package for
  performance details.
}
\value{
  Returns a data.frame (optional a list) with the value(s) of the agent/agentset variable(s). 
  One row for each agent and one column for each agent variable.
  The result is sorted (like using \code{sort agentset} in NetLogo, e.g. turtles are sorted by their \code{who} variable) and patches from upper left to lower right.

  To get the same result as with default settings until RNetLogo version 0.9.2 use: \code{as.data.frame=FALSE} and \code{agents.by.row=TRUE}.
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
NLStart("C:/Program Files/NetLogo 5.0")
# NLLoadModel(...)
NLCommand("create-turtles 10")

colors <- NLGetAgentSet(c("who","xcor","ycor","color"), 
                        "turtles with [who < 5]")
str(colors)
                        
# or as a list (slightly faster):
colors.list <- NLGetAgentSet(c("who","xcor","ycor","color"), 
                        "turtles with [who < 5]", as.data.frame=FALSE)
str(colors.list)
            
# or as a list with one list element for each agent
# (very slow!, not recommended especially for large agentsets)
colors.list2 <- NLGetAgentSet(c("who","xcor","ycor","color"), 
                        "turtles with [who < 5]", as.data.frame=FALSE, 
                        agents.by.row=TRUE)
str(colors.list2)
                        
# getting the ends of links is a little more tricky, since they store only the
# reference to the turtles and turtles can not direcly be requested. 
# Here comes the solution:
link.test <- NLGetAgentSet(c("[who] of end1","[who] of end2"),"links")
str(link.test)
}
}
\keyword{ ~NLGetAgentSet }
\keyword{ ~RNetLogo }
