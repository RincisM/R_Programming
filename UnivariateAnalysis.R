setwd("D:/MCA (SS)/Semester 2/Data Analytics/DATASET/PimaIndian")
diabetes_df = read.csv('diabetes.csv')
head(diabetes_df)

summary(diabetes_df)
str(diabetes_df)
#Making the 0's in Glucose to NA
diabetes_df$GlucoseNA <- diabetes_df$Glucose
diabetes_df$GlucoseNA[diabetes_df$Glucose==0] <- NA
summary(diabetes_df$GlucoseNA)
#Making the 0's in Blood Pressure to NA
diabetes_df$BloodPressureNA <- diabetes_df$BloodPressure
diabetes_df$BloodPressureNA[diabetes_df$BloodPressure==0] <- NA
summary(diabetes_df$BloodPressureNA)
#Making the 0's in BMI to NA
diabetes_df$BMINA <- diabetes_df$BMI
diabetes_df$BMINA[diabetes_df$BMI==0] <- NA
summary(diabetes_df$BMINA)
#Making the 0's in Skin Thickness to NA
diabetes_df$SkinThicknessNA <- diabetes_df$SkinThickness
diabetes_df$SkinThicknessNA[diabetes_df$SkinThickness==0] <- NA
summary(diabetes_df$SkinThicknessNA)

library(moments)

frequencydata <- table(diabetes_df$BloodPressure)
print("The Frequency of Blood Pressure")
print(frequencydata)
print(paste("Mean of Blood Pressure", mean(diabetes_df$BloodPressure)))
print(paste("Median of Blood Pressure", median(diabetes_df$BloodPressure)))

install.packages("DescTools")
library(DescTools)
print(paste("Mode of Blood Pressure", Mode(diabetes_df$BloodPressure)))
print(paste("Skewness of Blood Pressure", skewness(diabetes_df$BloodPressure)))
print(paste("Kurtosis of Blood Pressure", kurtosis(diabetes_df$BloodPressure)))
print(paste("Variance of Blood Pressure", var(diabetes_df$BloodPressure)))
print(paste("Standard Deviation of Blood Pressure", sd(diabetes_df$BloodPressure)))
