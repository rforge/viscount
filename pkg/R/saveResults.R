saveResults <- function(path = "VisCountSessions.csv") {
  if (exists("VisCountSessions")) {
    write.csv(VisCountSessions, path, row.names = FALSE)
    message("Results saved at '", getwd(), "/VisCountSessions.csv'. Re-start R if you want to start a new VisCount session, or keep going if you want results added to the current session.")
  } else {
    message ("No VisCountSessions results to save. Use VisCount() a few times first, providing some count estimates.")
  }
}
