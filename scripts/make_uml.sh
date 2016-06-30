#!/bin/bash
java -jar /usr/local/Cellar/plantuml/8037/plantuml.8037.jar -tpng $@
open ${@%%.*}.png
