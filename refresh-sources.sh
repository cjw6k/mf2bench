#!/bin/bash

for domain in var/sources/*; do
	wget "$(echo ${domain#"var/sources/"} | sed 's/___/\//' )" -nv -O "$domain/html"
done

echo "Ready to benchmark"

