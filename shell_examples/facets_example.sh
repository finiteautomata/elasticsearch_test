#! /bin/bash

echo "This is a query getting a facet grouping by department_name from the products that contain 'network' in their names, and a facet taking "
URL='http://localhost:9200/products/_search?pretty=true'

curl -X POST "http://localhost:9200/products/_search?pretty=true&search_type=count" -d '{
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
    }
}
'