# load the package
library(RNetLogo)

# path to the NetLogo installation folder
# PLEASE FILL IN THE PATH TO YOUR NetLogo INSTALLATION FOLDER !!!!
path.to.NetLogo <- "C:/Program Files/NetLogo 4.1.2"

# start NetLogo using the path to NetLogo
# with GUI (=Graphical User Interface) (default)
# and the intern managed object instance variable (default = nl.intern)
# NetLogo with GUI can started only once in an R session. 
# To start it again after closing the window with NLQuit you have to start a new R session. 
NLStart(path.to.NetLogo, gui=TRUE, nl.version=4, obj.name="nl.test1")


# use NLQuit(nl.obj=nl.test1) to close the NetLogo Window
