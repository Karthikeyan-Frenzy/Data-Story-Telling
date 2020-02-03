#crime<-read.csv("C:/Users/Karthikeyan/Desktop/crime.csv")
crime = read.csv('https://data.boston.gov/dataset/6220d948-eae2-4e4b-8723-2dc8e67722a3/resource/12cb3883-56f5-47de-afa5-3b1cf61b257b/download/crime_incident_reports.csv', sep = ",", na.strings =c('','NA','na','N/A','n/a','NaN','nan'), strip.white = TRUE, stringsAsFactors = FALSE)
crime
# Sometimes we need to be carefull when package ask us to remove the missing data.
library("ggplot2")
library("DataExplorer")

plot_missing(crime)
# Lets Rename the distrcit code to district name
district_name = c(
  A1 = 'Downtown',
  A15= 'Charlestown',
  A7= 'East Boston',
  B2= 'Roxbury',
  B3= 'Mattapan',
  C6= 'South Boston',
  C11= 'Dorchester',
  D4= 'South End',
  D14= 'Brighton',
  E5= 'West Roxbury',
  E13= 'Jamaica Plain',
  E18= 'Hyde Park')

district_name

# We will change all district code to district name by passing the following code.
crime$district <- as.factor(district_name[(crime$district)] )
#unique(crime$district)
sort(table(crime$district), decreasing = TRUE)
library("plotly")
crime$offense_category <- crime$offense_code_group
plot_crime_offense_category = plot_ly(crime, x = crime$offense_code_group, color = crime$offense_code_group) %>% 
  add_histogram() %>%
  layout(
    title = "Total Offense category count by the crime",
    xaxis = list(title = "Offense category",
                 yaxis = list(title = "Count"))
  )
plot_crime_offense_category

