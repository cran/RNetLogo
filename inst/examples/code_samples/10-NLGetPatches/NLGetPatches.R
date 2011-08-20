library(RNetLogo)

# path to NetLogo installation folder
# PLEASE FILL IN THE PATH TO YOUR NetLogo INSTALLATION FOLDER !!!!
path.to.NetLogo <- "C:/Program Files/NetLogo 4.1.2"

# start NetLogo, if it is not started yet
if (!exists("nl.test1", -1)) 
{
  NLStart(path.to.NetLogo, gui=TRUE, nl.version=4, obj.name="nl.test1")
}

# load a sample model
# PLEASE FILL IN THE PATH TO THE SAMPLE NetLogo FILE !!!!
path.to.local.file <- 'C:/Programme/R/R-2.13.1/library/RNetLogo/examples/code_samples/10-NLGetPatches/patchtest.nlogo'
NLLoadModel(path.to.local.file, nl.obj=nl.test1)

# submit a single command
NLCommand("setup", nl.obj=nl.test1)

# get the values of all patches (the world) of the variable plabel as vector
# orderd from upper left to bottom right
plabels <- NLGetPatches("plabel", nl.obj=nl.test1)
print(plabels)

# get the same values, but as matrix, looking like the NetLogo world 
# (but maybe with different indices, because R matrix always starting with (1,1) in upper left)
plabels.matrix <- NLGetPatches("plabel", as.matrix=TRUE, nl.obj=nl.test1)
print(plabels.matrix)

# get a subset of patches, e.g. all patches with values of plabel greater than 10 together with the x and y coordinates 
plabels.gt.10 <- NLGetPatches(c("plabel","pxcor", "pycor"), "patches with [plabel > 10]", nl.obj=nl.test1)
print(plabels.gt.10)

# same as before but as data.frame
plabels.gt.10.df <- NLGetPatches(c("plabel","pxcor", "pycor"), "patches with [plabel > 10]", as.data.frame=TRUE, df.col.names=c("label","x","y"), nl.obj=nl.test1)
print(plabels.gt.10.df)


# use NLQuit(nl.obj=nl.test1) to close the NetLogo Window
