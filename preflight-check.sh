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
		while [ ! -z $4 ]; do
			declare -a parser=("${!4}")
			shift

			idy=$(( $idy + 1 ))
		done
	else
		echo " ${go_color}Go flight.${reset}"

		[[ ! -d "var/$2" ]] && mkdir -p "var/$2"

		while [ ! -z $4 ]; do
			declare -a parser=("${!4}")
			shift

			idy=$(( $idy + 1 ))
			echo " * ${parser_color}${parser[0]}?${reset}"
			[[ ! -f "benches/${parser[0]}" ]] && mkdir -p "benches/${parser[0]}"

			$(eval "${parser[1]}" 2>"$tower_checklist")
			if [[ $? -ne 0 ]]; then
				tmp="${e_color}`cat $tower_checklist`${reset}"
				echo "$tmp"
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

	local ruby_microformats=("ruby/microformats-ruby" \
		"ruby benches/ruby/microformats-ruby/preflight-check.rb" \
		"https://rubygems.org/gems/microformats" \
		"ruby/microformats-ruby|ruby benches/ruby/microformats-ruby/mf2.rb" \
	)
	check_language "Ruby" "ruby" \
		"https://www.ruby-lang.org/en/documentation/installation/" \
		ruby_microformats[@]

	local python_mf2py=("python/mf2py" \
		"python3 benches/python/mf2py/preflight-check.py" \
		"https://pypi.org/project/mf2py/" \
		"python/mf2py|python3 benches/python/mf2py/mf2.py" \
	)
	check_language "Python3" "python3" \
		"https://docs.python.org/3/using/unix.html#getting-and-installing-the-latest-version-of-python" \
		python_mf2py[@]

	local php_mf2=("php/php-mf2" \
		"php benches/php/php-mf2/preflight-check.php" \
		"https://packagist.org/packages/mf2/mf2" \
		"php/php-mf2|php benches/php/php-mf2/mf2.php" \
	)
	local php_mf2_mm_html5=("php/php-mf2-mm-html5" \
		"php benches/php/php-mf2-mm-html5/preflight-check.php" \
		"https://packagist.org/packages/masterminds/html5" \
		"php/php-mf2-mm-html5|php benches/php/php-mf2-mm-html5/mf2.php" \
	)
	check_language "PHP" "php" \
		"http://php.net/manual/en/install.php" \
		php_mf2[@] \
		php_mf2_mm_html5[@]

	local node_microformats_parser=("node/microformats-parser" \
		"node benches/node/microformats-parser/preflight-check.js" \
		"https://www.npmjs.com/package/microformat-node" \
		"node/microformats-parser|node benches/node/microformats-parser/mf2.js" \
	)
	check_language "Node" "node" \
		"https://nodejs.org/en/download/package-manager/" \
		node_microformats_parser[@]

	local go_microformats=("go/microformats" \
		"go run benches/go/microformats/preflight-check.go" \
		"https://godoc.org/willnorris.com/go/microformats" \
		"go/microformats|benches/go/microformats/mf2.sh" \
	)
	check_language "Go" "go" \
		"https://golang.org/doc/install" \
		go_microformats[@]

	local perl_microformats2=("perl/microformats2" \
		"perl benches/perl/microformats2/preflight-check.pl" \
		"https://metacpan.org/pod/release/JMAC/Web-Microformats2-0.3/lib/Web/Microformats2.pm" \
		"perl/microformats2|perl benches/perl/microformats2/mf2.pl" \
	)
	check_language "Perl" "perl" \
		"https://www.perl.org/get.html" \
		perl_microformats2[@]

	local elixir_microformats2=("elixir/microformats2" \
		"cd benches/elixir/microformats2; mix PreflightCheck > /dev/null" \
		"https://hex.pm/packages/microformats2" \
		"elixir/microformats2|benches/elixir/microformats2/mf2" \
	)
	check_language "Elixir" "elixir" \
		"https://elixir-lang.org/install.html" \
		elixir_microformats2[@]

	local haskell_microformats2_parser=("haskell/microformats2-parser" \
		"cd benches/haskell/microformats2-parser; stack exec preflight-check && if [[ ! -f mf2 ]]; then echo 'Create a symbolic link to the mf2 executable in benches/haskell/microformats2-parser' 1>&2 && return 1; fi" \
		"https://hackage.haskell.org/package/microformats2-parser" \
		"haskell/microformats2-parser|benches/haskell/microformats2-parser/mf2" \
	)
	check_language "Haskell" "ghci" \
		"https://www.haskell.org/platform/linux.html" \
		haskell_microformats2_parser[@]

	[[ -f "$tower_checklist" ]] && rm "$tower_checklist"

	echo
	if [[ 0 -lt "${#parsers[@]}" ]]; then
		for parser in "${parsers[@]}"; do
			echo "${parser}" >> .mf2bench.conf
		done
		echo "${launch_color}Go for mf2bench${reset} @ $idx/$idy."
		exit 0
	else
		echo "${abort_color}Abort.${reset} No parsers are available."
		exit 1
	fi
}

main
