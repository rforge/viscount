removeTypo <- function(row = nrow(VisCountSessions)) {
  if (exists("VisCountSessions"))  VisCountSessions <<- VisCountSessions[-row, ]
  else message ("No VisCountSessions table to remove typo from.")
}
