require(tidyr)



dcbikeshare = read.csv("dcbikeshare.csv", header = TRUE)
names(dcbikeshare)
head(dcbikeshare)

#1 - Recode the "season" variable to be a factor with meaningful level names, with spring as
#the baseline level.

dcbikeshare$season <- factor(x = dcbikeshare$season,
                                 levels = c(2,3,4,1), 
                                 labels = c("spring", "summer", "fall", "winter"))

str(dcbikeshare$seasoon)

dcbikeshare$season
#2. Recode the binary variables "holiday" and "workingday" to be factors with levels no (0)
#and yes (1), with no as the baseline level.

dcbikeshare$holiday <- factor(x = dcbikeshare$holiday,
                             levels = c(0,1), 
                             labels = c("no", "yes"))

str(dcbikeshare$holiday)

dcbikeshare$workingday <- factor(x = dcbikeshare$workingday,
                              levels = c(0,1), 
                              labels = c("no", "yes"))

str(dcbikeshare$workingday)
#3. Recode the "yr" variable to be a factor with levels 2011 and 2012, with 2011 as the
#baseline level.

dcbikeshare$yr <- factor(x = dcbikeshare$yr,
                                 levels = c(0,1), 
                                 labels = c("2011", "2012"))

str(dcbikeshare$yr)

#4. Recode the "weathersit" variable as 1 - clear, 2 - mist, 3 - light precipitation, and 4 -
#  heavy precipitation, with clear as the baseline.

dcbikeshare$weathersit <- factor(x = dcbikeshare$weathersit,
                         levels = c(1,2,3,4), 
                         labels = c("clear", "mist", "light precipitation", "heavy precipitation"))

str(dcbikeshare$weathersit)



#5. Calculate raw temperature, feeling temperature, humidity, and windspeed as their
#values given in the dataset, undoing the normalizing function described in the variables
#list. Instead of writing over the existing variables, create new ones with concise but
#informative names.

dcbikeshare <- dcbikeshare %>% 
  mutate( raw_temp = 47* temp+8 )

dcbikeshare <- dcbikeshare %>%
  mutate( raw_feeling_temp = 66* atemp+16)


dcbikeshare <- dcbikeshare %>%
  mutate(raw_humidity = 67*hum)

dcbikeshare <- dcbikeshare %>%
  mutate(raw_windspeed = 100*windspeed)

#6. Check that the sum of "casual" and "registered" adds up to "cnt" for each record.

p <- dcbikeshare$casual+ dcbikeshare$registered
identical(p,dcbikeshare$cnt)

#Yes, the the sum of "casual" and "registered" adds up to "cnt" for each record.


saveRDS(dcbikeshare, file = "dcbikeshare.RDS") 

