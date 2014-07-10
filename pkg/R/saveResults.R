saveResults <- function(path = "VisCountSessions.csv") {
  if (exists("VisCountSessions"))  write.csv(VisCountSessions, path, row.names = FALSE)
  else message ("No VisCountSessions results to save. Use VisCount() a few times first, providing some count estimates.")
}
