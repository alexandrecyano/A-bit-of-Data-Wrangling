# A bit of Data Wrangling
 A bit of Data Wrangling in R. 

##Part 1

Missing observations and “Unknown” were set to NA, but were not omitted. So, they are still presented in the dataset

New Variables - dcbikeshare.csv data
These are the new variables that were created:
1.	raw_temp = 47* temp+8 
2.	raw_feeling_temp = 66* atemp+16
3.	raw_humidity = 67*hum)
4.	raw_windspeed = 100*windspeed

The values were calculated by finding the inverse of each function and then applying it to the whole column. The variables were calculated using the formulas above. 
The other variables remained the same. They were just refactored into different levels/order.

instant record index
 dteday: date 
season: season (1:winter, 2:spring, 3:summer, 4:fall)
 yr year (0: 2011, 1:2012) 
mnth month ( 1 to 12)
 holiday whether day is holiday or not 
weekday day of the week
 workingday if day is neither weekend nor holiday is 1, otherwise is 0. 
weathersit weather description, coded as: 1 - clear, 2 - mist, 3 - light precipitation, and 4 - heavy precipitation


##Part 2

Dataset: “Vehicle Stops (Oct 2017 - June 2018, new format)” 
Q3: There are three levels in the subject sex according to the dataset. The variable “U” is not found in the dataset description code. So, could be either be a different category or simply a human error. In this case, only the variables that did not match this three categories were set to “NA”. 

Q4. According to the Guinness World Records, the world's oldest driver was Fred Hale Sr. who was on the road until his 108th birthday in 1998. So, 108 was our age threshold. Anything above 108 for age was nor considered. Similarly, age below 16 were also not considered as it the minimum  age required for driving. 
source: https://www.today.com/news/man-105-still-driving-i-dont-think-im-old-6C10206499

Q5.
First, a vector containing the letter for each race was create depending on their categories. After that, the levels were refactored using the new categories. Basically, the number of levels were reduced from 18 to 5.
Asian=c("A", "C", "D", "F", "I", "J", "K", "L", "V", "Z")
Black="B"
Hispanic="H"
White="W"
Other = c("G", "O", "P","S", "U")

