\name{NLStart}
\alias{NLStart}

\title{
  Creates an instance of NetLogo
}
\description{
  \code{NLStart} can be used to create a new instance of NetLogo in headless (without the Graphical User Interface)
  or GUI mode. 
}
\usage{
NLStart(nl.path, gui=TRUE, obj.name=NULL, nl.version=4, is3d=FALSE)
}
\arguments{
  \item{nl.path}{
  Path to your NetLogo installation (the folder where the NetLogo.jar is).
}
  \item{gui}{
  (optional) A boolean value: if \code{TRUE}, NetLogo will be started with GUI (only one instance with GUI can be created currently!). 
  \code{FALSE} will start NetLogo in headless mode.
}
  \item{obj.name}{
  (optional) A string with the name of the variable which should be created and will contain the reference to the NetLogo instance. 
  After the execution of \code{NLStart} is finished, there will be a variable with the given name in the 
  global scope. This variable is needed for all further transactions and is always the last argument of the other
  functions of the RNetLogo package.
  If you don't specify this variable, an intern (in .rnetlogo environment) variable will be created and automaticaly used in all further functions.
}
  \item{nl.version}{
  (optional) An interger value, that determines, if you want to start a NetLogo version 4.x or a NetLogo version 5.x.
  Don't try to start a NetLogo version 4.x with nl.version=5 and vice versa.
  It is not possible to mix NetLogo versions in one R session. Please use different R sessions if you want to start RNetLogo
  with version 4 and version 5.
}
  \item{is3d}{
  (optional) A boolean value: if \code{TRUE}, NetLogo 3D will be started. \code{FALSE} will start the conventionally 2D NetLogo.
}
}
\details{
  You can start multiple instances of NetLogo in headless mode and save each in another
  variable but it is not possible to start multiple instances in GUI mode. 
  (It would result in an crash of R since there is no way to detach the Java Virtual Machine via rJava.)
  
  Note for Linux and Mac OS X (Mac is untested) users: If you want to use the GUI mode, then it can be necessary to run RNetLogo 
  in JGR application (see package JGR, http://cran.r-project.org/web/packages/JGR/index.html). 
  
  General Notes: 
  1. You should avoid to manually change the working directory of R, because NetLogo need to have the working directory pointed to its installation path. As 
the R working directory and the Java working directory depend on each other, changing the R working directory can result in unexpected behavior of NetLogo.
There, you should use absolute paths for I/O processes in R instead of submitting setwd(...). Note, that the RNetLogo package changes the working directory 
automatically when loading NetLogo and changes back to the former working directory when submitting NLQuit.
  2. It is currently not possible to quit NetLogo completly (because NetLogo quits itself via System.exit but executing System.exit will terminate the whole JVM which will terminate also rJava and finally R.).
  It can happen that some memory is not released although you have executed NLQuit. Therefore, it is a good idea to start a new R session whenever it is possible (e.g. if you are going to load a new model).  
}
\value{
  The function implicit returns an Java Object containing the reference to the Java controlling interface stored in a variable with the name given in 3rd function argument. 
  This variable is needed for further transactions (like \code{\link{NLLoadModel}} or \code{\link{NLCommand}}). 
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}

\section{Warning }{
  It's not possible to run multiple instances of NetLogo in GUI mode! Closing NetLogo from the 
  NetLogo Window is blocked, because it would quit the whole R process. To close the NetLogo
  call \code{\link{NLQuit}}.
  If you use the headless mode you should first load a model with \code{\link{NLLoadModel}} 
  before executing other commands and reporters.
} 

\seealso{
 \code{\link{NLQuit}}
}
\examples{
\dontrun{
library(RNetLogo)
nl.path <- "C:/Program Files/NetLogo 4.1.3"
NLStart(nl.path)
NLCommand("create-turtles 10")
noturtles <- NLReport("count turtles")
print(noturtles)

# create a second NetLogo instance in headless mode (= without GUI) 
# with explicit name of stored object
NLStart(nl.path, FALSE, "nlheadless1")
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""), nlheadless1)
NLCommand("setup", nl.obj=nlheadless1)
burned1 <- NLDoReport(20, "go", c("ticks","burned-trees"), 
                      as.data.frame=TRUE,df.col.names=c("tick","burned"), 
                      nl.obj=nlheadless1)
print(burned1)

# create a third NetLogo instance in headless mode (= without GUI) 
# with explicit name of stored object
NLStart(nl.path, FALSE, "nlheadless2")
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""), nlheadless2)
NLCommand("setup", nl.obj=nlheadless2)
burned2 <- NLDoReport(10, "go", c("ticks","burned-trees"), 
                      as_dataframe=TRUE,dfcolnames=c("tick","burned"), 
                      nl.obj=nlheadless2)
print(burned2)               
}
}
\keyword{ ~NLStart }
\keyword{ ~RNetLogo }
