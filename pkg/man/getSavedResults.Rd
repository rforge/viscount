\name{getSavedResults}
\alias{getSavedResults}
\title{
Get previously saved estimates
}
\description{
This function gets in the workspace the VisCountSessions table saved in a previous R session.
}
\usage{
getSavedResults(path = "VisCountSessions.csv")
}
\arguments{
  \item{path}{
The complete folder path to the .csv file containing your VisCountSessions data. The default is 'VisCountSessions.csv' in your current working directory. Remember you will only have this file if you have previously used VisCount(), provided some estimates and used the \code{\link{saveResults}} function to save your results to disk before closing R at the end of the session.
}
}
\details{
}
\value{
The function returns a message informing either that the csv file was not available, or that it was correctly loaded in the workspace.
}
\references{
}
\author{
A. Marcia Barbosa
}
\note{
}
\seealso{
\code{\link{saveResults}}}

\examples{
getSavedResults()
getSavedResults(path = "/user/joey/myVisCount/VisCountSessions.csv")
}
\keyword{ ~kwd1 }
