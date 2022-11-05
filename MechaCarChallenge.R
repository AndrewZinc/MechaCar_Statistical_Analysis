# import the dependency
library(dplyr) 

# Read in the CSV file and create a dataframe
mechaCar_df <- read.csv('Data/MechaCar_mpg.csv')

# Perform linear regression on the dataframe using a model that includes all dataframe columnns
lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD+mpg,mechaCar_df)

# Generate summary statistics for the linear regression - focus on R-Squared and p-value.
summary(lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD+mpg,mechaCar_df))

# Read in the CSV file for suspension coil analysis
spring_table <- read.csv('Data/Suspension_Coil.csv')

#create total_summary table
total_summary <- spring_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=(sd(PSI)^2),SD=sd(PSI),.groups = 'keep')

# Create the lot_summary table
lot_summary <- spring_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=(sd(PSI)^2),SD=sd(PSI),.groups = 'keep')

# subset the spring data to prepare for t-tests
lt1 <- subset(spring_table, Manufacturing_Lot=='Lot1')
lt2 <- subset(spring_table, Manufacturing_Lot=='Lot2')
lt3 <- subset(spring_table, Manufacturing_Lot=='Lot3')

# Test the entire dataset
t.test(spring_table$PSI, mu=1500)

# Test each lot
t.test(lt1$PSI, mu=1500)
t.test(lt2$PSI, mu=1500)
t.test(lt3$PSI, mu=1500)
