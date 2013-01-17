\name{NLSetPatchSet}
\alias{NLSetPatchSet}
\title{
  Sets the variable value of one or more patches to values in a data.frame. 
}
\description{
  \code{NLSetPatchSet} is an easy way to set the variable value of one or more patches to the values of a data.frame.
}
\usage{
NLSetPatchSet(input, patch.var, nl.obj=NULL)
}
\arguments{
  \item{input}{
  A data.frame with first columns giving the coordinates of a patch. For conventional 2D NetLogo they have to be the x- (first column) and the y-coordinate (second column), for NetLogo 3D they have to be the x- (first column), the y- (second column) and the z-coordinate (third column). The thrid or fourth column have to contain the new value for the patch variable defined in argument \code{patch.var}. 
}
  \item{patch.var}{
  This argument gives the name of the patch variable as a string which should be set to the values of the thrid (for NetLogo 2D) or fourth column (for NetLogo 3D) of the data.frame submitted in \code{input}.
}
  \item{nl.obj}{
  (optional) A reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
    This function is used to update one patch variable for patches identified by their pxcor, pycor (and pzcor in case of NetLogo 3D) values based on values given in a data.frame. The column names of the input data.frame are irrelevant for the function but the content structure is important: In case of NetLogo 2D the first column gives the pxcor value, the second column the pycor value and the last column gives the new value of the variable defined in \code{patch.var} for this patch.
    For NetLogo 3D the third column gives the pzcor value and the fourth column gives the value of the variable defined in \code{patch.var}.
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
nl.path <- "C:/Program Files/NetLogo 5.0.3"
NLStart(nl.path)
# NLLoadModel(...)

# for NetLogo 2D:
input <- NLGetPatches(c("pxcor","pycor","pcolor"))
# for NetLogo 3D:
input <- NLGetPatches(c("pxcor","pycor","pzcor","pcolor"))

input$pcolor <- floor(abs(rnorm(nrow(input))*100)) 
patch.var <- "pcolor"
NLSetPatchSet(input, patch.var)
}
}
\keyword{interface}
\keyword{NLSetAgentSet}
\keyword{RNetLogo}
