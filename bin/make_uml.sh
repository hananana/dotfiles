#!/bin/bash
java -jar /usr/local/Cellar/plantuml/8048/libexec/plantuml.jar -tpng $0
open ${@%%.*}.png
