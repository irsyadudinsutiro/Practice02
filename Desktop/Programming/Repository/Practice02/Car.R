library(RCurl)
library(stringr)
cars_html <- getURLContent ("https://en.wikipedia.org/wiki/Comma-separated_values")
cars_csv <- str_match(cars_html, "<pre>(Year,Make,Model,Description,Price\\n(.+\\n)+?)</pre>")
print(cars_csv[1,2])
cars_data <- read.csv(text = cars_csv[1,2])
print(cars_data)

write.csv(cars_data,file ="car.csv")