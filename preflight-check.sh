#!/bin/bash

[[ -f .ready ]] && rm .ready

command -v ruby > /dev/null
[[ $? -ne 0 ]] && echo "Ruby is required. https://www.ruby-lang.org/en/documentation/installation/" && exit

command -v python3 > /dev/null
[[ $? -ne 0 ]] && echo "Python3 is required. https://docs.python.org/3/using/unix.html#getting-and-installing-the-latest-version-of-python" && exit

command -v php > /dev/null
[[ $? -ne 0 ]] && echo "PHP is required. http://php.net/manual/en/install.php" && exit

command -v go > /dev/null
[[ $? -ne 0 ]] && echo "Golang is required. https://golang.org/doc/install" && exit

touch .ready

echo "go flight"
