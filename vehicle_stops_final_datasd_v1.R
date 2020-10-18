require(tidyr)
require(dplyr)


#1. Convert any blank observations to missing.

data = read.csv("vehicle_stops_final_datasd_v1.csv", header = TRUE, na.strings="")
names(data)
head(data)


data <- as.data.frame(data)
attach(data)

#2. Convert any observations of "Unknown" to missing.

data[data=="Unknown"] <- NA

#3. Address any miscoded observations in the variable subject_sex.
plot(subject_sex)
subject_sex

#There are three levels in the subject sex and U is not found in the 
#Data set code. So, could be a different category or a human error. 

str(subject_sex)

#We will set any value that does not match M, F, U to NA.

data$subject_sex[!(data$subject_sex == "F"|data$subject_sex == "M" | data$subject_sex == "U")] <- NA
data$subject_sex[!(data$subject_sex == "F"|data$subject_sex == "M")] <- NA
str(data$subject_sex)


#4. Address any unusual observations in the variable age.

#According to Guinness World Records, the world's oldest driver was American Fred Hale Sr. 
#who was on the road until his 108th birthday in 1998.

#source: https://www.today.com/news/man-105-still-driving-i-dont-think-im-old-6C10206499
#Minimum age to drive in the USA = 16
#Oldest knownperson to drive a car = 108

data$subject_age[(data$subject_age < 16| data$subject_age > 108)]<- NA

tail(data$subject_age)
head(data$subject_age)
data$subject_age
max(data$subject_age)
min(data$subject_age)
subject_age


#5. Recode/reclassify the subject_race to 5 "new" categories: Asian, Black, Hispanic, White,
#and Other (including any other race)



######################################################################
#data$subject_race <- as.character(data$subject_race)


Asian=c("A", "C", "D", "F", "I", "J", "K", "L", "V", "Z")
Black="B"
Hispanic="H"
White="W"
Other = c("G", "O", "P","S", "U") 


#########################################33
data$condensed_race <- factor(data$subject_race)
levels(data$condensed_race) <- list("Asian"= Asian, "Black"= Black, "White"= White, "Hispanic"= Hispanic, "Other"= Other)

str(data$condensed_race)
levels(data$condensed_race)


################################################################################

str(data)
saveRDS(data, file = "traffic_clean.rds") 







