% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/off_spec.R
\name{off_spec}
\alias{off_spec}
\title{Calculate percentage of out of specification for Statistical Process Control}
\usage{
off_spec(UCL, LCL, mean, sd)
}
\arguments{
\item{UCL}{the process upper control limit}

\item{LCL}{the process lower control limit}

\item{mean}{the process mean}

\item{sd}{the process standard deviation}
}
\value{
This function returns an object of class numeric
}
\description{
This function takes process variables and calculates the probability that
parts are produced out of specification on the long run.
}
\examples{
off_spec(100, 0, 10, 3)
}
\references{
For a complete case study application refer to \url{https://j-ramalho.github.io/industRial/}
}
