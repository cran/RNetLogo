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
  (optional) A reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  The matrix must have the same x- and y-dimensions as the NetLogo world, indices beginning with (1,1). 
  The upper-left cell (1,1) of the matrix represents the upper-left patch of the NetLogo World, no matter where the origin of the NetLogo World is set.
  This function is not available when running NetLogo 3D. Use \code{\link{NLSetPatchSet}} instead.
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
nl.path <- "C:/Program Files/NetLogo 5.0.3"
NLStart(nl.path)
m1 <- matrix(1:1089 , 33)
NLSetPatches(m1, "pcolor")
}
}
\keyword{interface}
\keyword{NLSetPatches}
\keyword{RNetLogo}
