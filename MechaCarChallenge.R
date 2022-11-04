# import the dependency
library(dplyr) 

# Read in the CSV file and create a dataframe
mechaCar_df <- read.csv('Data/MechaCar_mpg.csv')

# Perform linear regression on the dataframe using a model that includes all dataframe columnns
lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD+mpg,mechaCar_df)

# Generate summary statistics for the linear regression - focus on R-Squared and p-value.
summary(lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD+mpg,mechaCar_df))
