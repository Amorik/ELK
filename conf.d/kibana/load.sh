#!/bin/bash
set -e
set -x

cd $(dirname $0)

if [ -z "$1" ]; then
    ELASTICSEARCH=http://127.0.0.1:9200
else
    ELASTICSEARCH=$1
fi

if [ -z "$2" ]; then
    CURL=curl
else
    CURL="curl --user $2"
fi

echo $CURL
DIR=dashboards

for file in $DIR/visualization/*.json
do
    name=`basename $file .json`
    echo "Loading visualization $name:"
    $CURL -XPUT $ELASTICSEARCH/.kibana/visualization/$name \
        -d @$file || exit 1
    echo
done

for file in $DIR/search/*.json
do
    name=`basename $file .json`
    echo "Loading search $name:"
    $CURL -XPUT $ELASTICSEARCH/.kibana/search/$name \
        -d @$file || exit 1
    echo
done

for file in $DIR/dashboard/*.json
do
    name=`basename $file .json`
    echo "Loading dashboard $name:"
    $CURL -XPUT $ELASTICSEARCH/.kibana/dashboard/$name \
        -d @$file || exit 1
    echo
done

