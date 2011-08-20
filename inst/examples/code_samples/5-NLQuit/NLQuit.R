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
model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(path.to.NetLogo,model.path,sep=""),nl.obj=nl.test1)

# quit NetLogo
# if it is a NetLogo instance with GUI, it can't be started again in the same R session. 
# You have to restart the R session to start NetLogo with GUI again.
NLQuit(nl.obj=nl.test1)






