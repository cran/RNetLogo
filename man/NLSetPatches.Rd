\name{NLSetPatches}
\alias{NLSetPatches}
\title{
  Function to set a patch variable of all patches of the NetLogo world to the values of a matrix. 
}
\description{
  \code{NLSetPatches} is an easy-to-use way to set the values of all patches (NetLogo world) to the values of a matrix.
}
\usage{
NLSetPatches(patch.var, in.matrix, nl.obj=NULL)
}
\arguments{
  \item{patch.var}{
  The name of the patch variable which should be set to the values of the matrix.
}
  \item{in.matrix}{
  A matrix which is a representation of the NetLogo world (= same dimension).
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
  The matrix must have the same x- and y-dimension as the NetLogo world with indices beginning with (1,1). 
  The upper-left cell (1,1) of the matrix represents the upper-left patch of the NetLogo World 
  independent from the origin of the NetLogo World.
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
NLStart("C:/Program Files/NetLogo 5.0")
m1 <- matrix(1:1089 , 33)
NLSetPatches(m1, "pcolor")
}
}
\keyword{ ~NLSetPatches }
\keyword{ ~RNetLogo }
