# mf2bench
Parse all the things! Time all the parsing!

To show your support for this project consider [adding your domain](var/sources/how_to_add_another_domain.md) to the list of sources parsed during the benchmarks.

> <strong>NOTE:</strong> mf2bench has undergone limited testing.

| High Score | Operating System | OS Version | mf2bench Version | Does it work? | Reported By |
| ---------- | ---------------- | ----------:| ----------------:|:-------------:| ----------- |
| 10 / 10    | Debian           | 10         | dev              | Yep           | [cjw6k](https://cj.w6k.ca/) |
| 2 / 5      | Debian           | 9.7        | unreleased       | Nope          | [cjw6k](https://cj.w6k.ca/) |

## Prerequisites
1. [ministat](https://github.com/codahale/ministat) - check your package manager
2. [cowsay](https://en.wikipedia.org/wiki/Cowsay) (optional) - check your package manager

## Installation
1. Clone this repository to a local folder: `git clone https://code.cjwillcock.ca/experiments/mf2bench.git ~/mf2bench && cd ~/mf2bench`.
2. Run the preflight check: `./preflight-check.sh`.
   * (optionally) without using terminal color: `MONO=1 ./preflight-check.sh`
3. Add source URLs for the HTML to use for benchmarking.
   * To use the HTML from example.com: `mkdir var/sources/example.com`
   * Replace URL path separators with a triple underscore.
     * To use the HTML from example.com/now: `mkdir /var/sources/example.com___now`.
   * Refresh the source samples: `./refresh-sources.sh`.
4. Run the benchmarks, specifying the number of samples per-source per-parser as the only parameter.
   * To parse each source ten (10) times with each parser: `./mf2bench 10`.
     * If the samples parameter is left out, mf2bench will use a default of three (3).
     * (optionally) without using terminal color: `MONO=1 ./mf2bench`

## Contributing
Discussion in:
* #microformats, see https://indieweb.org/discuss

## Changelog
All notable changes to this project will be documented in [CHANGELOG.md](CHANGELOG.md).

## Acknowledgements
The community that is [IndieWeb](https://indieweb.org/)!

The community that is [Microformats](http://microformats.org/)!
