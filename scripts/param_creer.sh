#!/bin/bash

parallel echo {} ::: 3 5 7 ::: 4 6 8 > param.txt
cat param.txt
