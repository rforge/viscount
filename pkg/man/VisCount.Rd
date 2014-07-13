\name{VisCount}
\alias{VisCount}
\title{
Train instant visual counts of individuals
}
\description{
This functions plots a random number of symbols (within user-defined limits) at random positions in the plotting window, asks you to type in your estimate, and then shows you exactly how many symbols there were and the extent of your estimate error. It also stores these data in a \code{VisCountSessions} table which you can retrieve later and which can be used by \code{\link{VisCountStats}} to provide you with performance statistics.
}
\usage{
VisCount(Nmax = 100, Nmin = 5, shape = 20, size = 0.5, col = "black")
}
\arguments{
  \item{Nmax}{maximum number of symbols to plot}
  \item{Nmin}{minimum number of symbols to plot}
  \item{shape}{plotting symbols to use (see 'pch' in \code{\link{points}})}
  \item{size}{size for the plotting symbols (see 'cex' in \code{\link{points}})}
  \item{col}{colour for the plotting symbols (see 'col' in \code{\link{points}})}
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
#VisCount()
}
\keyword{ ~kwd1 }
