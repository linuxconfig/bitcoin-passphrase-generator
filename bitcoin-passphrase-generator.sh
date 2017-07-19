#!/bin/bash 
 
# Bitcoin wallet random passphrase word generator
 
if [ $# -ne 2 ]; then 
    echo "Please specify how many random words would you like to generate and a number of characters per word !" 1>&2 
    echo "example: ./random-word-generator 5 8" 1>&2 
    echo "This will generate 5 random words with 8 characters per word" 1>&2 
    exit 1
fi 

if [ ! -f "/usr/share/dict/words" ]; then
    echo "Wordlist is not available. To install execute:"
    echo "UBUNTU / DEBIAN"
    echo "# apt install wamerican-small"
    echo "CENTOS / REDHAT:"
    echo "yum install words"
    echo "FEDORA:"
    echo "dnf install words"
    exit 1
fi

# WHILE LOOP START CONDICTION
X=0
# WHILE LOOP STOP CONDICTION. SUPPLIED VIA COMMAND LINE ARGUMENT. DETERMINES THE NUMBER OF RANDOM WORDS GENERATED
Y=$1
# PATH TO TEMPORARY FILE TO HOLD ALL NON-RANDOM WORDS
ALL_NON_RANDOM_WORDS=`tempfile`
# NUMBER OF CHARACTERS PER WORD. SUPPLIED VIA COMMAND LINE ARGUMENT. DETERMINES THE NUMBER OF CHARACTERS PER WORD
CHARS=$2

if [ $CHARS -lt 1 ] || [ $CHARS -gt 15 ]; then
    echo "Number of characters per word should be >= 1 AND =< 15"
    exit 1
fi

# GENERATE LIST OF NON-RANDOM WORDS
grep "^[a-z]\+$"  /usr/share/dict/words |  grep -E "^.{$CHARS}$" > $ALL_NON_RANDOM_WORDS
 
# GET A TOTAL NUMBER OF NON-RANDOM WORDS AVAILABLE 
words_total=`wc -l $ALL_NON_RANDOM_WORDS` 
 
# WHILE LOOP TO GENERATE REQUESTED NUMBER OF RANDOM KEYWORDS  
while [ "$X" -lt "$Y" ]; do 
    random_number=`od -N3 -An -i /dev/urandom | awk -v f=0 -v r="$words_total" '{printf "%i", f + r * $Y / 16777216}'` 
    sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS | tr '\r\n' ' '
    let "X = X + 1" 
done
echo 
# REMOVE NON-RANDOM WORD LIST
rm $ALL_NON_RANDOM_WORDS
