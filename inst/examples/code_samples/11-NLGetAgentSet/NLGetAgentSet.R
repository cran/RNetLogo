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
path.to.local.file <- 'C:/Programme/R/R-2.13.1/library/RNetLogo/examples/code_samples/11-NLGetAgentSet/agentsettest.nlogo'
NLLoadModel(path.to.local.file, nl.obj=nl.test1) 

# submit a single command
NLCommand("setup", nl.obj=nl.test1)

# NLGetAgentSet is very flexible: patches, turtles and links can be requested. In case of patches it's equivalent to NLGetPatches!
# But in general, everything is also possible with complex requests via NLReport!

# get informations of all breeds "myturtles1", always sorted by "who" variable
my.turtles.1 <- NLGetAgentSet(c("who","xcor","ycor","color"), "myturtles1", nl.obj=nl.test1)
print(my.turtles.1)

# same as before but as data.frame
my.turtles.1.df <- NLGetAgentSet(c("who","xcor","ycor","color"), "myturtles1", as.data.frame=TRUE, df.col.names=c("id","x","y","color"), nl.obj=nl.test1)
print(my.turtles.1.df)

# get informations from a subset of "myturtles1" with xcor < 3
subset.my.turtles.1 <- NLGetAgentSet(c("who","xcor","ycor","color"), "myturtles1 with [xcor < 3]", nl.obj=nl.test1)
print(subset.my.turtles.1)

# equivalent to (but unsorted, in random order):
subset.my.turtles.1.report <- NLReport("[(list who xcor ycor color)] of myturtles1 with [xcor < 3]", nl.obj=nl.test1)
print(subset.my.turtles.1.report)

# and exacly equivalent to (with same order):
subset.orderd.myturtles.1.report <- NLReport("map [[(list who xcor ycor color)] of ?] sort myturtles1 with [xcor < 3]", nl.obj=nl.test1)
print(subset.orderd.myturtles.1.report)


# get "who" of the ends of links
links <- NLGetAgentSet(c("[who] of end1","[who] of end2"), "links", nl.obj=nl.test1)
print(links)


# get all patches which has a exactly one of breed "myturtles2" on it, always sorted from upper left to lower right
patchset <- NLGetAgentSet(c("pxcor","pycor","plabel","one-of [who] of myturtles2-here"), "patches with [count myturtles2-here = 1]", as.data.frame=TRUE, df.col.names=c("x","y","label","who"), nl.obj=nl.test1)
print(patchset)

# equivalent to (but unsorted):
patchset.report <- NLReport("[(list pxcor pycor plabel one-of [who] of myturtles2-here)] of patches with [count myturtles2-here = 1]", nl.obj=nl.test1)
print(patchset.report)

 # equivalent to (sorted):
patchset.sorted.report <- NLReport("map [[(list pxcor pycor plabel (one-of [who] of myturtles2-here))] of ?] sort patches with [count myturtles2-here = 1]", nl.obj=nl.test1)
print(patchset.sorted.report)


# use NLQuit(nl.obj=nl.test1) to close the NetLogo Window
