#!/bin/bash 
 
# Bitcoin wallet random passphrase word generator
# Provided by https://linuxconfig.org
 
if [ $# -ne 1 ]; then 
    echo "Please specify how many random words would you like to generate!" 1>&2 
    echo "example: ./random-word-generator 5" 1>&2 
    echo "This will generate 5 random words" 1>&2 
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
# WHILE LOOP STOP CONDICTION. SUPPLIED VIA COMMAND LINE ARGUMENT. DETERMINES THE NUMBER OF RANDOM WORDS TO BE GENERATED
Y=$1
# PATH TO A TEMPORARY FILE TO HOLD ALL NON-RANDOM WORDS
ALL_NON_RANDOM_WORDS=`mktemp`

# GENERATE A CLEAN LIST OF NON-RANDOM WORDS BY REMOVING WORDS WITH ACCENT CHARACTERS AND NAMES IDENTIFIED BY CAPITAL LETTERS
grep "^[a-z]\+$"  /usr/share/dict/words | grep  -vP  "[\x80-\xFF]" > $ALL_NON_RANDOM_WORDS
 
# GET A TOTAL NUMBER OF NON-RANDOM WORDS AVAILABLE 
words_total=`cat $ALL_NON_RANDOM_WORDS | wc -l` 
 
# WHILE LOOP TO GENERATE REQUESTED NUMBER OF RANDOM KEYWORDS
echo "Generating a random word list from $words_total words:"
while [ "$X" -lt "$Y" ]; do 
    random_number=`od -N3 -An -i /dev/urandom | awk -v f=0 -v r="$words_total" '{printf "%i", f + r * $Y / 16777216}'` 
    sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS | tr '\r\n' ' '
    let "X = X + 1" 
done
echo 
# REMOVE NON-RANDOM WORD LIST
rm $ALL_NON_RANDOM_WORDS
