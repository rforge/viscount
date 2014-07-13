\name{VisCount-package}
\alias{VisCount-package}
\alias{VisCount}
\docType{package}
\title{R package for training and evaluating visual count estimates}
\description{
The VisCount package allows you to train rapid visual estimates of the number of individuals (symbols) in the plotting window, enter your estimates, and get a series of insightful statistics on your performance and how it evolves along different training sessions.
}
\details{
\tabular{ll}{
Package: \tab VisCount\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-07-09\cr
License: \tab GPL-3\cr
}
}
\author{
A. Marcia Barbosa
Maintainer: A. Marcia Barbosa <barbosa@uevora.pt>
}
\references{
}
\keyword{ package }
\seealso{
}
\examples{
# load previous VisCount results:
getSavedResults()

# practise VisCount and enter your estimates as prompted:
VisCount()  # repeat until bored

# if your last estimate was a mistake, remove it from record:
removeTypo()

# check out your performance statistics:
VisCountStats()

# check performance stats for particular sessions:
VisCountStats(c(1, 3:7))

# before quitting R, save results on disk for future use:
saveResults()
}
