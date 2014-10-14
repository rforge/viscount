\name{saveResults}
\alias{saveResults}
\title{Save VisCountSessions results to disk}
\description{
This function saves the \code{VisCountSessions} table as a .csv file on disk, 
either in the working directory (the default) or in a specified folder path. Do not save your R workspace - in further VisCount sessions, your results will be retrieved from disk.
}
\usage{
saveResults(path = "VisCountSessions.csv")
}
\arguments{
  \item{path}{folder path to the location and file name where you want the data 
to be recorded. The default is 'VisCountSessions.csv' in the working directory.}
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
\code{\link{getSavedResults}}
}
\examples{
\dontrun{
saveResults()
saveResults("/user/joey/myVisCount/VisCountSessions.csv")
}
}
\keyword{ ~kwd1 }
