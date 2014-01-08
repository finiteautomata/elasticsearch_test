#! /bin/bash

echo "This gets first two chapters passing index as option"
curl 'localhost:9200/_mget?pretty=true' -d '{

    "docs" : [
        {
            "_index" : "darwin-origin",
            "_id" : "I",
            "fields": ["title"]
        },
        {
            "_index" : "darwin-origin",
            "_id" : "II",
            "fields": ["title"]
        }
    ]
}'

echo "This gets first two chapters but directly passing index in the path"

curl 'localhost:9200/darwin-origin/_mget?pretty=true' -d '{

    "docs" : [
        {
            "_id" : "I",
            "fields": ["title"]
        },
        {
            "_id" : "II",
            "fields": ["title"]
        }
    ]
}'

echo "Finally, this also adds mapping"

curl 'localhost:9200/darwin-origin/chapter/_mget?pretty=true' -d '{

    "docs" : [
        {
            "_id" : "I",
            "fields": ["title"]
        },
        {
            "_id" : "II",
            "fields": ["title"]
        }
    ]
}'
