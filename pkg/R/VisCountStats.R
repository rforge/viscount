VisCountStats <- function(sessions = unique(VisCountSessions$Session), VCSessions = VisCountSessions, plot = TRUE) {
  
  par(bg = "white")
  
  msg <- "No VisCount results to calculate stats on. Use VisCount() a few times first,\nproviding some count estimates."
  
  if (!exists("VisCountSessions"))  message(msg)
  # messages instead of errors to avoid problems on package check
  
  else {
    VisCountSessions <- VCSessions[complete.cases(VCSessions), ]
    if (nrow(VisCountSessions) < nrow(VCSessions)) message("Some VisCount trials removed from analysis\nbecause no numeric estimate was provided by the user.")
    if (nrow(VisCountSessions) == 0)  message(msg)
    else if (nrow(VisCountSessions) == 1)  message("Only one VisCount estimate is not enough to calculate stats.\nUse VisCount() a few times first, providing some count estimates.")
    else {
      TrialStats <- subset(VisCountSessions, Session %in% sessions)
      available.sessions <- sessions[sessions %in% unique(TrialStats$Session)]
      if (length(sessions) > length(available.sessions)) message("One or more of the specified sessions not found in the VisCountSessions table;\nonly available sessions were used.")
      TrialStats$Error <- with(TrialStats, MyEstimate - TrueNumber)
      TrialStats$ProportionalError <- with(TrialStats, round(Error / TrueNumber, 3))
      rSquared <- function (y, resid) {  # function copied from package micEcon
        yy <- y - matrix(mean(y), nrow = nrow(array(y)))
        r2 <- 1 - (t(resid) %*% resid)/(t(yy) %*% yy)
        return(r2)
      }  # end rSquared{micEcon} function
      OverallAccuracy <- with(TrialStats, rSquared(TrueNumber, abs(Error)))
      
      SessionStats <- data.frame(Session = available.sessions)
      SessionStats[ , "DateTimeEnd"] <- with(TrialStats, tapply(DateTime, Session, max))
      SessionStats[ , "TotalNumber"] <- with(TrialStats, tapply(TrueNumber, Session, sum))
      SessionStats[ , "TotalEstimate"] <- with(TrialStats, tapply(MyEstimate, Session, sum))
      SessionStats[ , "TotalError"] <- with(SessionStats, TotalEstimate - TotalNumber)
      SessionStats[ , "ProportionalError"] <- with(SessionStats, round(TotalError / TotalNumber, 3))
      SessionStats[ , "MeanTimeTaken"] <- round(with(TrialStats, tapply(TimeTaken, Session, mean)))
      for (s in available.sessions) {
        SessionStats[SessionStats$Session == s, "SessionAccuracy"] <- with(subset(TrialStats, Session == s), round(rSquared(TrueNumber, abs(Error)), 3))
      }
      
      if (plot) {
        par(mfrow = c(2, 2), mar = c(5, 4.5, 2, 1))
        
        # plot 1:
        maxNum <- with(TrialStats, max(MyEstimate, TrueNumber))
        minNum <- with(TrialStats, min(MyEstimate, TrueNumber))
        TrialStats.ord <- TrialStats[order(TrialStats$TrueNumber, TrialStats$MyEstimate), ]
        with(TrialStats.ord, plot(1 : maxNum, xlab = "Trial (in order of true number)", ylab = "", xlim = c(1, nrow(TrialStats)), ylim = c(minNum, maxNum), type = "n"))
        with(TrialStats.ord, lines(TrueNumber, col = "darkgrey"))
        with(TrialStats.ord, lines(MyEstimate, col = "black"))
        mtext("My estimate", side = 2, line = 3, col = "black", cex = 0.8)
        mtext("True number", side = 2, line = 2, col = "darkgrey", cex = 0.8)
        #title("(a)", adj = 0)
        
        # plot 2:
        with(TrialStats, plot(x = NULL, y = NULL, xlim = c(minNum, maxNum), ylim = c(minNum, maxNum), xlab = "True number", ylab = ""))
        mtext("My estimate", side = 2, line = 3, col = "black", cex = 0.8)
        mtext("(number = session)", side = 2, line = 2, col = "black", cex = 0.7)
        with(TrialStats, points(MyEstimate ~ TrueNumber, pch = as.character(Session), cex = 0.7))
        abline(a = 0, b = 1, col = "darkgrey", lty = 2)  # equality line
        text(x = minNum, y = maxNum, adj = c(0, 1), substitute(paste(Accuracy == a), list(a = round(OverallAccuracy, 2))))
        #title("(b)", adj = 0)
        
        # plot 3:
        minErr <- min(abs(TrialStats$ProportionalError))
        maxErr <- max(abs(TrialStats$ProportionalError))
        with(TrialStats, plot(x = NULL, y = NULL, xlab = "True number", ylab = "", xlim = range(TrueNumber), ylim = c(minErr, maxErr)))
        mtext("Proportional error", side = 2, line = 3, col = "black", cex = 0.8)
        mtext("(underestimates in grey)", side = 2, line = 2, col = "darkgrey", cex = 0.8)
        negative.errors <- which(TrialStats$ProportionalError < 0)
        with(TrialStats[negative.errors, ], points(abs(ProportionalError) ~ TrueNumber, pch = as.character(Session), cex = 0.7, col = "darkgrey"))  
        with(TrialStats[-negative.errors, ], points(abs(ProportionalError) ~ TrueNumber, pch = as.character(Session), cex = 0.7, col = "black"))  
        #title("(c)", adj = 0)
        
        # plot 4:
        minY <- with(SessionStats, min(SessionAccuracy, abs(ProportionalError)))
        maxY <- with(SessionStats, max(SessionAccuracy, abs(ProportionalError)))
        with(SessionStats, plot(x = NULL, y = NULL, xlim = range(available.sessions), ylim = c(minY, maxY), xlab = "Session", ylab = "", pch = as.character(Session), cex = 0.7, axes = FALSE))
        box()
        axis(side = 1, at = available.sessions)
        axis(side = 2, at = seq(round(minY, 1), round(maxY, 1), by = 0.1))
        mtext("Accuracy", side = 2, line = 3, col = "black", cex = 0.8)
        mtext("Proportional error", side = 2, line = 2, col = "darkgrey", cex = 0.8)
        if (length(available.sessions) > 1) {
          with(SessionStats, lines(abs(ProportionalError) ~ Session, col = "darkgrey"))
          with(SessionStats, lines(SessionAccuracy ~ Session, col = "black"))
        } else {
          with(SessionStats, points(abs(ProportionalError) ~ Session, col = "darkgrey", pch = 20))
          with(SessionStats, points(SessionAccuracy ~ Session, col = "black", pch = 20))          
        }
        session.negative.errors <- which(SessionStats$ProportionalError < 0)
        with(SessionStats[session.negative.errors, ], points(abs(ProportionalError - 0.05) ~ Session, pch = "-", col = "darkgrey"))
        #title("(d)", adj = 0)
      }  # end if plot
      
      return(list(TrialStats = TrialStats, SessionStats = SessionStats, OverallAccuracy = round(OverallAccuracy, 3)))
    }  # end else
  }  # end else
}
