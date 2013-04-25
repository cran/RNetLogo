\name{NLDfToList}
\alias{NLDfToList}
\title{
  Transforms a data.frame into a NetLogo list or multiple NetLogo list (one for each column of the data.frame).
}
\description{
  \code{NLDfToList} pushes the values of a data.frame into NetLogo lists. 
  The column names of the data.frame are used as names for the NetLogo lists 
  (but the lists must already exist in the current NetLogo model).
}
\usage{
NLDfToList(in.data.frame, nl.obj=NULL)
}
\arguments{
  \item{in.data.frame}{
  The data.frame to fill the NetLogo lists.
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}. 
}
}
\details{
  Remember: There must be lists in the NetLogo model with the names of the columns of the submitted data.frame. 
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}
\seealso{
  \code{\link{NLDoCommand}},
  \code{\link{NLDoCommandWhile}},
  \code{\link{NLReport}}
}
\examples{
\dontrun{
NLStart("C:/Program Files/NetLogo 5.0.4")
df1 <- data.frame(x=c(1,2,3,4),y=c(5,6,7,8))
# the current NetLogo model must have two variables ('x' and 'y')
# add the variables
NLSourceFromString("globals [x y]", append.model=FALSE)
# set the variables to the data.frame
NLDfToList(df1)
}
}
\keyword{interface}
\keyword{NLDfToList}
\keyword{RNetLogo}
