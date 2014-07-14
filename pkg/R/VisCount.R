VisCount <- function(Nmax = 100, Nmin = 5, shape = 20, size = 0.5, col = "black") {
  
  if(!exists("session")) session <<- 1
  
  if(!exists("VisCountSessions")) {
    message("NOTE: If you have a previously saved VisCountSessions table, use\ngetSavedResults() before using VisCount(), so that the table is updated\nwith results from the current session.")
    VisCountSessions <- data.frame(Trial = integer(), Session = integer(), DateTime = character(), Nmax = integer(), Nmin = integer(), MyEstimate = integer(), TrueNumber = integer(), Error = integer(), ProportionalError = numeric(), stringsAsFactors = FALSE)
  }  # end if exists
  
  trial <- nrow(VisCountSessions) + 1
  N <- sample(Nmin : Nmax, 1)
  
  par(mfrow = c(1, 1), mar = c(0, 0, 0, 0))
  plot(runif(N), runif(N), pch = shape, cex = size, col = col, axes = FALSE, xlab = "", ylab = "")

  estimate <- readline("Type your estimated number of plotted items and press enter: ")
  estimate <- as.integer(estimate)
  error <- estimate - N
  prop.error <- round(error/N, 3)

  VisCountSessions[trial, "Trial"] <- trial
  VisCountSessions[trial, "Session"] <- session
  VisCountSessions[trial, "DateTime"] <- strftime(Sys.time())
  VisCountSessions[trial, "Nmax"] <- Nmax
  VisCountSessions[trial, "Nmin"] <- Nmin
  VisCountSessions[trial, "MyEstimate"] <- estimate
  VisCountSessions[trial, "TrueNumber"] <- N
  VisCountSessions[trial, "Error"] <- error
  VisCountSessions[trial, "ProportionalError"] <- prop.error
  VisCountSessions <<- VisCountSessions  # sends it to the wkspace
  
  cat("My estimate: ", estimate, "\nTrue number: ", N, "\nError: ", error, "\nProportional error: ", prop.error, " (", prop.error * 100, "%)", sep = "")
}
