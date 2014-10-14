\name{removeTypo}
\alias{removeTypo}
\title{
Remove mistaken estimate(s) from record
}
\description{
This function removes one or more records that may have originated from mistyped 
estimates in the VisCountSessions data. Note that this operation cannot be undone. 
The resulting VisCountSessions table will silently overwrite the previous one 
and, as all trials are numbered consecutively, the removed trials will be noticeably 
missing from the table.
}
\usage{
removeTypo(trial = max(VisCountSessions$Trial))
}
\arguments{
  \item{trial}{\code{Trial}(s) of \code{VisCountSessions} to remove from record. 
  The default (if no trial is specified) is the last one.}
}
\details{
}
\value{
This function invisibly returns the new \code{VisCountSessions} table after 
removal of the specified trial(s).
}
\references{
}
\author{A. Marcia Barbosa}
\note{
}
\seealso{
}
\examples{
removeTypo()
removeTypo(3)
removeTypo(3:5)
removeTypo(c(3,5))
}
\keyword{ ~kwd1 }
