# mf2bench
Parse all the things! Time all the parsing!

To show your support for this project consider [adding your domain](var/how_to_add_another_domain.md) to the list of sources parsed during the benchmarks. If you're here for the code, try adding a row to the results table below!

Parser Authors: [open an issue](https://github.com/cjw6k/mf2bench/issues) to organize a new parser harness, or PR it up!

Check the current open issues to see what needs help.

| High Score | Operating System   | OS Version | mf2bench Version | Does it work? | Reported By |
| ---------- | ------------------ | ----------:| ----------------:|:-------------:| ----------- |
| 2 / 9      | win11/wsl2: gentoo | sync +24h  | branch: main     | Yep           | [cjw6k](https://cj.w6k.ca/) |

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

## Contributing
Discussion in:
* #microformats, see https://indieweb.org/discuss

## Changelog
All notable changes to this project will be documented in [CHANGELOG.md](CHANGELOG.md).

## Acknowledgements
The community that is [IndieWeb](https://indieweb.org/)!

The community that is [Microformats](http://microformats.org/)!
