# load the package
library(RNetLogo)

# path to the NetLogo installation folder
# PLEASE FILL IN THE PATH TO YOUR NetLogo INSTALLATION FOLDER !!!!
path.to.NetLogo <- "C:/Program Files/NetLogo 5.0.5"

# start NetLogo using the path to NetLogo
# with GUI (=Graphical User Interface) (default)
# and a reference name nl.obj (default = NULL, internally replaced by _nl.intern_)
# NetLogo with GUI can started only once in an R session. 
# To start it again after closing the window with NLQuit you have to start a new R session.
# For NetLogo 4.1.x use nl.version=4
# For NetLogo 4.0.x use nl.version=40
# I recommand to use NetLogo 5.0 (nl.version=5 is the default and can be skipped), 
# because it is extremly faster in data transformation than NetLogo 4.x! 
nl.test1 <- "nl.test1"
NLStart(path.to.NetLogo, gui=TRUE, nl.obj=nl.test1, nl.version=5)


# use NLQuit(nl.obj=nl.test1) to close the NetLogo Window
