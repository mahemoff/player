#!/bin/bash
cd `dirname $0`/..
sass --watch style:style -r ./lib/bourbon/lib/bourbon.rb &
coffee --watch --compile script/*.coffee &
