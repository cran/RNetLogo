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
  A string containing either the absolute path to the model file (*.nlogo file) or a relative path to the model file starting from the NetLogo installation directory specified in \code{\link{NLStart}}. 
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <rnetlogo@gmx.de>
}
\seealso{
 \code{\link{NLStart}},
 \code{\link{NLQuit}} 
}
\examples{
\dontrun{
nl.path <- "C:/Program Files/NetLogo 5.1.0"
NLStart(nl.path)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
absolute.model.path <- paste(nl.path,model.path,sep="")
NLLoadModel(absolute.model.path)

relative.model.path <- "models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(relative.model.path)
}
}
\keyword{interface}
\keyword{NLLoadModel}
\keyword{RNetLogo}
