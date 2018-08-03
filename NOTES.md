RUBY CLI Project:

- Create a CLI project that scrapes websites for information on where and when bands/artists/DJs are playing. This application will show a list of artist, venues and dates to where and when they are touring.(The website that will be scraped from will be bigstub.com). Gigs CLI should function as follows:
    - Welcome notification
    - Asks the user for their favorite artist or any other artist.
    - The program accepts an input and modifies it is so that it can place it into the website string where it will search for the specific band.
    - Site is scraped.
    - Information is displayed.
    - After the initial artist has been displayed the user can then search for a different artist or see previous searches.
    - User can exit program anytime by typing ‘exit’ then pressing enter. 

- Create the CLI project using OO. There should be a class for each important attribute for the concert.  Classes are as follows:
    - Concert: contains all the concerts
    - Artists: contains all the artists
    - Venue: contains all the venues and dates

- Scraper Class:
    - It will scrape information such as artist, venue, and date.
    - After scraping the information we will create an instance Concert object for each concert and assign its attributes to these data values.

- Concert Class:
    - The class has four attributes and will be used by our Scraper class to create instance objects.
    - This class has 4 class methods show concerts from a user input, create concert objects, and print past searches.

- Artist Class
    - Creates an artist object with a venue attribute.

- Venue Class
    - Creates a Venue object with an artist and date attribute.

- CLI Class
    - Controls our UI and conditional sequence.

- Findable Class
    - Contains repetitive code that most classes use.


- Dependencies Used:
    - selenium-webdriver: For scraping JS rendered HTML. Creates an open headless browser and waits 5 seconds before throwing an exception. If we find our class name for scraping the headless driver quits and the source page gets saved. If however our class name doesn't exist the user has searched for an artist that doesn't exist or currently not touring.

    - nokogiri: For scraping HTML. Various data is scraped by using the '.css()' method.

    - colorize: For putting color in our CLI.
