RUBY CLI Project:

- Create a CLI project that scrapes websites for information in where and when bands/artists/DJs are playing. This application will show a list of artist, venues and dates to where and when they are touring.(The website that will be scraped will be bigstub.com). Gigs CLI should function as follows:
    - Welcome notification
    - Asks the user for their favorite artist or any other artist.
    - The program accepts an input it should integrate that into the website string where it will search for the specific band.
    - Site is scraped.
    - Information is displayed.
    - After the initial artist has been displayed the user can then search for a different artist or see previous searches.
    - User can exit program by typing ‘exit’ then press enter. 
- Create the CLI project using OO. There should be a class for each important attribute for the concert.  Classes are as follows:
    - Concert: list of all the artists
    - Venue: list of all the venues
    - Dates: list of dates to when the concerts are taking place

- Scraper Class:
    - It will scrape information like band name, venue, time and date.
    - After scraping the information we will create an instance Concert object and assign its attributes as these data values.
    - The Scraper class has 2 class methods that will scrape website data and create Concert instance variables. 
- Concert Class:
    - The class has four attributes and will be used by our Scraper class to create instance objects.
    - This class will have two class methods show concerts from an artist name and show all concerts where it basically enumerates all the concerts the user has inputted in his search.  
