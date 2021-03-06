% Generated by roxygen2 (4.0.2): do not edit by hand
\name{batchMap}
\alias{batchMap}
\title{Maps a function over lists or vectors, adding jobs to a registry.}
\usage{
batchMap(reg, fun, ..., more.args = list(), use.names = FALSE)
}
\arguments{
\item{reg}{[\code{\link{Registry}}]\cr
Empty Registry that will store jobs for the mapping.}

\item{fun}{[\code{function}]\cr
Function to map over \code{...}.}

\item{...}{[any]\cr
Arguments to vectorize over (list or vector).}

\item{more.args}{[\code{list}]\cr
A list of other arguments passed to \code{fun}.
Default is empty list.}

\item{use.names}{[\code{logical(1)}]\cr
Store parameter names to enable named results in \code{\link{loadResults}} and some other functions.
Default is \code{FALSE}.}
}
\value{
Vector of type \code{integer} with job ids.
}
\description{
You can then submit these jobs to the batch system.
}
\examples{
reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
f = function(x) x^2
batchMap(reg, f, 1:10)
print(reg)
}

