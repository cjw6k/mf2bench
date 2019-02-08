# mf2bench
Parse all the things! Time all the parsing! Diff all the JSON!

## In Active Development
The mf2bench software is in active development and has undergone limited testing.

| Operating System | OS Version | mf2bench Version | Does it work? | Reported By |
| ---------------- | ----------:| ----------------:|:-------------:| ----------- |
| Debian           | 10         | 0.1.0            | Nope          | [CJW](https://cjwillcock.ca/) |

Only the latest mf2bench version tested on a given OS & Version is listed here. For the complete list of contributing reports, and reports, see [Acknowledgements](#acknowledgements).

Kindly consider notifying [the author](https://cjwillcock.ca/) if you have success, or difficulty, with the various OS options. See [Contributing](#contributing) for a preferred venue.

## Installation
1. Clone this repository to a local folder.
2. Run the preflight check: `./preflight-check.sh`.
3. Add source URLs for the HTML to use for benchmarking.
   * To use the HTML from cjwillcock.ca: `mkdir var/sources/cjwillcock.ca`
   * Replace URL path separators with a triple underscore.
     * To use the HTML from cjwillcock.ca/now: `mkdir /var/sources/cjwillcock.ca___now`
4. 

## Contributing
Discussion in:
* #microformats on irc.freenode.net [(chat logs)](https://chat.indieweb.org/microformats)

## Changelog
All notable changes to this project will be documented in [CHANGELOG.md](CHANGELOG.md).

## Acknowledgements
The community that is [IndieWeb](https://indieweb.org/)!

The community that is [Microformats](http://microformats.org/)!

## License
Copyright © `2019` `Christopher James Willcock`
 
mf2bench is free software; you can redistribute it and/or modify it under the terms of the MIT License. See the [LICENSE.md](LICENSE.md) file for license rights and limitations (MIT).
