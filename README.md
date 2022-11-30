# Linux_Scraping_Project

This project aims to scrap the value of the $ATOM cryptocurrency every minute and send it to a Telegram bot.
In order to run the scripts periodically we use cron.

This project is composed of several scripts :

## script.sh

This script scraps the data from this [Coingecko Webpage](https://www.coingecko.com/fr/pi%C3%A8ces/cosmos-hub). We then select only the price part that interests us and send this value into a .txt file. Whenever this script is executed, it sends a Telegram notification every minute telling us the price and the date.

## tats.sh

This script calculates the min, max and percetange change of the values sent to the .txt file by our scrapping script. This script is executed every 15 minutes.

## value.sh

This script sends a .txt file containing all the values scrapped every day. It is sanitized so that it can be used for further analysis and contains the values with line breaks between each value.

## del.sh

This script deletes the mean.txt and value.txt files once a day in order to compute new values for each day.




