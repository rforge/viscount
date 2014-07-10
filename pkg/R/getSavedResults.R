getSavedResults <-
function(path = "VisCountSessions.csv") {
    prev.res <- tryCatch(eval(read.csv(path)), error = function(e) NULL)
    if (is.null(prev.res)) {
      message("No previous results in the working directory. If you have previously saved VisCount results, specify the path to where they are (see ?getSavedResults), or move 'VisCountSessions.csv' to your current working directory (type getwd() to know where it is), or set the working directory to where you have used VisCount before.")
    } else {
      VisCountSessions <<- read.csv(path, stringsAsFactors = FALSE)
      session <<- max(VisCountSessions$Session) + 1
      message("VisCountSessions data imported to the workspace.")
    }
}
