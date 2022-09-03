SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

.PHONY: make-ready
make-ready: .mf2bench.conf var/sources/.source-refresh

.mf2bench.conf:
> ./preflight-check.sh

var/sources/.source-refresh: $(shell find var/sources -type d)
> ./refresh-sources.sh
> @touch var/sources/.source-refresh

.PHONY: clean distclean
clean:
> rm -rf var/sources/*/html

distclean:
> rm -f .mf2bench.conf
> rm -f var/sources/.source-refresh
> rm -rf var/sources/*
> mkdir var/sources/cj.w6k.ca
> touch var/sources/cj.w6k.ca/.gitkeep
