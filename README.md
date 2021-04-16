# VAMBot

A simple Twitter bot that tweets details from the [V&A Museum API v2](https://www.vam.ac.uk/blog/digital/va-launches-new-developer-api) (released 15/4/2021), which is well [documented by their team](https://developers.vam.ac.uk/guide/v2/welcome.html).

This bot is an R script, powered via a Github action. Inspired a bit by Londonmapbot's code which showed me how to automate the R script via an action. 

This script calls a random object from the collections with an image attached, constructs a tweet and sends it with the url for the record.

To run this yourself, you will need to create a Twitter account and then an app after applying for a developer account. Once you have done that, set the secrets as required in the script under github settings > secrets. 

To set the frequency of the tweetbot, adapt the script in the workflows folder. 

## License
GPL V3
