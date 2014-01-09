#! /bin/bash

echo "This is a query getting the titles from the all the chapters containing island in the text"
URL='http://localhost:9200/darwin-origin/_search?pretty=true'

curl -XPOST $URL -d '{
    "fields": ["title"],
    "query": {
        
        "match": {
            "text": "islands"
        }
    }
}'
