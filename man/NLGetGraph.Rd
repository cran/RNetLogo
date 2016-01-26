\name{NLGetGraph}
\alias{NLGetGraph}
\title{
  Captures a network.
}
\description{
  \code{NLGetGraph} converts a set of NetLogo Link agents into an igraph graph object (see package igraph for details on graph objects).
}
\usage{
NLGetGraph(link.agentset="links", nl.obj=NULL)
}
\arguments{
  \item{link.agentset}{
  (optional) A string defining an agentset of NetLogo Links. Default is \code{"links"}, which are all links.
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  Saves a link network in a graph object of package igraph for network analysis.
}
\value{
  Returns a graph object of package igraph.
}
\author{
  Jan C. Thiele <rnetlogo@gmx.de>
}
\seealso{
  \code{\link{NLGetAgentSet}}
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.3/app"
NLStart(nl.path)
model.path <- 
"/models/Sample Models/Networks/Preferential Attachment.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""))
NLCommand("setup")
NLDoCommand(4, "go")
graph1 <- NLGetGraph()
plot(graph1, layout=layout.kamada.kawai, vertex.label=V(graph1)$name,
     vertex.shape="rectangle", vertex.size=20, asp=FALSE)
}
}
\keyword{interface}
\keyword{NLGetGraph}
\keyword{RNetLogo}
