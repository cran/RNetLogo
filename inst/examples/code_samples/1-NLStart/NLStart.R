# load the package
library(RNetLogo)

# path to the NetLogo installation folder
# PLEASE FILL IN THE PATH TO YOUR NetLogo INSTALLATION FOLDER !!!!
path.to.NetLogo <- "C:/Program Files/NetLogo 6.0/app"

# start NetLogo using the path to NetLogo
# with GUI (=Graphical User Interface) (default)
# and a reference name nl.obj (default = NULL, internally replaced by _nl.intern_)
# NetLogo with GUI can started only once in an R session. 
# To start it again after closing the window with NLQuit you have to start a new R session.
nl.test1 <- "nl.test1"

# specify name of NetLogo jar file (located in <NetLogo installation path>/app/netlogo-<version>.jar)
nl.jarname <- "netlogo-6.0.0.jar"
NLStart(path.to.NetLogo, gui=TRUE, nl.obj=nl.test1, nl.jarname=nl.jarname)


# use NLQuit(nl.obj=nl.test1) to close the NetLogo Window
