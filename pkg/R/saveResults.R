saveResults <- function(path = "VisCountSessions.csv") {
  if (exists("VisCountSessions")) {
    write.csv(VisCountSessions, path, row.names = FALSE)
    message("Results saved at '", getwd(), "/VisCountSessions.csv'.\nRe-start R if you want to start a new VisCount session, or keep going\nif you want results added to the current session.")
  } else {
    message ("No VisCountSessions results to save. Use VisCount() a few times first,\nproviding some count estimates.")
  }
}
