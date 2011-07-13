\name{NLLoadModel}
\alias{NLLoadModel}
\title{
  Loads a model into the NetLogo instance.
}
\description{
  \code{NLLoadModel} loads a model (*.nlogo file) into the submitted NetLogo instance.  
}
\usage{
NLLoadModel(model.path, nl.obj=NULL)
}
\arguments{
  \item{model.path}{
  A string containing the path to the model file (*.nlogo file). 
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
 \code{\link{NLStart}},
 \code{\link{NLQuit}} 
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 4.1.3"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
absolute.model.path <- paste(nl.path,model.path,sep="")
NLLoadModel(absolute.model.path)
}
}
\keyword{ ~NLLoadModel }
\keyword{ ~RNetLogo }
