getSavedResults <- function(path = "VisCountSessions.csv") {
  if (exists("VisCountSessions")) message("A VisCountSessions table already exists in the current R workspace.\nIf you want to start a new session, please quit and restart R.\nOtherwise, keep using VisCount() without re-importing saved results.")
  else {
    prev.res <- tryCatch(eval(read.csv(path)), error = function(e) NULL)
    if (is.null(prev.res)) {
      message("No previous VisCountSessions results in the working directory\n(", getwd(), ").\nIf you have previously saved VisCount results,\nspecify the path to where they are (see ?getSavedResults),\nor move 'VisCountSessions.csv' to your current working directory\n(type getwd() to know where it is),\nor set the working directory to where you have used VisCount before\n(you can use setwd() for this).")
    } else {
      VisCountSessions <<- read.csv(path, stringsAsFactors = FALSE)
      session <<- max(VisCountSessions$Session) + 1
      message("VisCountSessions data imported to the workspace.")
    }
  }
}
