\name{VisCount-package}
\alias{VisCount-package}
\alias{VisCount}
\docType{package}
\title{R package for training and evaluating visual count estimates}
\description{
The VisCount package allows you to train rapid visual estimates of the number of 
individuals (symbols or pictures) in the plotting window, enter your estimates, 
and get a series of insightful statistics on your performance and how it evolves 
along different training sessions. It can also be a practical and economical tool 
for the training and calibration of field teams collecting information on the sizes 
of flocks or populations.
}
\details{
\tabular{ll}{
Package: \tab VisCount\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2014-10-14\cr
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
\dontrun{

# MINIMUM WORKFLOW:

getSavedResults()  # do this at the start of any new VisCount session

visCount()  # repeat as desired (additional options below)

saveResults()  # do this before quitting R



# COMPLETE WORKFLOW:

# load previous VisCount results
# (if you've used VisCount before on this computer):

getSavedResults()


# practise visCount and enter your estimates as prompted:

visCount()  # repeat until bored


# practise also with different shapes, sizes, colours and backgrounds:

visCount(shape = "^", bg = "white")

visCount(shape = "~", size = 1.3)

visCount(shape = "x", size = 2, col = "brown")

visCount(shape = "Y", bg = "wheat")


# practise with different number limits
# (you can combine with any of the arguments above):

visCount(Nmax = 500, Nmin = 100)


# you can also use animal and/or background pictures in PNG format
# (you need to have the png R package installed for this);
# here are some examples with downloaded public domain images:

download.file(url = "http://viscount.r-forge.r-project.org/img/flamingo_flying.png", 
destfile = "flamingo_flying.png")
download.file(url = "http://viscount.r-forge.r-project.org/img/clouds.png", 
destfile = "clouds.png")

visCount(shape = "flamingo_flying.png", bg = "lightblue")

visCount(shape = "flamingo_flying.png", size = 0.5, bg = "clouds.png")


download.file(url = "http://viscount.r-forge.r-project.org/img/gull_standing.png", 
destfile = "gull_standing.png")
download.file(url = "http://viscount.r-forge.r-project.org/img/water.png", 
destfile = "water.png")

visCount(shape = "gull_standing.png", bg = "grey")

visCount(shape = "gull_standing.png", bg = "water.png")


# if your last estimate was a mistake, remove it from record:

removeTypo()


# check out your performance statistics:

visCountStats()


# remove particular trials (e.g. 3 and 7) from records and stats:

removeTypo(c(3, 7))


# check performance stats for particular sessions:

visCountStats(c(1, 3:7))


# before quitting R, save your results on disk for future use:

saveResults()

}
}
