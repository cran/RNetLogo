NLStart <-
function(nl.path, gui=TRUE, obj.name=NULL, nl.version=5, is3d=FALSE)
{
    # get RNetLogo jar corresponding to NetLogo version
    localjar <- 'RNetLogov4.jar'
    if (nl.version==5)
    {
      localjar <- 'RNetLogov5.jar'
    }
    else if (nl.version==40)
    {
      localjar <- 'RNetLogov40.jar'
    }  
    
    # check for 3D/2D session
    if (.rnetlogo$nl3d == -1)
    {
        .rnetlogo$nl3d <- is3d
    }    
    else
    {
      if (.rnetlogo$nl3d != is3d)
        stop("You can't use 2D and 3D NetLogo in one R session.")
    }
    
    # NetLogo version check
    if (.rnetlogo$nlversion == 0)
    {
        .rnetlogo$nlversion <- nl.version
        # load the RNetLogo jar
        .jpackage(
            .rnetlogo$pkgname,
            lib.loc = .rnetlogo$libname,
            jars=localjar
        ) 
    }    
    else
    {
      if (.rnetlogo$nlversion != nl.version)
        stop("You can't use different NetLogo version in one R session.")
    }   

  if (is.null(obj.name)) obj.name <- "nl.intern"
        
  if (!is.character(obj.name)) stop("2nd argument has to be a character.")
  if (obj.name %in% .rnetlogo$objectnames) stop("name of object to store the NetLogo instance
  was already used in this R session. 
  Please restart R or choose another name.")
  
  if ((gui) && (.rnetlogo$startedGUI)) stop("RNetLogo was already started with GUI. 
  It isn't possible to start it again in this R session.")
     
  .rnetlogo$savedworkingdir <- Prepro(nl.path)

  # use the connection for NetLogo version 4.x or 5.x
  if (nl.version == 4)
  {
    nlo <- tryCatch(
  			.jnew("nlcon/NLink_v4",.jnew("java/lang/Boolean",gui),.jnew("java/lang/Boolean",is3d),.jnew("java/lang/String",.rnetlogo$savedworkingdir[2])),
  			error = function(e) {
  				e$printStackTrace()
        }
  	)
	}
	else if (nl.version == 40)
  {
      nlo <- tryCatch(
    			.jnew("nlcon/NLink_v40",.jnew("java/lang/Boolean",gui),.jnew("java/lang/Boolean",is3d),.jnew("java/lang/String",.rnetlogo$savedworkingdir[2])),
    			error = function(e) {
    				e$printStackTrace()
          }
    	)	
  } 
	else if (nl.version == 5)
  {
      nlo <- tryCatch(
    			.jnew("nlcon/NLink_v5",.jnew("java/lang/Boolean",gui),.jnew("java/lang/Boolean",is3d),.jnew("java/lang/String",.rnetlogo$savedworkingdir[2])),
    			error = function(e) {
    				e$printStackTrace()
          }
    	)	
  } 
  else 
  {
    print("NetLogo version number unknown. Supported versions are 4 and 5.")
    stop()
  }
	
	if (obj.name == "nl.intern")
	{
	 .rnetlogo[["nl.intern"]] <- nlo 
	}
	else
	{
 	  assign(obj.name, nlo, pos=".GlobalEnv")
	}
	
  if (gui) .rnetlogo$startedGUI <- TRUE
  .rnetlogo$objectnames <- append(.rnetlogo$objectnames, obj.name)
  
  # java error handling
  if (!is.null(e<-.jgetEx()))
  {
    if (.jcheck(silent=TRUE))
    {
      print(e)
      stop()
    }
  }
}

