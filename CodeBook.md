---
title: "CodeBook.md"
author: "Robert W. Stein"
date: "Sunday, April 26, 2015"
output: html_document
---

This document describes the data found in the AnalysisMean table produced when
    the run_analysis.R script is executed.
    
The column names for this data were extracted from the features_data in the
    downloaded data.  The features were run through a number of data transforms
    to remove '(', ')', '-', and ',' strings.  The resulting names were then
    converted to lower case.  To make the names more meaningful the following
    strings were changed:
        the first 't' was changed to 'time'
        the first 'f' was changed to 'freq'
        'acc' was changed to 'accel'
    After the column names were claned up, they were used to changed the column
    names in the table from the 'Vn' form to the actual variable names.
    
The first two columns in AnalysisMean are:
    subjectid - the ID for the volunteer
    activity - the activity that was being performed.
    
The data in the remaining columns represents the averages of the mean and
    standard deviation selected from the original data.  The column names use
    the same naming conventions as stated in the features_info.txt from the
    downloaded file, with the data transforms as mentioned above.