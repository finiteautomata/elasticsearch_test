#! /bin/bash

echo "This is a query getting the titles from the two first chapters"
URL='http://localhost:9200/darwin-origin/_search?pretty=true'

curl $URL -XGET -d '{
  "query": {
      "match": {
        "text": "ddisland"
      }
    }
}'
