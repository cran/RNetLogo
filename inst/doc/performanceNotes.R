### R code from vignette source 'performanceNotes.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)
# ToDo: adapt this path
#base.path <- "C:/Users/jthiele/own_packages/rnetlogo/pkg/RNetLogo/vignettes/"
base.path <- ""


###################################################
### code chunk number 2: test_data_092_A (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 5.0"
## NLStart(nl.path, nl.version=5, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## NLCommand("set number 10")
## NLCommand("setup")
## 
## test_t1 <- NLGetAgentSet("who", "turtles", as.data.frame=T, df.col.names=c("who"))
## test_t2 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=T, df.col.names=c("who", "xcor", "ycor"))
## 
## test_t5 <- NLGetAgentSet("who", "turtles", as.data.frame=F)
## test_t6 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F)
##   
## #NLQuit()


###################################################
### code chunk number 3: test_data_092_B (eval = FALSE)
###################################################
## save.image(file=paste(base.path, "testdata_RNetLogo092.RData", sep=""))


###################################################
### code chunk number 4: list_example_RN092_A
###################################################
load(paste(base.path, "testdata_RNetLogo092.RData", sep=""))


###################################################
### code chunk number 5: list_example_RN092_B (eval = FALSE)
###################################################
## #RNetLogo version:
## print(vers)
## 
## nl.path <- "C:/Program Files/NetLogo 5.0"
## NLStart(nl.path, nl.version=5, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## NLCommand("set number 10")
## NLCommand("setup")


###################################################
### code chunk number 6: list_example_RN092_vers
###################################################
#RNetLogo version:
print(vers)


###################################################
### code chunk number 7: list_example_RN092_C (eval = FALSE)
###################################################
## # for only one agent variable it's just a vector
## test_t5 <- NLGetAgentSet("who", "turtles", as.data.frame=F)


###################################################
### code chunk number 8: list_example_RN092_D
###################################################
str(test_t5)
is.list(test_t5)


###################################################
### code chunk number 9: list_example_RN092_E (eval = FALSE)
###################################################
## # for more than one agent variable it's a list
## # with one list element for each agent and a 
## # vector in each list element containing
## # the values of the requested agents variables
## test_t6 <- NLGetAgentSet(c("who", "xcor", "ycor"), 
##                          "turtles", as.data.frame=F)


###################################################
### code chunk number 10: list_example_RN092_F
###################################################
str(test_t6)
is.list(test_t6)


###################################################
### code chunk number 11: df_example_RN092_A (eval = FALSE)
###################################################
## # for only one agent variable its just a vector
## test_t1 <- NLGetAgentSet("who", "turtles", as.data.frame=T, 
##                          df.col.names=c("who"))


###################################################
### code chunk number 12: df_example_RN092_B
###################################################
str(test_t1)
is.data.frame(test_t1)


###################################################
### code chunk number 13: df_example_RN092_C (eval = FALSE)
###################################################
## # for more than one agent variable it's a data.frame
## # with agent variables in columns and 
## # one row for each agent
## test_t2 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", 
##                          as.data.frame=T, df.col.names=c("who",
##                          "xcor", "ycor"))


###################################################
### code chunk number 14: df_example_RN092_D
###################################################
str(test_t2)
is.data.frame(test_t2)


###################################################
### code chunk number 15: test_data_093_A (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 5.0"
## NLStart(nl.path, nl.version=5, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## NLCommand("set number 10")
## NLCommand("setup")
## 
## test_t1 <- NLGetAgentSet("who", "turtles")
## test_t2 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles")
##  
## test_t3 <- NLGetAgentSet("who", "turtles", as.data.frame=F)
## test_t4 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F)
##            
## test_t5 <- NLGetAgentSet("who", "turtles", as.data.frame=F, agents.by.row=T)
## test_t6 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F, agents.by.row=T)
## 
## test_t7 <- NLGetAgentSet("who", "turtles", as.vector=T)
## 
## save.image(file=paste(base.path, "testdata_RNetLogo093.RData", sep=""))
## 
## #NLQuit()


###################################################
### code chunk number 16: list_example_RN093_A
###################################################
load(paste(base.path, "testdata_RNetLogo093.RData", sep=""))


###################################################
### code chunk number 17: list_example_RN093_B (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 5.0"
## NLStart(nl.path, nl.version=5, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## NLCommand("set number 10")
## NLCommand("setup")


###################################################
### code chunk number 18: list_example_RN093_vers
###################################################
#RNetLogo version:
print(vers)


###################################################
### code chunk number 19: list_example_RN093_C (eval = FALSE)
###################################################
## # the equivalent to the RNetLogo 0.9.2 default:
## # the list variant for only one agent variable 
## # (but now as list not as vector)
## test_t5 <- NLGetAgentSet("who", "turtles", as.data.frame=F, agents.by.row=T)


###################################################
### code chunk number 20: list_example_RN093_D
###################################################
str(test_t5)
is.list(test_t5)


###################################################
### code chunk number 21: list_example_RN093_E (eval = FALSE)
###################################################
## # for more than one agent variable 
## test_t6 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", 
##                          as.data.frame=F, agents.by.row=T)


###################################################
### code chunk number 22: list_example_RN093_F
###################################################
str(test_t6)
is.list(test_t6)


###################################################
### code chunk number 23: df_example_RN093_A (eval = FALSE)
###################################################
## # now the new default: the data.frame
## # it's a data.frame independent from 
## # the number of agent variables requested 
## test_t1 <- NLGetAgentSet("who", "turtles")


###################################################
### code chunk number 24: df_example_RN093_B
###################################################
str(test_t1)
is.data.frame(test_t1)


###################################################
### code chunk number 25: df_example_RN093_C (eval = FALSE)
###################################################
## # with three agent variables:
## test_t2 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles")


###################################################
### code chunk number 26: df_example_RN093_D
###################################################
str(test_t2)
is.data.frame(test_t2)


###################################################
### code chunk number 27: newlist_example_RN093_A (eval = FALSE)
###################################################
## # Next, the new list style (similar to the data.frame):
## test_t3 <- NLGetAgentSet("who", "turtles", as.data.frame=F)


###################################################
### code chunk number 28: newlist_example_RN093_B
###################################################
str(test_t3)
is.list(test_t3)


###################################################
### code chunk number 29: newlist_example_RN093_C (eval = FALSE)
###################################################
## # for three agent variables:
## test_t4 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F)


###################################################
### code chunk number 30: newlist_example_RN093_D
###################################################
str(test_t4)
is.list(test_t4)


###################################################
### code chunk number 31: vector_example_RN093_A (eval = FALSE)
###################################################
## # the old data structure for one agent variable 
## # (a simple vector):
## test_t7 <- NLGetAgentSet("who", "turtles", as.vector=T)


###################################################
### code chunk number 32: vector_example_RN093_B
###################################################
str(test_t7)
is.list(test_t7)
is.vector(test_t7)


###################################################
### code chunk number 33: data_recording_092_413 (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 4.1.3"
## NLStart(nl.path, nl.version=4, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## 
## f_GetAgentSet <- function(x) {
##   NLCommand(paste("set number ",x,sep=""))
##   NLCommand("setup")
##             
##   t1 <- system.time(df_a_1 <- NLGetAgentSet("who", "turtles",as.data.frame=T,
##                                             df.col.names=c("who"))
##                     )[["user.self"]]
##   t2 <- system.time(df_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), 
##                                             "turtles", as.data.frame=T, 
##                                             df.col.names=c("who", "xcor", "ycor"))
##                     )[["user.self"]]
##     
##   t5 <- system.time(li2_a_1 <- NLGetAgentSet("who", "turtles", 
##                                              as.data.frame=F)
##                     )[["user.self"]]
##   t6 <- system.time(li2_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), 
##                                              "turtles", as.data.frame=F)
##                     )[["user.self"]]
##   return(data.frame(t1,t2,t5,t6))
## }
## 
## it <- c(100,200,400,800,1600,3200,6400,12800,25600,51200,102400,204800,409600)
## times_092_NL413 <- lapply(it, function(x) {f_GetAgentSet(x)})
## #NLQuit()


###################################################
### code chunk number 34: data_recording_092_413_save (eval = FALSE)
###################################################
## save.image(file=paste(base.path, "NL413_RNetLogo092.RData", sep=""))


###################################################
### code chunk number 35: load_data_recording_092_413
###################################################
load(paste(base.path, "NL413_RNetLogo092.RData", sep=""))


###################################################
### code chunk number 36: plot_data_recording_092_413_t5
###################################################
par.default <- par(no.readonly = TRUE)
par(mfrow = c(1, 2), mar = c(1, 1, 1, 1), cex = 1.3)
par(mar = c(3.5, 3.5, 0.5, 0.5))
par(xpd = T)
plot(it,sapply(times_092_NL413, function(x) x$t5), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_092_NL413, function(x) x$t6), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
par(par.default)


###################################################
### code chunk number 37: plot_data_recording_092_413_t1
###################################################
par.default <- par(no.readonly = TRUE)
par(mfrow = c(1, 2), mar = c(1, 1, 1, 1), cex = 1.3)
par(mar = c(3.5, 3.5, 0.5, 0.5))
par(xpd = T)
plot(it,sapply(times_092_NL413, function(x) x$t1), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_092_NL413, function(x) x$t2), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
par(par.default)


###################################################
### code chunk number 38: load_data_recording_092_50
###################################################
load(paste(base.path, "NL50_RNetLogo092.RData", sep=""))


###################################################
### code chunk number 39: plot_data_recording_092_50_t5
###################################################
par.default <- par(no.readonly = TRUE)
par(mfrow = c(1, 2), mar = c(1, 1, 1, 1), cex = 1.3)
par(mar = c(3.5, 3.5, 0.5, 0.5))
par(xpd = T)
plot(it,sapply(times_092_NL5, function(x) x$t5), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_092_NL5, function(x) x$t6), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
par(par.default)


###################################################
### code chunk number 40: plot_data_recording_092_50_t1
###################################################
par.default <- par(no.readonly = TRUE)
par(mfrow = c(1, 2), mar = c(1, 1, 1, 1), cex = 1.3)
par(mar = c(3.5, 3.5, 0.5, 0.5))
par(xpd = T)
plot(it,sapply(times_092_NL5, function(x) x$t1), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_092_NL5, function(x) x$t2), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
par(par.default)


###################################################
### code chunk number 41: data_recording_093_50_A (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 5.0"
## NLStart(nl.path, nl.version=5, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## 
## f_GetAgentSet <- function(x) {
##   NLCommand(paste("set number ",x,sep=""))
##   NLCommand("setup")
##             
##   t1 <- system.time(df_a_1 <- NLGetAgentSet("who", "turtles")
##                     )[["user.self"]]
##   t2 <- system.time(df_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"),
##                                             "turtles")
##                     )[["user.self"]]
##   
##   t3 <- system.time(li_a_1 <- NLGetAgentSet("who", "turtles",
##                                             as.data.frame=F)
##                     )[["user.self"]]
##   t4 <- system.time(li_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles",
##                                             as.data.frame=F)
##                     )[["user.self"]]
##   
##   t5 <- system.time(li2_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F,
##                                              agents.by.row=T)
##                     )[["user.self"]]
##   t6 <- system.time(li2_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles",
##                                              as.data.frame=F, 
##                                              agents.by.row=T)
##                     )[["user.self"]]
## 
##   t7 <- system.time(ve_a_1 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles",
##                                              as.vector=T)
##                     )[["user.self"]]
##   return(data.frame(t1,t2,t3,t4,t5,t6,t7))
## }
## 
## it <- c(100,200,400,800,1600,3200,6400,12800,25600,51200,102400,204800,409600)
## times_093_NL5 <- lapply(it, function(x) {f_GetAgentSet(x)})
## 
## #NLQuit()


###################################################
### code chunk number 42: load_data_recording_093_50
###################################################
load(paste(base.path, "NL50_RNetLogo093.RData", sep=""))


###################################################
### code chunk number 43: plot_data_recording_093_50_1av
###################################################
par.default <- par(no.readonly = TRUE)
par(mfrow = c(1, 4), mar = c(1, 1, 1, 1), cex = 1.3)
par(mar = c(3.5, 3.5, 0.5, 0.5))
par(xpd = T)
plot(it,sapply(times_093_NL5, function(x) x$t7), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_093_NL5, function(x) x$t5), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_093_NL5, function(x) x$t1), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_093_NL5, function(x) x$t3), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
par(par.default)


###################################################
### code chunk number 44: plot_data_recording_093_50_3av
###################################################
par.default <- par(no.readonly = TRUE)
par(mfrow = c(1, 3), mar = c(1, 1, 1, 1), cex = 1.3)
par(mar = c(3.5, 3.5, 0.5, 0.5))
par(xpd = T)
plot(it,sapply(times_093_NL5, function(x) x$t6), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_093_NL5, function(x) x$t2), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_093_NL5, function(x) x$t4), ylab="", xlab="", type="o")
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
par(par.default)


###################################################
### code chunk number 45: load_data_recording_093_405
###################################################
load(paste(base.path, "NL405_RNetLogo093.RData", sep=""))
load(paste(base.path, "NL413_RNetLogo093.RData", sep=""))
load(paste(base.path, "NL50_RNetLogo093.RData", sep=""))


###################################################
### code chunk number 46: plot_data_recording_093_405_1av
###################################################
par.default <- par(no.readonly = TRUE)
par(mfrow = c(1, 3), mar = c(1, 1, 1, 1), cex = 1.3)
par(mar = c(3.5, 3.5, 0.5, 0.5))
par(xpd = T)
plot(it,sapply(times_093_NL413, function(x) x$t5), ylab="", xlab="", type="o", pch=1)
lines(it,sapply(times_093_NL405, function(x) x$t5), type="o", pch=2)
lines(it,sapply(times_093_NL5, function(x) x$t5), type="o", pch=3)
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_093_NL413, function(x) x$t1), ylab="", xlab="", type="o", pch=1)
lines(it,sapply(times_093_NL405, function(x) x$t1), type="o", pch=2)
lines(it,sapply(times_093_NL5, function(x) x$t1), type="o", pch=3)
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_093_NL413, function(x) x$t3), ylab="", xlab="", type="o", pch=1)
lines(it,sapply(times_093_NL405, function(x) x$t3), ylab="", xlab="", type="o", pch=2)
lines(it,sapply(times_093_NL5, function(x) x$t3), ylab="", xlab="", type="o", pch=3)
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
par(par.default)


###################################################
### code chunk number 47: plot_data_recording_093_405_3av
###################################################
par.default <- par(no.readonly = TRUE)
par(mfrow = c(1, 3), mar = c(1, 1, 1, 1), cex = 1.3)
par(mar = c(3.5, 3.5, 0.5, 0.5))
par(xpd = T)
plot(it,sapply(times_093_NL413, function(x) x$t6), ylab="", xlab="", type="o", pch=1)
lines(it,sapply(times_093_NL405, function(x) x$t6), type="o", pch=2)
lines(it,sapply(times_093_NL5, function(x) x$t6), type="o", pch=3)
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_093_NL413, function(x) x$t2), ylab="", xlab="", type="o", pch=1)
lines(it,sapply(times_093_NL405, function(x) x$t2), type="o", pch=2)
lines(it,sapply(times_093_NL5, function(x) x$t2), type="o", pch=3)
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
plot(it,sapply(times_093_NL413, function(x) x$t4), ylab="", xlab="", type="o", pch=1)
lines(it,sapply(times_093_NL405, function(x) x$t4), ylab="", xlab="", type="o", pch=2)
lines(it,sapply(times_093_NL5, function(x) x$t4), ylab="", xlab="", type="o", pch=3)
title(ylab = "time [sec.]", mgp = c(2.2, 0, 0))
title(xlab = "no. turtles", mgp= c(2.2, 0, 0)) 
par(par.default)


###################################################
### code chunk number 48: data_recording_093_50_A (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 5.0"
## NLStart(nl.path, nl.version=5, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## 
## f_GetAgentSet <- function(x) {
##   NLCommand(paste("set number ",x,sep=""))
##   NLCommand("setup")
##             
##   t1 <- system.time(df_a_1 <- NLGetAgentSet("who", "turtles"))[["user.self"]]
##   t2 <- system.time(df_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles"))[["user.self"]]
##   
##   t3 <- system.time(li_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F))[["user.self"]]
##   t4 <- system.time(li_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F))[["user.self"]]
##   
##   t5 <- system.time(li2_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F, agents.by.row=T))[["user.self"]]
##   t6 <- system.time(li2_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F, agents.by.row=T))[["user.self"]]
##   
##   t7 <- system.time(ve_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F, agents.by.row=F, as.vector=T))[["user.self"]]
##   
##   return(data.frame(t1,t2,t3,t4,t5,t6,t7))
## }
## 
## it <- c(100,200,400,800,1600,3200,6400,12800,25600,51200,102400,204800,409600)
## times_093_NL5 <- lapply(it, function(x) {f_GetAgentSet(x)})
## 
## NLQuit()


###################################################
### code chunk number 49: data_recording_093_50_B (eval = FALSE)
###################################################
## save.image(file=paste(base.path, "NL50_RNetLogo093.RData", sep=""))


###################################################
### code chunk number 50: data_recording_093_413 (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 4.1.3"
## NLStart(nl.path, nl.version=4, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## 
## f_GetAgentSet <- function(x) {
##   NLCommand(paste("set number ",x,sep=""))
##   NLCommand("setup")
##   t1 <- system.time(df_a_1 <- NLGetAgentSet("who", "turtles"))[["user.self"]]
##   t2 <- system.time(df_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles"))[["user.self"]]
##   
##   t3 <- system.time(li_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F))[["user.self"]]
##   t4 <- system.time(li_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F))[["user.self"]]
##   
##   t5 <- system.time(li2_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F, agents.by.row=T))[["user.self"]]
##   t6 <- system.time(li2_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F, agents.by.row=T))[["user.self"]]
##   return(data.frame(t1,t2,t3,t4,t5,t6))
## }
## 
## it <- c(100,200,400,800,1600,3200,6400,12800,25600,51200,102400,204800,409600)
## times_093_NL413 <- lapply(it, function(x) {f_GetAgentSet(x)})
## save.image(file=paste(base.path, "NL413_RNetLogo093.RData", sep=""))
## 
## #NLQuit()


###################################################
### code chunk number 51: data_recording_093_405 (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 4.0.5"
## NLStart(nl.path, nl.version=40, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## 
## f_GetAgentSet <- function(x) {
##   NLCommand(paste("set number ",x,sep=""))
##   NLCommand("setup")
##   t1 <- system.time(df_a_1 <- NLGetAgentSet("who", "turtles"))[["user.self"]]
##   t2 <- system.time(df_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles"))[["user.self"]]
##   
##   t3 <- system.time(li_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F))[["user.self"]]
##   t4 <- system.time(li_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F))[["user.self"]]
##   
##   t5 <- system.time(li2_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F, agents.by.row=T))[["user.self"]]
##   t6 <- system.time(li2_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F, agents.by.row=T))[["user.self"]]
##   return(data.frame(t1,t2,t3,t4,t5,t6))
## }
## 
## it <- c(100,200,400,800,1600,3200,6400,12800,25600,51200,102400,204800,409600)
## times_093_NL405 <- lapply(it, function(x) {f_GetAgentSet(x)})
## save.image(file=paste(base.path, "NL405_RNetLogo093.RData", sep=""))
## 
## #NLQuit()


###################################################
### code chunk number 52: data_recording_092_50 (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 5.0"
## NLStart(nl.path, nl.version=5, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## 
## f_GetAgentSet <- function(x) {
##   NLCommand(paste("set number ",x,sep=""))
##   NLCommand("setup")
##             
##   t1 <- system.time(df_a_1 <- NLGetAgentSet("who", "turtles",as.data.frame=T,df.col.names=c("who")))[["user.self"]]
##   t2 <- system.time(df_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=T, df.col.names=c("who", "xcor", "ycor")))[["user.self"]]
##   
##   t5 <- system.time(li2_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F))[["user.self"]]
##   t6 <- system.time(li2_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F))[["user.self"]]
##   return(data.frame(t1,t2,t5,t6))
## }
## 
## it <- c(100,200,400,800,1600,3200,6400,12800,25600,51200,102400,204800,409600)
## times_092_NL5 <- lapply(it, function(x) {f_GetAgentSet(x)})
## save.image(file=paste(base.path, "NL50_RNetLogo092.RData", sep=""))
## 
## #NLQuit()


###################################################
### code chunk number 53: data_recording_092_413 (eval = FALSE)
###################################################
## library(RNetLogo)
## vers <- (packageDescription("RNetLogo")["Version"])
## 
## nl.path <- "C:/Program Files/NetLogo 4.1.3"
## NLStart(nl.path, nl.version=4, gui=F)
## model.path <- "/models/Sample Models/Biology/Fireflies.nlogo"
## NLLoadModel(paste(nl.path, model.path, sep=""))
## 
## f_GetAgentSet <- function(x) {
##   NLCommand(paste("set number ",x,sep=""))
##   NLCommand("setup")
##             
##   t1 <- system.time(df_a_1 <- NLGetAgentSet("who", "turtles",as.data.frame=T,df.col.names=c("who")))[["user.self"]]
##   t2 <- system.time(df_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=T, df.col.names=c("who", "xcor", "ycor")))[["user.self"]]
##     
##   t5 <- system.time(li2_a_1 <- NLGetAgentSet("who", "turtles", as.data.frame=F))[["user.self"]]
##   t6 <- system.time(li2_a_3 <- NLGetAgentSet(c("who", "xcor", "ycor"), "turtles", as.data.frame=F))[["user.self"]]
##   return(data.frame(t1,t2,t5,t6))
## }
## 
## it <- c(100,200,400,800,1600,3200,6400,12800,25600,51200,102400,204800,409600)
## times_092_NL413 <- lapply(it, function(x) {f_GetAgentSet(x)})
## save.image(file=paste(base.path, "NL413_RNetLogo092.RData", sep=""))
## 
## #NLQuit()


###################################################
### code chunk number 54: all_together (eval = FALSE)
###################################################
## load(file=paste(base.path, "NL50_RNetLogo093.RData", sep=""))
## load(file=paste(base.path, "NL413_RNetLogo093.RData", sep=""))
## load(file=paste(base.path, "NL405_RNetLogo093.RData", sep=""))
## 
## load(file=paste(base.path, "NL50_RNetLogo092.RData", sep=""))
## load(file=paste(base.path, "NL413_RNetLogo092.RData", sep=""))
## 
## t1_RN093_NL5 <- sapply(times_093_NL5, function(x) x$t1)
## t2_RN093_NL5 <- sapply(times_093_NL5, function(x) x$t2)
## t3_RN093_NL5 <- sapply(times_093_NL5, function(x) x$t3)
## t4_RN093_NL5 <- sapply(times_093_NL5, function(x) x$t4)
## t5_RN093_NL5 <- sapply(times_093_NL5, function(x) x$t5)
## t6_RN093_NL5 <- sapply(times_093_NL5, function(x) x$t6)
## 
## t1_RN092_NL5 <- sapply(times_092_NL5, function(x) x$t1)
## t2_RN092_NL5 <- sapply(times_092_NL5, function(x) x$t2)
## t5_RN092_NL5 <- sapply(times_092_NL5, function(x) x$t5)
## t6_RN092_NL5 <- sapply(times_092_NL5, function(x) x$t6)
## 


