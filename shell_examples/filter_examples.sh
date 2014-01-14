#! /bin/bash

echo "This is a query getting a facet grouping by department_name from the products that contain 'network' in their names, and a facet taking"
echo "The result is post-filtered so we only fetch the books. The facet, though, is still constructed with the original query"
URL='http://localhost:9200/products/_search?pretty=true'

curl -X POST "http://localhost:9200/products/_search?pretty=true" -d '{
    "fields": ["name"],
    "query" : {
        "match" : {
            "name" : "network"
        }
    },
    "facets" : {
        "departments" : { 
            "terms" : {
                "field" : "department_name"
            } 
        }
    },

    "post_filter" : {
        "term" : {
            "department_name_analyzed": "book"
        }
    }
}
'