\name{NLDfToList}
\alias{NLDfToList}
\title{
  Transforms a data.frame into a NetLogo-List or multiple NetLogo-List (one for each column of the data.frame).
}
\description{
  \code{NLDfToList} function is used to push the values of a data.frame into NetLogo-Lists. 
  The column names of the data.frame are used as names for the NetLogo-Lists 
  (but the NetLogo-List must already exist in the current NetLogo model).
}
\usage{
NLDfToList(in.data.frame, nl.obj=NULL)
}
\arguments{
  \item{in.data.frame}{
  The data.frame which should be used to fill the NetLogo-Lists (with the names of the columns of this data.frame) with the corresponding values of the column.
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}. 
}
}
\details{
  Remember: There have to be NetLogo-Lists in the NetLogo model with the names of the columns of the submitted data.frame. 
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
NLStart("C:/Program Files/NetLogo 5.0")
df1 <- data.frame(x=c(1,2,3,4),y=c(1,2,3,4))
# the current NetLogo model must have lists with the names 'x' and 'y'
NLDfToList(df1)
}
}
\keyword{ ~NLDfToList }
\keyword{ ~RNetLogo }
