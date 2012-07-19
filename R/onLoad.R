.rnetlogo <- new.env()
.rnetlogo[["nl.intern"]] <- NULL
.rnetlogo[["objectnames"]] <- c()
.rnetlogo[["savedworkingdir"]] <- c()
.rnetlogo[["libname"]] <- ""
.rnetlogo[["pkgname"]] <- ""
.rnetlogo[["nlversion"]] <- 0
.rnetlogo[["nl3d"]] <- -1

.onLoad <-
function(libname, pkgname)
{
    #if(!require(rJava)) stop("RNetLogo needs rJava")
    .rnetlogo$pkgname <- pkgname 	
    .rnetlogo$libname <- libname
    .rnetlogo$startedGUI <- FALSE
    # moved to NLStart, 2011/08/07
    #options(java.parameters=
      #c(#" -Djava.security.manager",
        #"-server"#,
        #"-Djava.ext.dirs=",
        #"-Xfuture",
        #"-XX:MaxPermSize=128m",
        #"-Xmx1024M",
        #"-Xms16M",
        #"-Duser.language=en",
        #"-Duser.country=US"
      #)
    #)
    #.jinit(parameters=options,silent=FALSE,force.init=TRUE)
    #.jpackage(
    #    pkgname, 
    #    lib.loc = libname,
    #    jars='*'
    #)
    # java error handling
    #if (!is.null(e<-.jgetEx()))
    #{
    #  if (.jcheck(silent=TRUE))
    #  {
    #    print(e)
    #    stop()
    #  }
    #}
}
    