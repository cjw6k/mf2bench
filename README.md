# mf2bench
Parse all the things! Time all the parsing!

To show your support for this project consider [adding your domain](var/how_to_add_another_domain.md) to the list of sources parsed during the benchmarks.  

Parser Authors: [open an issue](https://github.com/cjw6k/mf2bench/issues) to organize a new parser bench test, or PR it up! 🚀

Check the current open issues to see what needs help.

## Prerequisites
1. [ministat](https://github.com/codahale/ministat) - check your package manager

## Ready, Set, Parse
1. Run the preflight check: `./preflight-check.sh`.
   * (optionally) without using terminal color: `MONO=1 ./preflight-check.sh`
2. Refresh the source samples: `./refresh-sources.sh`.
3. Run the benchmarks: `./mf2bench`
   * (optionally) without using terminal color: `MONO=1 ./mf2bench`
   * To parse each source ten (10) times with each parser: `./mf2bench 10`.
   * The default is three (3).

## Adding More Sources
* To use the HTML from example.com: `mkdir var/sources/example.com`
* Replace URL path separators with a triple underscore.
  * To use the HTML from example.com/now: `mkdir /var/sources/example.com___now`.

## Acknowledgements
See [ACK.md](ACK.md)
