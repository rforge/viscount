\name{saveResults}
\alias{saveResults}
\title{
Save VisCountSessions results to disk.
}
\description{
This function saves the VisCountSessions table as a .csv file on disk, either in the working directory (the default) or in a specified folder path.
}
\usage{
saveResults(path = "VisCountSessions.csv")
}
\arguments{
  \item{path}{
  folder path to the locations and file name where you want the data to be recorded. The default is '"VisCountSessions.csv' in the working directory.
}
}
\details{
}
\value{
The function saves a .csv file to disk
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
saveResults()
saveResults("/user/joey/myVisCount/VisCountSessions.csv")
}
\keyword{ ~kwd1 }
