\name{VisCount}
\alias{VisCount}
\title{
Train visual count estimates
}
\description{
This functions plots a random number of symbols (within user-defined limits) at 
random positions in the plotting window, asks you to type in your estimate, and 
then shows you exactly how many symbols there were and the extent of your 
estimate error. It also stores these data in a \code{VisCountSessions} table 
which you can retrieve later and which can be used by the \code{\link{VisCountStats}} 
function to provide performance statistics.
}
\usage{
VisCount(Nmax = 100, Nmin = 5, shape = 20, size = 1, col = "black", bg = "lightblue")
}
\arguments{
  \item{Nmax}{maximum number of symbols to plot}
  \item{Nmin}{minimum number of symbols to plot}
  \item{shape}{plotting items to use. Can be one of the plotting symbols available in R (see 'pch' values in \code{\link{points}}), such as the default 20 for a black dot, or the complete folder path (in quotes and including file name and extension) to a .png image, preferably with transparent background (see examples).}
  \item{size}{size for the plotting symbols (see 'cex' in \code{\link{points}})}
  \item{col}{colour for the plotting symbols (see 'col' in \code{\link{points}}). The default is "black". Ignored if 'shape' is a .png image.}
  \item{bg}{colour for the plot background (see 'bg' in \code{\link{par}}). The default is "lightblue".}
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
# VisCount()
# VisCount(shape = "^")
# VisCount(shape = "~", size = 1.3)
# VisCount(shape = "x", size = 1, col = "pink")
# VisCount(shape = "#", Nmax = 500, Nmin = 100)
}
\keyword{ ~kwd1 }
