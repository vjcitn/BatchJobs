library(BatchJobs)
source("helpers.R")

conf = BatchJobs:::getBatchJobsConf()
conf$mail.start = conf$mail.done = conf$mail.error = "none"

conf$cluster.functions = makeClusterFunctionsInteractive()
doExternalTest(whitespace=FALSE)

conf$cluster.functions = makeClusterFunctionsLocal()
doExternalTest(whitespace=FALSE)

conf$cluster.functions = makeClusterFunctionsMulticore()
doExternalTest(whitespace=FALSE)
doKillTest()

conf$cluster.functions = makeClusterFunctionsSSH(
  makeSSHWorker("lang"))
doExternalTest(whitespace=FALSE)
doKillTest()

conf$cluster.functions = makeClusterFunctionsSSH(
  makeSSHWorker("lang", ncpus=4, max.load=4, max.jobs=2))
doExternalTest(whitespace=FALSE)
doKillTest()

conf$cluster.functions = makeClusterFunctionsSSH(
  makeSSHWorker("lang", ncpus=1), 
  makeSSHWorker("rao", rhome="/opt/R/R-current"))
reg = doExternalTest(dir = "/home/lang/store", whitespace=FALSE)
doKillTest(dir = "/home/lang/store/")
