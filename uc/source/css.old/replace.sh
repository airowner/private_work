#!/bin/bash

domain=http://s.gopo.com
path=`dirname $0`
cd $path

for i in `ls *.css`;
do
    sed -e "s#url(.*\?/images/#url(${domain}/images/#" $i > ../css/$i ;
done
