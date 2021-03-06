% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scales_flowCore_fasinh.R
\name{flowCore_asinht_trans}
\alias{flowCore_asinht_trans}
\title{Inverse hyperbolic sine transformation(flowCore version).}
\usage{
flowCore_asinht_trans(..., n = 6, equal.space = FALSE)
}
\arguments{
\item{...}{parameters passed to arcsinhTransform}

\item{n}{desired number of breaks (the actual number will be different depending on the data range)}

\item{equal.space}{whether breaks at equal-spaced intervals}
}
\value{
asinht transformation object
}
\description{
Used to construct inverse hyperbolic sine transform object.
}
\examples{
trans.obj <- flowCore_asinht_trans(equal.space = TRUE)
data <- 1:1e3
brks.func <- trans.obj[["breaks"]]
brks <- brks.func(data)
brks # fasinh space displayed at raw data scale

#transform it to verify it is equal-spaced at transformed scale
trans.func <- trans.obj[["transform"]]
brks.trans <- trans.func(brks)
brks.trans
}
