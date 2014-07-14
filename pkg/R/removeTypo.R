removeTypo <- function(trial = max(VisCountSessions$Trial)) {
  if (exists("VisCountSessions")) {
    if (nrow(VisCountSessions) == 0) {
      message("No data to remove from VisCountSessions table.")
      } else {
      if (all(trial %in% VisCountSessions$Trial)) {
        message("Specified trial(s) removed from VisCountSessions table.")
      } else {
        trial <- trial[trial %in% VisCountSessions$Trial]
        message("One or more of the specified trials not found in the VisCountSessions table;\nonly available trials were removed.")
      }
    }
    VisCountSessions <<- subset(VisCountSessions, !(Trial %in% trial))
  } else {
    message ("No VisCountSessions table to remove typo from.")
  }
}
