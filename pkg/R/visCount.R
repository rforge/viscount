visCount <- function(Nmax = 100, Nmin = 10, shape = 20, size = 1, col = "black", bg = "lightblue") {
  
  if (length(grep(".png", c(shape, bg)) > 0) & !("png" %in% rownames(installed.packages())))  return(message("Using .png images requires the 'png' R package - please install it [ install.packages('png') ] and try again."))
  
  if(!exists("session")) session <<- 1
  
  if(!exists("VisCountSessions")) {
    message("NOTE: If you have a previously saved VisCountSessions table, use\ngetSavedResults() before using visCount(), so that the table is updated\nwith results from the current session.")
    VisCountSessions <- data.frame(Trial = integer())
  }  # end if !exists
  
  trial <- nrow(VisCountSessions) + 1
  N <- sample(Nmin : Nmax, 1)
  x <- runif(N)
  y <- runif(N)
  par(mfrow = c(1, 1), mar = c(0, 0, 0, 0))
  
  plot.min <- 0
  plot.max <- 1
  if (length(grep(".png", shape)) > 0) {
    size <- size / 10
    plot.max <- plot.max + size
  }
  
  if (length(grep(".png", bg)) > 0) {
    #library(png)
    bkg <- as.raster(png::readPNG(bg))
    plot(c(plot.min, plot.max), c(plot.min, plot.max), type = "n", xlab = "", ylab = "", axes = F)
    lim <- par()
    rasterImage(bkg, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
    bg <- unlist(strsplit(bg, split = "/", fixed = T))
    bg <- bg[length(bg)]
  } else {
    par(bg = bg)
    plot(c(plot.min, plot.max), c(plot.min, plot.max), type = "n", xlab = "", ylab = "", axes = F)
  }
  
  if (length(grep(".png", shape)) > 0) {
    #library(png)
    img <- as.raster(png::readPNG(shape))
    #height <- nrow(img)
    #width <- ncol (img)
    #landscape <- ifelse (width > height, TRUE, FALSE)
    rasterImage(img, x, y, x + size, y + size)
    #image.ratio <- nrow(img) / ncol(img)
    #rasterImage(img, x, y, x + size, y + image.ratio)
    #rasterImage(img, 0, 0, 1, r)
    shape <- unlist(strsplit(shape, split = "/", fixed = T))
    shape <- shape[length(shape)]
  }  else points(x, y, pch = shape, cex = size, col = col)
  
  plot.time <- Sys.time()
  estimate <- readline("Type your estimated number of plotted items and press enter: ")
  time.taken <- round(abs(as.numeric(difftime(Sys.time(), plot.time), units = "secs")))
  estimate <- as.integer(estimate)
  error <- estimate - N
  prop.error <- round(error/N, 3)

  VisCountSessions[trial, "Trial"] <- trial
  VisCountSessions[trial, "Session"] <- session
  VisCountSessions[trial, "DateTime"] <- strftime(Sys.time())
  VisCountSessions[trial, "Shape"] <- shape
  VisCountSessions[trial, "Background"] <- bg
  VisCountSessions[trial, "TrueNumber"] <- N
  VisCountSessions[trial, "MyEstimate"] <- estimate
  VisCountSessions[trial, "TimeTaken"] <- time.taken
  VisCountSessions[trial, "Error"] <- error
  VisCountSessions[trial, "ProportionalError"] <- prop.error
  VisCountSessions <<- VisCountSessions  # sends it to the wkspace
  
  cat("True number: ", N, "\nMy estimate: ", estimate, "\nTime taken (seconds): ", time.taken, "\nError: ", error, "\nProportional error: ", prop.error, " (", prop.error * 100, "%)", sep = "")
}
