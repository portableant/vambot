# VAMBot

A simple Twitter bot that tweets details from the [V&A Museum API v2](https://www.vam.ac.uk/blog/digital/va-launches-new-developer-api) (released 15/4/2021), which is well [documented by their team](https://developers.vam.ac.uk/guide/v2/welcome.html).

This bot is an R script, powered via a Github action. Inspired a bit by Londonmapbot's code which showed me how to automate the R script via an action. 

This script calls a random object from the collections with an image attached, constructs a tweet and sends it with the url for the record.

## How to run this


1. Create a Twitter account for your bot
2. Sign up for a developer access with [Twitter](https://developer.twitter.com/en/apply-for-access)
3. Fork this repo (or just copy the code into a new repo)
4. Get your API keys from MapBox and Twitter and add them as [GitHub secrets](https://docs.github.com/en/actions/reference/encrypted-secrets) to your repo
5. Edit variables retrieved from the api in the `vambot-tweet.R` file 
6. Adjust the `.github/workflows/vambot.yml` file to adjust [the cron schedule](https://crontab.guru/#10_*_*_*_*) if you want
7. GitHub Actions will recognise the .yml file and execute the code on schedule

## License
GPL V3
