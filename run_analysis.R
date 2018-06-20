wd <- "UCI HAR Dataset"

print(paste0("Trying to find the ", wd, " folder"))
if (dir.exists(wd)) {
  # get's column names
  col_names <- t(read.csv(paste0(wd, "/features.txt"), sep=" ", header = FALSE)[2])
  col_names <- c("test.subject", "activity", col_names)
  
  # get activity factors
  activity_labels <- t(read.csv(paste0(wd, "/activity_labels.txt"), sep = " ", header = FALSE))
  colnames(activity_labels) <- activity_labels[1,]
  activity_labels <- activity_labels[-1,]
  
  # create the data frame for the tidy data set
  df <- data.frame(matrix(ncol = 2 + length(col_names), nrow = 0))
  colnames(df) <- col_names
  
  for (folder in c("test", "train")) {
    # names for each directory
    X_file <- paste0(wd, "/", folder, "/X_", folder, ".txt")
    y_file <- paste0(wd, "/", folder, "/y_", folder, ".txt")
    subject_file <- paste0(wd, "/", folder, "/subject_", folder, ".txt")
    
    # data is getting retrieved
    X_data <- read.csv(X_file, sep = "", header = FALSE)
    y_data <- read.csv(y_file, header = FALSE)
    # activities are converted from numbers to words
    y_data <- sapply(y_data, function(x){activity_labels[as.character(x)]})
    subject_data <- read.csv(subject_file, header = FALSE)
    
    new_df <- cbind(subject_data, y_data, X_data)
    colnames(new_df) <- col_names
    # add entries to the df dataframe
    df <- rbind(df, new_df)
  }
  
  # Keep only first two columns, mean and standard deviation columns
  keep_col <- grepl("[Mm][Ee][Aa][Nn]", colnames(df)) | grepl("std", colnames(df))
  keep_col[1:2] <- TRUE
  df <- df[, keep_col]
  
  write.table(df, paste0(wd, "/tidy_data.txt"), row.names = FALSE)
  
  # creates a second, independent tidy data set with
  # the average of each variable for each activity and each subject.
  avg_df <- df[0,]
  
  for (subject in unique(df[, 1])) {
    for (activity in unique(df[, 2])) {
      # finds the rows that have the subject, activity pair
      use_row <- df[, 1] == subject & df[, 2] == activity
      # excluding the first two columns, we find the average across all rows for each column
      avg_df <- rbind(avg_df, cbind(subject, activity, as.data.frame(t(apply(df[use_row, -(1:2)], 2, function(x){mean(as.numeric(x), na.rm = TRUE)})))))
    }
  }
  
  write.table(avg_df, paste0(wd, "/avg_tidy_data.txt"), row.names = FALSE)
} else {
  stop(paste0("Could not find the ", wd, " folder"))
}
