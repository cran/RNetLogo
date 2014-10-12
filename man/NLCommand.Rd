\name{NLCommand}
\alias{NLCommand}
\title{
  Executes a command in the referenced NetLogo instance.
}
\description{
  \code{NLCommand} executes a NetLogo command (submitted as a string)
  in the (submitted) NetLogo instance.
}
\usage{
NLCommand(..., nl.obj=NULL)
}
\arguments{
  \item{...}{
  An undefined number of strings with the NetLogo command(s) to be executed. 
  Vectors, lists and data.frames will be represented as NetLogo lists. To set a NetLogo list you can write \code{'set mylist',c(1,2,3)} 
  if the current NetLogo model knows a list named \code{mylist}.
  Furthermore, you can execute multiple commands in series, e.g. \code{'setup','go'} 
}
  \item{nl.obj}{
  (optional) A string identifying a reference to a NetLogo instance created with \code{\link{NLStart}}. 
}
}
\details{
  The command can be anything which can be submitted from the NetLogo Command Center. 
  A command has no return value! If you want to return a value from NetLogo use \code{\link{NLReport}} and other report functions.
}
\value{
  No return value.
}
\author{
  Jan C. Thiele <rnetlogo@gmx.de>
}
\seealso{
  \code{\link{NLDoCommand}},
  \code{\link{NLDoCommandWhile}},
  \code{\link{NLReport}}
}
\examples{
\dontrun{
NLStart("C:/Program Files/NetLogo 5.1.0")
NLCommand("create-turtles 10")
}
}
\keyword{interface}
\keyword{NLCommand}
\keyword{RNetLogo}
