<h2>Read Me for Coursera's Getting And Cleaning Data Course Project.</h2>

<strong>Purpose of project: </strong>
<br>
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


<strong>Approach: </strong>
<br>
The approach taken in this project was initiated by review of David Hood's graphical review of the project structure which can be found at: https://class.coursera.org/getdata-003/forum/thread?thread_id=90#comment-777
<p>
In short, the metod was to find the appropriate files to use, extract only mean and standard deviation (std) variables from the main observations, and then combine them vertically into three distinct data tables before combining the three together to create the "full data" that was required by the project. 
<p>
Once that was created, certain variable names, as well as activity variables, were adjusted to be more descriptive.  
<p>
The data table was then reshaped to include only the mean for each of observation variables based on subjectname/activity pairs.  The final tidy data set is 180 observations of 88 variables.
<p>
As per the project description, this repo includes the run_analysis.R script which outputs the tidydatamean.txt tidy data set (also included) as well as codebook further describing the variable and other key information.
