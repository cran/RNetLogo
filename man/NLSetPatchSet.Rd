\name{NLSetPatchSet}
\alias{NLSetPatchSet}
\title{
  Sets the variable value of one or more patch(es) to value(s) in a data.frame. 
}
\description{
  \code{NLSetPatchSet} is an easy way to set the variable value of one or more patch(es) to the value(s) of a data.frame.
}
\usage{
NLSetPatchSet(patch.var, input, nl.obj=NULL)
}
\arguments{
  \item{patch.var}{
  This argument gives the name of the patch variable as a string which should be set to the values of the third (for NetLogo 2D) or fourth column (for NetLogo 3D) of the data.frame submitted in \code{input}.
}
  \item{input}{
  A data.frame with columns giving the coordinates of a patch and the values for the patch variable to be changed. For conventional 2D NetLogo there has to be a pxcor and a pycor column , for NetLogo 3D there has to be a pxcor, a pycor, and a pzcor column. name of the column that contains the new values for the patch variable has to be equal to the argument \code{patch.var}. 
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}.
}
}
\details{
    This function is used to update one patch variable for patches identified by their pxcor, pycor (and pzcor in case of NetLogo 3D) values based on values given in a data.frame. 
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
nl.path <- "C:/Program Files/NetLogo 5.0.5"
NLStart(nl.path)
# NLLoadModel(...)

# for NetLogo 2D:
input <- NLGetPatches(c("pxcor","pycor","pcolor"))
str(input)
# for NetLogo 3D:
input <- NLGetPatches(c("pxcor","pycor","pzcor","pcolor"))
str(input)

input$pcolor <- floor(abs(rnorm(nrow(input))*100)) 
patch.var <- "pcolor"
NLSetPatchSet(patch.var, input)
}
}
\keyword{interface}
\keyword{NLSetAgentSet}
\keyword{RNetLogo}
