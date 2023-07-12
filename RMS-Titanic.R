setwd("/Users/rakinsadaftab/Library/CloudStorage/OneDrive-AmericanInternationalUniversity-Bangladesh/11th\ Semester/Data\ Science/Project")

rmstitanic <- read.csv("Titanic - Modified.csv")

View(rmstitanic)

rmstitanic$gender<-ifelse(rmstitanic$gender==0,"Male","Female")
rmstitanic$gender[is.na(rmstitanic$gender)] <- median(rmstitanic$gender, na.rm = TRUE)

rmstitanic$age[is.na(rmstitanic$age)] <- median(rmstitanic$age, na.rm = TRUE)
rmstitanic$age = as.numeric(format(round(rmstitanic$age,0)))
rmstitanic$age[rmstitanic$age == 365]<-36
rmstitanic$age[rmstitanic$age == 455]<-45
rmstitanic$age[rmstitanic$age == 325]<-32

rmstitanic$fare<-ceiling(rmstitanic$fare)
rmstitanic$fare[rmstitanic$fare == 247.5208]<-47
rmstitanic$fare[rmstitanic$fare == 263]<-63
rmstitanic$fare[rmstitanic$fare == 0] <- median(rmstitanic$fare, 0 == TRUE)

rmstitanic$embarked[rmstitanic$embarked == ""] <- NA
rmstitanic$embarked <- replace(rmstitanic$embarked, is.na(rmstitanic$embarked), "C")

rmstitanic$class[rmstitanic$class == ""] <- NA
rmstitanic$class <- replace(rmstitanic$class, is.na(rmstitanic$class), "Second")

rmstitanic$alone[rmstitanic$alone == "FALL"]<-"FALSE"

write.csv(rmstitanic, file = "RMS_Titanic - Modified.csv")