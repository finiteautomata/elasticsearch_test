#! /bin/bash
echo "======================================"
echo "This gets first chapter"
curl -XGET 'http://localhost:9200/darwin-origin/chapter/I?pretty=true'

echo "======================================"
echo "This gets first chapter, but just the title"
curl -XGET 'http://localhost:9200/darwin-origin/chapter/I?fields=title&pretty=true'

echo "======================================"
echo "This gets second chapter title, using subobject extraction (from _source)"
curl -XGET 'http://localhost:9200/darwin-origin/chapter/I?fields=_source.title&pretty=true'