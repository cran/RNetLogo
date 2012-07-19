\name{NLCommand}
\alias{NLCommand}
\title{
  Executes a command in the referenced NetLogo instance.
}
\description{
  \code{NLCommand} function is used to execute a NetLogo command (submitted as a string)
  in the submitted NetLogo instance.
}
\usage{
NLCommand(..., nl.obj=NULL)
}
\arguments{
  \item{...}{
  An undefined number of strings with the NetLogo command(s) to be executed. 
  Vectors, lists and data.frames will be represented as NetLogo-Lists. To set a NetLogo-List you can write \code{'set mylist',c(1,2,3)} 
  if the current NetLogo model knows a list named \code{mylist}.
  Furthermore, you can execute multiple commands at once, e.g. \code{'setup','go'} 
}
  \item{nl.obj}{
  (optional) A variable holding a reference to a NetLogo instance created with \code{\link{NLStart}}. 
}
}
\details{
  The command could be everything which can be submitted from the NetLogo Command Center. 
  A command has no return value! If you want to return a value from NetLogo use \code{\link{NLReport}} and friends.
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
NLCommand("create-turtles 10")
}
}
\keyword{ ~NLCommand }
\keyword{ ~RNetLogo }
