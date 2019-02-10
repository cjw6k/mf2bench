#!/bin/bash

if [[ -n $MONO ]]; then
	language_color=
	parser_color=
	go_color=
	nogo_color=
	abort_color=
	reset=
else
	language_color=$(printf '\e[38;5;24m')
	parser_color=$(printf '\e[38;5;72m')
	go_color=$(printf '\e[38;5;234m')
	nogo_color=$(printf '\e[38;5;160m')
	abort_color=$(printf '\e[91m')
	launch_color=$(printf '\e[38;5;82m')
	e_color=$(printf '\e[38;5;8m')
	m_color=$(printf '\e[38;5;94m')
	o_color=$(printf '\e[38;5;186m')
	reset=$(printf '\e[0m')
fi

check_language() {
	echo "${language_color}$1?${reset}"
	command -v "$2" > /dev/null
	if [[ $? -ne 0 ]]; then
		echo " ${nogo_color}No go flight.${reset} $1 is required for a parser. See $3"
	else
		echo " ${go_color}Go flight.${reset}"

		[[ ! -d "var/$2" ]] && mkdir -p "var/$2"

		while [ ! -z $4 ]; do
			declare -a parser=("${!4}")
			shift

			idy=$(( $idy + 1 ))
			echo " * ${parser_color}${parser[0]}?${reset}"
			[[ ! -f "harness/${parser[0]}" ]] && mkdir -p "harness/${parser[0]}"
			${parser[1]} 2>"$tower_checklist"
			if [[ $? -ne 0 ]]; then
				echo "$e_color"`cat "$tower_checklist"`"$reset" | cowsay -W 120 -p
				echo "    ${nogo_color}No go flight.${reset} See ${parser[2]}"
			else
				parsers[$idx]="${parser[3]};"
				idx=$(( $idx + 1 ))
				echo "   ${go_color}Go flight.${reset}"
			fi
		done
	fi
}

main() {
	idx=0
	idy=0
	parsers=()	
	tower_checklist="preflight-safety-checklist.txt"
	
	[[ -f .mf2bench.conf ]] && rm .mf2bench.conf
	
	local ruby_microformats=("ruby/microformats-ruby" "ruby harness/ruby/microformats-ruby/preflight-check.rb" "https://rubygems.org/gems/microformats" "ruby/microformats-ruby|ruby harness/ruby/microformats-ruby/mf2.rb")
	check_language "Ruby" "ruby" "https://www.ruby-lang.org/en/documentation/installation/" ruby_microformats[@]

	local python_mf2py=("python/mf2py" "python3 harness/python/mf2py/preflight-check.py" "https://pypi.org/project/mf2py/" "python/mf2py|python3 harness/python/mf2py/mf2.py")
	check_language "Python3" "python3" "https://docs.python.org/3/using/unix.html#getting-and-installing-the-latest-version-of-python" python_mf2py[@]

	local php_mf2=("php/php-mf2" "php harness/php/php-mf2/preflight-check.php" "https://packagist.org/packages/mf2/mf2" "php/php-mf2|php harness/php/php-mf2/mf2.php")
	local php_mf2_mm_html5=("php/php-mf2-mm-html5" "php harness/php/php-mf2-mm-html5/preflight-check.php" "https://packagist.org/packages/masterminds/html5" "php/php-mf2-mm-html5|php harness/php/php-mf2-mm-html5/mf2.php")
	check_language "PHP" "php" "http://php.net/manual/en/install.php" php_mf2[@] php_mf2_mm_html5[@]

	local node_microformats_parser=("node/microformats-parser" "node harness/node/microformats-parser/preflight-check.js" "https://www.npmjs.com/package/microformat-node" "node/microformats-parser|node harness/node/microformats-parser/mf2.js")
	check_language "Node" "node" "https://nodejs.org/en/download/package-manager/" node_microformats_parser[@]

	local go_microformats=("go/microformats" "go run harness/go/microformats/preflight-check.go" "https://godoc.org/willnorris.com/go/microformats" "go/microformats|harness/go/microformats/mf2")
	check_language "Go" "go" "https://golang.org/doc/install" go_microformats[@]
	
	[[ -f "$tower_checklist" ]] && rm "$tower_checklist"
	
	echo
	if [[ 0 -lt "${#parsers[@]}" ]]; then
		for parser in "${parsers[@]}"; do
			echo "${parser}" >> .mf2bench.conf
		done
		echo "${launch_color}Go for mf2bench${reset} @ $idx/$idy."
	else
		echo "${abort_color}Abort.${reset} No parsers are available."
	fi	
}

main
