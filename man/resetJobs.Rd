% Generated by roxygen2 (4.0.2): do not edit by hand
\name{resetJobs}
\alias{resetJobs}
\title{Reset computational state of jobs.}
\usage{
resetJobs(reg, ids, force = FALSE)
}
\arguments{
\item{reg}{[\code{\link{Registry}}]\cr
Registry.}

\item{ids}{[\code{integer}]\cr
Ids of jobs to kill.
Default is none.}

\item{force}{[\code{logical(1)}]\cr
Reset jobs without checking whether they are currently running.
READ THE DETAILS SECTION!
Default is \code{FALSE}.}
}
\value{
Vector of reseted job ids.
}
\description{
Reset state of jobs in the database. Useful under two circumstances:
Either to re-submit them because of changes in e.g. external
data or to resolve rare issues when jobs are killed in an unfortunate state
and therefore blocking your registry.

The function internally lists all jobs on the batch system and
if those include some of the jobs you want to reset, it informs you to kill them first by raising
an exception.
If you really know what you are doing, you may set \code{force} to \code{TRUE} to omit this sanity check.
Note that this is a dangerous operation to perform which may harm
the database integrity. In this case you HAVE to make externally sure that none of the jobs
you want to reset are still running.
}
\seealso{
Other debug: \code{\link{debugMulticore}};
  \code{\link{debugSSH}}; \code{\link{getErrorMessages}};
  \code{\link{getJobInfo}}; \code{\link{getLogFiles}};
  \code{\link{grepLogs}}; \code{\link{killJobs}};
  \code{\link{setJobFunction}}; \code{\link{showLog}};
  \code{\link{testJob}}
}

