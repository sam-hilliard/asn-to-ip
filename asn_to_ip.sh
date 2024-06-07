#!/bin/bash

# Function to extract ASN number from input
extract_asn() {
    echo "$1" | sed 's/AS\([0-9]*\)/\1/'
}

# Function to get IP blocks for a given ASN
get_ip_blocks_for_asn() {
    local asn=$1
    whois -h whois.radb.net -- '-i origin AS'$asn | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]+'
}

# Check if input is provided as argument or via stdin
if [ "$1" = "-q" ]; then
    QUIET=true
    shift
fi

if [ $# -eq 1 ]; then
    # Single ASN provided as argument
    ASN=$(extract_asn "$1")
    if [ "$QUIET" = true ]; then
        get_ip_blocks_for_asn "$ASN"
    else
        echo "IP blocks for ASN $ASN:"
        get_ip_blocks_for_asn "$ASN"
        echo "-----------------------------------"
    fi
elif [ ! -t 0 ]; then
    # ASNs provided via stdin
    while read -r LINE; do
        ASN=$(extract_asn "$LINE")
        if [ "$QUIET" = true ]; then
            get_ip_blocks_for_asn "$ASN"
        else
            echo "IP blocks for ASN $ASN:"
            get_ip_blocks_for_asn "$ASN"
            echo "-----------------------------------"
        fi
    done
else
    echo "Usage: $0 [-q] <ASN> or cat asn.txt | $0 [-q]"
    exit 1
fi
