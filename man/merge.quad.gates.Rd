% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/merge.quad.gates.R
\name{merge.quad.gates}
\alias{merge.quad.gates}
\title{extend the original flowWorkspace:::.mergeGates function to restore quadGate when applicable}
\usage{
\method{merge}{quad.gates}(gh, pops, bool = TRUE)
}
\arguments{
\item{gh}{a GatingHierarchy}

\item{pops}{a vector of population names}

\item{bool}{whether to deal with boolean gate}
}
\value{
a nested list of data structure that captures the information of parent, grouped populations (with the same projections)
and the reconstructed quadGate object and the respective quadrant pattern
}
\description{
For internal usage.
}
\examples{
library(flowWorkspace)
dataDir <- system.file("extdata",package="flowWorkspaceData")
gs <- load_gs(file.path(dataDir, "gs_manual"))
#get the GatingHierarchy object
gh <- gs[[1]]
pops <- getChildren(gh, "CD4")
grps  <- ggcyto:::merge.quad.gates(gh, pops)
length(grps) # pops are grouped into two
grps[[1]] # each group is annotaed with quadGate information

ggcyto:::merge.quad.gates(gh, getChildren(gh, "CD3+")) # cd3 subsets are not coercible to quadgate thus return as they are
}
