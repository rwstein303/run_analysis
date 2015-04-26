---
title: "README.md"
author: "Robert W. Stein"
date: "Sunday, April 26, 2015"
output: html_document
---

This document describes the process required for executing the run_analysis.R
script to analyze the activity collected from volunteers cell phones.

1.  Download the following zipped file:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2.  Unzip the file, which will create a folder named 'UCI HAR Dataset'.

3.  Ensure the folder is in your working directory.

4.  Execute the run_analysis.R script.

The script will perform a number of data transforms as noted by the comments in
    the script.  The key results from the script are number of tables:
        MergedData - This table contains all the data from the test and train
                     datasets as well as added columns for the subjects and the
                     activities.
        analysis_data - This table contains the columns for only the means and
                        the standard deviation columns.
        ActivityMeans - This table contains a summary of the analysis_data by
                        subject and activity across the mean and standard
                        deviations columns.
