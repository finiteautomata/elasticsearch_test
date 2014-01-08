#! /bin/bash

echo "This will get first chapter's title using search by query string"
export QUERY='http://localhost:9200/darwin-origin/chapter/_search?q=numeral:I&fields=title&pretty=true'
echo "Getting $QUERY"
curl -XGET $QUERY

echo "This will count chapters having 'VARIATION' on their title"
export QUERY='http://localhost:9200/darwin-origin/chapter/_search?q=title:VARIATION&search_type=count&pretty=true'
echo "Getting $QUERY"
curl -XGET $QUERY

echo "This will count chapters having 'island' on their text (or any kind of similar word)"
export QUERY='http://localhost:9200/darwin-origin/chapter/_search?q=text:island&analyzer=snowball&fields=title&pretty=true&sort=numeral'
echo "Getting $QUERY"
curl -XGET $QUERY


