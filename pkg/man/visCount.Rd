\name{visCount}
\alias{visCount}
\title{
Train visual count estimates
}
\description{
This functions plots a random number (within user-defined limits) of symbols or 
.png images at random positions in the plotting window, asks you to type in your 
estimate, and then shows you exactly how many symbols/pictures there were and the 
extent of your estimate error. It also stores these data in a \code{VisCountSessions} 
table which you can retrieve later and which can be used by the \code{\link{visCountStats}} 
function to provide performance statistics.
}
\usage{
visCount(Nmax = 100, Nmin = 10, shape = 20, size = 1, col = "black", bg = "lightblue")
}
\arguments{
  \item{Nmax}{maximum number of symbols to plot; defaults to 100.}
  \item{Nmin}{minimum number of symbols to plot; defaults to 10.}
  \item{shape}{plotting items to use. Can be one of the plotting symbols available in 
  R (see 'pch' values in \code{\link{points}}), such as the default 20 for a black 
  dot, or a keyboard character in quotes, or the complete folder path (in quotes and 
  including file name and extension) to a .png image, preferably with transparent 
  background (see examples).}
  \item{size}{size for the plotting symbols (see 'cex' in \code{\link{points}})}
  \item{col}{colour for the plotting symbols (see 'col' in \code{\link{points}}). The default is "black". Ignored if \code{shape} is a .png image.}
  \item{bg}{colour for the plot background (see 'bg' in \code{\link{par}}, and type \code{colours()} for available colour names in R). The default is "lightblue". Ignored if \code{bg} is a .png image.}
}
\details{
}
\value{
}
\references{
}
\author{
A. Marcia Barbosa
}
\note{
}
\seealso{
}
\examples{
\dontrun{

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

download.file(url = "http://viscount.r-forge.r-project.org/flamingo_flying.png", 
destfile = "flamingo_flying.png")
download.file(url = "http://viscount.r-forge.r-project.org/clouds.png", 
destfile = "clouds.png")
visCount(shape = "flamingo_flying.png", bg = "lightblue")
visCount(shape = "flamingo_flying.png", size = 0.5, bg = "clouds.png")

download.file(url = "http://viscount.r-forge.r-project.org/gull_standing.png", 
destfile = "gull_standing.png")
download.file(url = "http://viscount.r-forge.r-project.org/water.png", 
destfile = "water.png")
visCount(shape = "gull_standing.png", bg = "grey")
visCount(shape = "gull_standing.png", bg = "water.png")

}
}
\keyword{ ~kwd1 }
