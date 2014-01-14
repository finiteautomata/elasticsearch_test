#! /bin/bash

echo "This is a query getting a facet grouping by department_name from the products that contain 'network' in their names, and a facet taking"
echo "The result is filtered so we only fetch the books. The facet, though, is still constructed with the original query"
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

    "filter" : {
        "bool": {
            "must": {
                "term" : {
                    "department_name_analyzed" : "book"
                }   
            }
        }   
    }
}
'
echo "This is a query getting a facet grouping by department_name from the products that contain 'network' in their names, and a facet taking"
echo "The result is filtered so we only fetch the books. The facet, though, is still constructed with the original query"
URL='http://localhost:9200/products/_search?pretty=true'

curl -X POST "http://localhost:9200/products/_search?pretty=true" -d '{

    "facets" : {
        "departments" : { 
            "terms" : {
                "field" : "department_name"
            } 
        }
    },

    "query": {
       "filtered" : {
            "query": {
                "match" : {
                    "name" : "network"
                }
            },

            "filter" : {
                "bool": {
                    "should": [
                        { "term" : {"department_name" : "Books"}},
                        { "term" : {"department_name" : "Electronics"}}
                    ]            
                }   
            }
        }

    }
}
'
