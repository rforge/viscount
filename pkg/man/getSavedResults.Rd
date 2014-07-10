\name{getSavedResults}
\alias{getSavedResults}
\title{Get previously saved VisCount estimates}
\description{
This function imports the \code{VisCountSessions} table saved in a previous R session to the current workspace.
}
\usage{
getSavedResults(path = "VisCountSessions.csv")
}
\arguments{
  \item{path}{complete folder path to the .csv file containing your \code{VisCountSessions} data. The default is 'VisCountSessions.csv' in your current working directory. You will only have this file if you have previously used \code{VisCount()}, provided some estimates and used the \code{\link{saveResults}} function to save your results to disk before quitting R.}
}
\details{
}
\value{
The function returns a message informing either that the .csv file was not available, or that it was correctly loaded in the workspace.
}
\references{
}
\author{A. Marcia Barbosa}
\note{
}
\seealso{
\code{\link{saveResults}}}

\examples{
getSavedResults()
getSavedResults(path = "/user/joey/myVisCount/VisCountSessions.csv")
}
\keyword{ ~kwd1 }
