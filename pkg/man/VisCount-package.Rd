\name{VisCount-package}
\alias{VisCount-package}
\alias{VisCount}
\docType{package}
\title{R package for training and evaluating visual count estimates}
\description{
The VisCount package allows you to train rapid visual estimates of the number of 
individuals (symbols) in the plotting window, enter your estimates, and get a 
series of insightful statistics on your performance and how it evolves along 
different training sessions. It can also be a practical and economical tool for 
the training and calibration of field teams collecting information on the sizes 
of flocks or populations.
}
\details{
\tabular{ll}{
Package: \tab VisCount\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2014-10-13\cr
License: \tab GPL-3\cr
}
}
\author{
A. Marcia Barbosa
Maintainer: A. Marcia Barbosa <barbosa@uevora.pt>
}
\references{
Barbosa A.M. (submitted) VisCount: a free software tool to train and evaluate 
visual count estimates.
}
\keyword{ package }
\seealso{
}
\examples{
# load previous VisCount results
# (if you've used VisCount before on this computer):

getSavedResults()


# practise VisCount and enter your estimates as prompted:

VisCount()  # repeat until bored


# practise also with different shapes, sizes, colours and backgrounds:

VisCount(shape = "^", bg = "white")
VisCount(shape = "~", size = 1.3)
VisCount(shape = "x", size = 2, col = "brown")
VisCount(shape = "Y", bg = "wheat")


# practise with different number limits
# (you can combine with any of the arguments above):

VisCount(Nmax = 500, Nmin = 100)


# you can also use animal and/or background pictures in PNG format
# (you need to have the png R package installed for this);
# here are some examples with downloaded public domain images:

download.file(url = "http://viscount.r-forge.r-project.org/flamingo_flying.png", destfile = "flamingo_flying.png")
download.file(url = "http://viscount.r-forge.r-project.org/clouds.png", destfile = "clouds.png")
VisCount(shape = "flamingo_flying.png", size = 0.1, bg = "lightblue")
VisCount(shape = "flamingo_flying.png", size = 0.1, bg = "clouds.png")

download.file(url = "http://viscount.r-forge.r-project.org/gull_standing.png", destfile = "gull_standing.png")
download.file(url = "http://viscount.r-forge.r-project.org/water.png", destfile = "water.png")
VisCount(shape = "gull_standing.png", size = 0.1, bg = "grey")
VisCount(shape = "gull_standing.png", size = 0.1, bg = "water.png")


# if your last estimate was a mistake, remove it from record:

removeTypo()


# check out your performance statistics:

VisCountStats()


# remove particular trials (e.g. 3 and 7) from records and stats:

removeTypo(c(3, 7))


# check performance stats for particular sessions:

VisCountStats(c(1, 3:7))


# before quitting R, save results on disk for future use:

saveResults()
}
