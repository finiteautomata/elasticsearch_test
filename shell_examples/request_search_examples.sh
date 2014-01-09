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

echo "==========================================="
echo "This query get the titles in two pages of size 4"
echo "First page"
curl -XPOST $URL -d '{
    "from": 0,
    "size": 4,
    "fields": ["title"],
    "query": {   
        "match": {
            "text": "islands"
        }
    }

}'

echo "Second page"
curl -XPOST $URL -d '{
    "from": 4,
    "size": 4,
    "fields": ["title"],
    "query": {   
        "match": {
            "text": "islands"
        }
    }

}'

echo "==========================================="
echo "This query get all the titles of chapters that contain 'evolution' sorted by title"
echo "Obs: This may not work as expected because of: For string based types, the field sorted on should not be analyzed / tokenized (http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-request-sort.html)"

curl -XPOST $URL -d '{
    "fields": ["title"],
    "sort": [
        {"title" : {"order" : "asc"}}
    ],
    "query": {   
        "match": {
            "text": "evolution"
        }
    }

}'

echo "==========================================="
echo "This query get all the titles and number of chapters that contain 'evolution' within a partial called 'data'"
echo ""

curl -XPOST $URL -d '{
    "partial_fields" : {
        "data":  {
            "include": ["title", "numeral"]
        } 
    },
    "query": {   
        "match": {
            "text": "evolution"
        }
    }

}'
