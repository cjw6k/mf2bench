#Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## UNRELEASED
### Changed
- mf2bench will not run without ministat
- relicensed this work to CC0 1.0

### Fixed
- error in output without cowsay program installed, now skips calling cowsay
- error in mf2bench when ministat is not installed

## 0.1.0
### Added
- php-ext/mf2 parser
- haskell/microformats2-parser
- elixir/microformats2
- perl/microformats2
- benchmarking
- node/microformats-node
- go/microformats
- python/mf2py
- Pre-flight check confirms node is available
- Script to refresh-sources anytime
- php/php-mf2 w/ Masterminds HTML5
- php/php-mf2
- Complex pre-flight check confirms languages and ready parsers in those languages are available
- Simple pre-flight check confirms ruby, python3, golang and php are available
- This CHANGELOG.md to track what's happening with this software.
- An altogether too brief [README.md](README.md).
- Licensed (MIT)* this work, see [LICENSE.md](LICENSE.md) for details.

\* the license was changed to CC0 1.0 on [2022-09-02 by cjw6k](https://github.com/cjw6k/mf2bench/commit/621bfef7bd9339c29321c1b00ac126dbfaeadbba)
