# Bitcoin Random Word Passphrase Generator
This script can be used to generate random passphrase words for bitcoin wallets.

Script's homepage: [Bitcoin Random Word Passphrase Generator](https://linuxconfig.org/how-to-generate-random-word-passphrase-for-bitcoin-wallet-on-linux-system)


## Prerequisites
The **Bitcoin Random Word Passphrase Generator** script requires **/usr/share/dict/words** wordlist file available on your system. Before using this script install wordlist from a standard repository of your Linux distribution.
```
UBUNTU / DEBIAN
# apt install wamerican-small

CENTOS / REDHAT:
# yum install words

FEDORA:
# dnf install words
```

## Usage
**bitcoin-passphrase-generator.sh** script requires a single argument to determine the number of random words to be generated

### Example
Generate 24 random keywords:
```
$ ./bitcoin-passphrase-generator.sh 24
Generating a random word list from 62887 words:
departures inebriated pecans riddles totter suspender grannie cures preachier refulgent uselessly crumpet swab plainclothesmen agendas calisthenic smothering enclosure pathetic skylarked whined clacks encores slogan
```
Generate 10 random keyword:
```
$ ./bitcoin-passphrase-generator.sh 10
Generating a random word list from 62887 words:
exigencies marchers sublet splicers transcends handling uninformative plowmen lumpiness diuretic
```

