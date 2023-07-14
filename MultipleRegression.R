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

#Linear Regression
print("Linear Regression")
lmReg <- lm(diabetes_df$BloodPressureNA ~ diabetes_df$GlucoseNA+diabetes_df$BMINA+diabetes_df$Pregnancies)
summary(lmReg)
new_data <- data.frame(
  GlucoseNA = 111,
  BMINA = 26.3,
  Pregnancies = 2
)

# Predict using the linear regression model
prediction <- predict(lmReg, newdata = new_data)
print(prediction)

library(ggplot2)
#Creating Dataframe for plotting
plot_data <- data.frame(Pregnancies = diabetes_df$Pregnancies,
                        BloodPressureNA = diabetes_df$BloodPressureNA)

# Create the scatter plot with the regression line
ggplot(plot_data, aes(x = Pregnancies, y = BloodPressureNA)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, color = "red") +
  xlab("Pregnancies") +
  ylab("Blood Pressure") +
  ggtitle("Linear Regression")



#Logistic Regression
print("Logistic Regression")
logReg <- glm(diabetes_df$Outcome ~ diabetes_df$GlucoseNA + diabetes_df$BMINA+diabetes_df$Pregnancies, family=binomial)
summary(logReg)


# Create a data frame for plotting
plot_data_log <- data.frame(
  GlucoseNA = diabetes_df$GlucoseNA,
  BMINA = diabetes_df$BMINA,
  Pregnancies = diabetes_df$Pregnancies,
  Outcome = diabetes_df$Outcome
)

# Add predicted probabilities to the data frame
plot_data_log$Probabilities <- predict(logReg, type = "response")

# Create the plot
ggplot(plot_data_log, aes(x = GlucoseNA, y = Probabilities, color = factor(Outcome))) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE) +
  xlab("GlucoseNA") +
  ylab("Predicted Probabilities") +
  scale_color_manual(values = c("blue", "red"), labels = c("No Diabetes", "Diabetes")) +
  theme_minimal()
