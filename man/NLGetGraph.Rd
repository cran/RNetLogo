\name{NLGetGraph}
\alias{NLGetGraph}
\title{
  Captures a network.
}
\description{
  \code{NLGetGraph} returns a graph object.
}
\usage{
NLGetGraph(link.agentset="links", nl.obj=NULL)
}
\arguments{
  \item{link.agentset}{
  (optional) A string defining the set of links/network. Default is "links", which are all links.
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  Save a link network in a graph object of package igraph for network analysis.
}
\value{
  Return a graph object of package igraph.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLGetAgentSet}}
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 4.1.3"
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
\keyword{ ~NLGetGraph }
\keyword{ ~RNetLogo }
