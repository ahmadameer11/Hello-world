# installing library
install.packages("rvest")
library(rvest)
#Specifying url of website to be scrapped
url <- "http://www.simi.ie/Taxation/Motor+Tax/Motor+Tax+Rates+on+Co2+Emissions.html"
str(url)
# reading html code
web_page <- read_html(url)
str(web_page)
# scraping band column from website
band_html <- html_nodes(web_page, 'td:nth-child(1)')
band <- html_text(band_html)
band
str(band)
# scraping emmission column from website
emmission_html <- html_nodes(web_page, 'td:nth-child(2)')
emmission <- html_text(emmission_html)
emmission
str(emmission)
# scraping annual column from website
annual_html <- html_nodes(web_page, 'tr:nth-child(n) > td:nth-child(3)')
annual <- html_text(annual_html)
annual
str(annual)

# scraping half yearly column from website
HalfYearly_html <- html_nodes(web_page, 'tr:nth-child(n) > td:nth-child(4)')
HalfYearly <- html_text(HalfYearly_html)
HalfYearly
str(HalfYearly)
# scraping Quaterly column from website
Quarterly_html <- html_nodes(web_page, 'tr:nth-child(n) > td:nth-child(5)')
Quarterly <- html_text(Quarterly_html)
Quarterly
str(Quarterly)
# scraping Arreas column from website
Arrears_html <- html_nodes(web_page, 'tr:nth-child(n) > td:nth-child(6)')
Arrears <- html_text(Arrears_html)
Arrears
str(Arrears)
# creating a data frame 
Motor_TaxRates_on_Co2Emissions <- data.frame(band, emmission, annual, HalfYearly, Quarterly, Arrears)
str(Motor_TaxRates_on_Co2Emissions)
Motor_TaxRates_on_Co2Emissions <- Motor_TaxRates_on_Co2Emissions[-c(13),] # removing the summary row from the dataframe.
Motor_TaxRates_on_Co2Emissions
str(Motor_TaxRates_on_Co2Emissions)
# writing csv file
write.csv(Motor_TaxRates_on_Co2Emissions, file = 'Motor_TaxRates_on_Co2Emissions.csv', row.names = FALSE)
# reading csv
Motor_TaxRates_on_Co2Emissions_csv <- read.csv('Motor_TaxRates_on_Co2Emissions.csv')
head(Motor_TaxRates_on_Co2Emissions_csv)
str(Motor_TaxRates_on_Co2Emissions_csv)