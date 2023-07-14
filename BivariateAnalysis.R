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
linearRegNA <- lm(BloodPressureNA~Pregnancies, data=diabetes_df)
summary(linearRegNA)

plot(diabetes_df$Pregnancies, diabetes_df$BloodPressureNA, xlab = "Pregnancies", ylab="BloodPressure", main="Linear Regression")
abline(linearRegNA, col="red")

prediction <- predict(linearRegNA, data.frame(Pregnancies=12.5))
print(prediction)


#Logistic Regression

print("Logistic Regression")
# Convert Outcome to factor
#diabetes_df$Outcome <- factor(diabetes_df$Outcome, levels = c(0, 1), labels = c("No Diabetes", "Diabetes"))
logisticReg <- glm(diabetes_df$Outcome ~ diabetes_df$BloodPressure, family=binomial)
summary(logisticReg)

library(ggplot2)
plot_data <- data.frame(BloodPressure = diabetes_df$BloodPressure, Outcome = diabetes_df$Outcome, Probabilities = predict(logisticReg, type="response"))
ggplot(plot_data, aes(x = BloodPressure, y = Probabilities, color = Outcome)) +
  geom_point() +
  geom_smooth(method = "glm", method.args = list(family = "binomial")) +
  xlab("Blood Pressure") +
  ylab("Predicted Probabilities") +
  scale_color_manual(values = c("blue", "red"), labels = c("No Diabetes", "Diabetes")) +
  theme_minimal()
