\name{NLSetPatches}
\alias{NLSetPatches}
\title{
  Sets a variable of all patches in the NetLogo world to the values in a matrix. 
}
\description{
  \code{NLSetPatches} is an easy way to set the values of all patches to the values of a matrix.
}
\usage{
NLSetPatches(patch.var, in.matrix, nl.obj=NULL)
}
\arguments{
  \item{patch.var}{
  The name of the patch variable to set.
}
  \item{in.matrix}{
  A matrix that represents the NetLogo world (has the same dimensions).
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  The matrix must have the same x- and y-dimensions as the NetLogo world, indices beginning with (1,1). 
  The upper-left cell (1,1) of the matrix represents the upper-left patch of the NetLogo world, no matter where the origin of the NetLogo  world is set.
  This function is not available when running NetLogo 3D. Use \code{\link{NLSetPatchSet}} instead.
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
nl.path <- "C:/Program Files/NetLogo 5.3/app"
NLStart(nl.path)
m1 <- matrix(1:1089 , 33)
NLSetPatches("pcolor", m1)
}
}
\keyword{interface}
\keyword{NLSetPatches}
\keyword{RNetLogo}
