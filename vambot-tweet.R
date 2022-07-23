library(httr)
library(rtweet)
library(jsonlite)


# Create Twitter token
vambot_token <- rtweet::rtweet_bot((
  api_key =    Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  api_secret = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")
)

random <- fromJSON("https://api.vam.ac.uk/v2/objects/search?random=1&page_size=1&images_exist=true")
records <- random$records
names(records)<-gsub("\\_","",names(records))
number <- records$systemNumber
title <- records$primaryTitle
imageID <- records$primaryImageId
objectType <- records$objectType
accession <- records$accessionNumber
location <- records$currentLocation$displayName
type <- records$currentLocation$type
site <- records$currentLocation$site
site <- switch(site, 'BH' = 'Blythe House', 'VA' = 'V&A')
type <- switch(type, 'display' = 'On display' )
hashtags <- '#art #design #museums'
imageUrl <- paste0('https://framemark.vam.ac.uk/collections/',imageID,'/full/full/0/default.jpg')
url <- paste0('https://collections.vam.ac.uk/item/',number)
tweet <- paste('From the V&A collection:', accession, objectType, title, site, type, location, url, hashtags, sep = ' ' )
temp_file <- tempfile(fileext = ".jpeg")
download.file(imageUrl, temp_file)

rtweet::post_tweet(
  status = tweet,
  media = temp_file,
  token = vambot_token
)
