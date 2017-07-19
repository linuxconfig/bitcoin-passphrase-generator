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
**bitcoin-passphrase-generator.sh** script requires two arguments:
- the first argument determines the number of random words generated
- the second argument determines specifies the number of characters per word

### Example
Generate five random keywords with eight characters per word:
```
$ ./bitcoin-passphrase-generator.sh 5 8
kickoffs toiletry brothers cowlings boarders
```
Generate ten random keywords with five characters per word:
```
$ ./bitcoin-passphrase-generator.sh 10 5
yowls vasts paddy nanny toast loved nerds based bunks rover
```

## Word lists

The following table shows the number of words available per requested number of characters. Depending on the version of wordlist version installed on your system the below numbers may vary:

| Number of Characters | Number of Words |
| --- |---| 
| 1 | 26 |
| 2 | 64 |
| 3 | 586 |
| 4 | 2345 |
| 5 | 4581 |
| 6 | 7237 |
| 7 | 9843 |
| 8 | 10396 |
| 9 | 9228 |
| 10 | 7334 |
| 11 | 5018 |
| 12 | 3178 |
| 13 | 1779 |
| 14 | 789 |
| 15 | 369 |
