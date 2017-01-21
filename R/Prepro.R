Prepro <-
function(nl.path, jarname)
{
  # save current R working directory
  workingdir <- c(getwd())
  # change R working directory
  setwd(nl.path)
	preobj <- .jnew("nlcon/Preprocess")
	# return value: (system wide) user working directory
	userworkingdir <- .jcall(preobj, "S", "cpsettings", .jnew("java/lang/String", nl.path), .jnew("java/lang/String", jarname))
  workingdir <- append(workingdir, userworkingdir)
  return (workingdir)
}
