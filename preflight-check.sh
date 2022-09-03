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

#	check_language "Ruby" "ruby" \
#		"https://www.ruby-lang.org/en/documentation/installation/" \
#		...[@]
#
#	check_language "Python3" "python3" \
#		"https://docs.python.org/3/using/unix.html#getting-and-installing-the-latest-version-of-python" \
#		...[@]
#
#	check_language "PHP" "php" \
#		"http://php.net/manual/en/install.php" \
#		...
#
#	check_language "JavaScript (node)" "node" \
#		"https://nodejs.org/en/download/package-manager/" \
#		...[@]
#
#	check_language "Go" "go" \
#		"https://golang.org/doc/install" \
#		...[@]
#
#	check_language "Perl" "perl" \
#		"https://www.perl.org/get.html" \
#		...[@]
#
#	check_language "Elixir" "elixir" \
#		"https://elixir-lang.org/install.html" \
#		...[@]
#
#	check_language "Haskell" "ghci" \
#		"https://www.haskell.org/platform/linux.html" \
#		...[@]

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
