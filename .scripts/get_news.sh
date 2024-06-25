#!/bin/sh

# requires jq

# Associated Press
cat /tmp/news.txt | jq '.["hub"] | .["data"] | .["/us-news"].cards | .[] | .contents | .[] | .headline, .firstWords, .storyHTML'
