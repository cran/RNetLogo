library(RNetLogo)

# PLEASE FILL IN THE PATH TO YOUR NetLogo INSTALLATION FOLDER !!!!
path.to.NetLogo <- "C:/Program Files/NetLogo 5.0"

if (!exists("nl.test1", -1)) 
{
  NLStart(path.to.NetLogo, gui=TRUE, nl.version=5, obj.name="nl.test1")
}

model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(path.to.NetLogo,model.path,sep=""),nl.obj=nl.test1)


# use NLQuit(nl.obj=nl.test1) to close the NetLogo Window
