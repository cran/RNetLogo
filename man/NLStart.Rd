\name{NLStart}
\alias{NLStart}

\title{
  Creates an instance of NetLogo
}
\description{
  \code{NLStart} creates a new instance of NetLogo in either headless (without the Graphical User Interface)
  or GUI mode. 
}
\usage{
NLStart(nl.path, gui=TRUE, nl.obj=NULL, nl.version=5, is3d=FALSE)
}
\arguments{
  \item{nl.path}{
  An absolute path to your NetLogo installation (the folder where the NetLogo.jar is) starting from the root. On Windows, for example, something like "C:/Program Files/NetLogo 5.0.4".
}
  \item{gui}{
  (optional) A boolean value: if \code{TRUE}, NetLogo will be started with GUI (only one instance with GUI can be created currently!). 
  \code{FALSE} will start NetLogo in headless mode.
}
  \item{nl.obj}{
  (optional) A string which is used to identify the created NetLogo instance reference internally (in \code{.rnetlogo} environment). To refer to this instance just use the same name in the other functions of this package. If \code{nl.obj=NULL} (default), the internal name to the reference is \code{_nl.intern_} and is not needed to be submitted to the other functions of this package. After using NLQuit, the identical name can be used again for a new instance.
}
  \item{nl.version}{
  (optional) An integer value specifying the (major) version of NetLogo being started.
  Don't try to start a NetLogo version 4.x with nl.version=5 and vice versa.
  It is not possible to mix NetLogo versions in one R session. Please use different R sessions if you want to start RNetLogo
  with version 4 and version 5.
  The default is \code{nl.version=5} for NetLogo 5.0.
  For NetLogo 4.1.x use \code{nl.version=4}.
  For NetLogo 4.0.x use \code{nl.version=40}.
  Please note, that the data transformation is much faster in NetLogo 5.0 than in NetLogo 4.x. Therefore, using NetLogo 5 is strongly recommended.
  See the vignette \cr
  \code{performanceNotes.pdf} for performance details.
}
  \item{is3d}{
  (optional) A boolean value: if \code{TRUE}, NetLogo 3D will be started. \code{FALSE} will start the conventional 2D NetLogo. This functionality is experimental. All RNetLogo functions should work in NetLogo 3D as they do in conventional 2D NetLogo except NLSetPatches, which is currently not implemented to work in NetLogo 3D properly.
}
}
\details{
  You can start multiple instances of NetLogo in headless mode and store each in another
  variable (using \code{nl.obj}) but it is not possible to start multiple instances in GUI mode. 
  (It would result in an crash of R since there is no way to detach the Java Virtual Machine via rJava.) But there is a trick to run RNetLogo in GUI mode multiple times described in the document \code{parallelProcessing.pdf} in directory \code{parallelProcessing} in the installation directory of the package.
  
  
  \bold{Note for Mac OS users}: If you want to run RNetLogo in headless mode (without GUI, i.e. setting argument \code{gui=FALSE}) you have to disable AWT before loading the package. Just execute \code{Sys.setenv(NOAWT=1)} before executing \code{library(RNetLogo)}.
  If you want to run RNetLogo in GUI mode you have to start it from the JGR application (see \url{http://cran.r-project.org/web/packages/JGR/index.html} and the note at \url{http://groups.yahoo.com/group/netlogo-users/message/14817}). It can be necessary to run \code{Sys.setenv(NOAWT=1)} before loading the JGR package and run \code{Sys.unsetenv("NOAWT")} before starting JGR via \code{JGR()}.

  \bold{Note for Linux users}: If you want to run RNetLogo in GUI mode you should start RNetLogo in the JGR application (see \url{http://cran.r-project.org/web/packages/JGR/index.html}).

\bold{Note for Windows 32-bit users}: Starting RNetLogo (in GUI mode) on 32-bit Windows (not 64-bit Windows running in 32-bit mode) may fail in R version 2.15.2 and 2.15.3 (see description here: \url{https://stat.ethz.ch/pipermail/r-devel/2013-January/065576.html}). The reason could be the increased C stack size in 2.15.2 and 2.15.3. If you execute \code{Cstack_info()} you can see how large the C stack size is. The problem seems to be resolved with 3.0.0.
A workaround is to use R 2.15.1 or 3.x or to start RNetLogo from JGR (see \url{http://cran.r-project.org/web/packages/JGR/index.html}) or RStudio (see \url{http://www.rstudio.com/}).

  Avoid manually changing the working directory of R, because NetLogo needs to have the working directory pointed to its installation path. As 
the R working directory and the Java working directory depend on each other, changing the R working directory can result in unexpected behavior of NetLogo.
Therefore, you should use absolute paths for I/O processes in R instead of submitting \code{setwd(...)}. 
Note that the RNetLogo package changes the working directory 
automatically when loading NetLogo and changes back to the former working directory closing the last active instance of NetLogo with \code{NLQuit}.

  As mentioned in \code{NLQuit}, it is currently not possible to quit NetLogo completely. 

  If you want to specify options for the underlying Java Virtual Machine (JVM), like increasing the Java Heap Space for large models, execute \code{options(java.parameters="...")} before loading the RNetLogo package with \code{library(RNetLogo)} or \code{require(RNetLogo)}. For increasing the Java Heap Space it can be \code{options(java.parameters="-Xmx1024m")}, for example. Use a vector of strings for setting multiple options, for example \cr
  \code{options(java.parameters=c("-server","-Xmx1300m"))}.
  See also \cr
  \url{http://ccl.northwestern.edu/netlogo/docs/faq.html#howbig} and \cr
  \url{http://permalink.gmane.org/gmane.comp.lang.r.rosuda.devel/1284}. 

  See the directory \code{examples} in the installation directory of the package for example codes to all RNetLogo functions.

  See the paper in directory \code{tutorial} in the installation directory of the package for a step-by-step usage tutorial.

  See the vignette \code{performanceNotes.pdf} for performance notes.
  
  See the vignette \code{parallelProcessing.pdf} on how to run RNetLogo on multiple processors/clusters in parallel.
}
\value{
  No return value. 
}
\author{
  Jan C. Thiele <jthiele@gwdg.de>
}

\section{Warning }{
  It's not possible to run multiple instances of NetLogo in GUI mode! Closing NetLogo from the 
  NetLogo Window is blocked, because it would quit the whole R process. To close the NetLogo
  call \code{\link{NLQuit}}.
  If you use the headless mode you should first load a model with \code{\link{NLLoadModel}} 
  before executing other commands or reporters. In GUI mode you can execute commands and reporters already with the initial empty model without loading a specific one.
} 

\seealso{
 \code{\link{NLQuit}}
}
\examples{
\dontrun{
library(RNetLogo)
nl.path <- "C:/Program Files/NetLogo 5.0.4"
NLStart(nl.path)
NLCommand("create-turtles 10")
noturtles <- NLReport("count turtles")
print(noturtles)

# create a second NetLogo instance in headless mode (= without GUI) 
# stored in a variable
nlheadless1 <- "nlheadless1"
NLStart(nl.path, gui=F, nl.obj=nlheadless1)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""), nl.obj=nlheadless1)
NLCommand("setup", nl.obj=nlheadless1)
burned1 <- NLDoReport(20, "go", c("ticks","burned-trees"), 
                      as.data.frame=TRUE,df.col.names=c("tick","burned"), 
                      nl.obj=nlheadless1)
print(burned1)

# create a third NetLogo instance in headless mode (= without GUI) 
# with explicit name of stored object
nlheadless2 <- "nlheadless2"
NLStart(nl.path, gui=F, nl.obj=nlheadless2)
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""), nl.obj=nlheadless2)
NLCommand("setup", nl.obj=nlheadless2)
burned2 <- NLDoReport(10, "go", c("ticks","burned-trees"), 
                      as.data.frame=TRUE,df.col.names=c("tick","burned"), 
                      nl.obj=nlheadless2)
print(burned2)               
}
}
\keyword{interface}
\keyword{NLStart}
\keyword{RNetLogo}
