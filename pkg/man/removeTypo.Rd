\name{removeTypo}
\alias{removeTypo}
\title{
Remove mistaken estimate(s) from the records
}
\description{
This function removes one or more records that may have originated from mistyped estimates in the VisCountSessions data.
}
\usage{
removeTypo(row = nrow(VisCountSessions))
}
\arguments{
  \item{row}{
Index number(s) of the row(s) of the VisCountSessions table to remove.
}
}
\details{
}
\value{
This function invisibly returns the VisCountSessions table after removal of the specified rows.
}
\references{
}
\author{
A. Marcia Barbosa}
\note{
}
\seealso{
}
\examples{
removeTypo()
removeTypo(3)
removeTypo(3:5)
}
\keyword{ ~kwd1 }
