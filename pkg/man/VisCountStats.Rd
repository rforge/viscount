\name{VisCountStats}
\alias{VisCountStats}
\title{VisCount statistics on user performance}
\description{
This function provides the user with several statistics on their count estimate performance over different trials and training sessions.
}
\usage{
VisCountStats(sessions = unique(VisCountSessions$Session), VCSessions = VisCountSessions, plot = TRUE)
}
\arguments{
  \item{sessions}{numeric integer vector specifying the training sessions to calculate performace statistics for. The default is all the sessions recorded in the \code{VisCountSessions} results table.}
  \item{VCSessions}{name of the table containing the \code{VisCountSessions} results. \code{VisCountSessions} is the default.}
  \item{plot}{logical, whether to provide the graphical results as well. Deafaults to TRUE.}
}
\details{
}
\value{
If there are no \code{VisCountSessions} results available, the function returns a message telling you so. If there are, it returns a list with the following components:
  \item{TrialStats}{a data frame showing data and user performance over the \code{VisCount} trials included in the specified \code{sessions}.}
  \item{SessionStats}{a data frame summarizing user performance in each of specified \code{sessions}.}
  \item{OverallAccuracy}{a numerical value of the overall user performance, measured by the coefficient of determination (R-squared) of the equality line (where estimates = true numbers; Poole 1974, Romdal et al. 2005).}
If plot = TRUE, the function also produces a set of 4 plots depicting these statistics.
}
\references{
Poole R.W. (1974) An Introduction to Quantitative Ecology. McGraw-Hill, NY.

Romdal T.S., Colwell R.K. & Rahbek C. (2005) The influence of band sum area, domain extent, and range sizes on the latitudinal mid-domain effect. Ecology 86:235-244.
}
\author{A. Marcia Barbosa}
\note{
}
\seealso{
}
\examples{
VisCountStats()
VisCountStats(1:3)
}
\keyword{ ~kwd1 }
