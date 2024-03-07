#!/bin/bash

for field in $(cat ${1} | grep field | cut -f2 -d'"');
do
    echo "  \"${field}\": \"\","
done

