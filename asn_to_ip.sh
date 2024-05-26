#!/bin/bash

# Function to get IP blocks for a given ASN
get_ip_blocks_for_asn() {
    local asn=$1
    whois -h whois.radb.net -- '-i origin AS'$asn | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]+'
}

# Check if input is provided as argument or via stdin
if [ $# -eq 1 ]; then
    # Single ASN provided as argument
    ASNS=$1
elif [ ! -t 0 ]; then
    # ASNs provided via stdin
    ASNS=$(cat)
else
    echo "Usage: $0 <ASN> or cat asn.txt | $0"
    exit 1
fi

# Process each ASN
for ASN in $ASNS; do
    echo "IP blocks for ASN $ASN:"
    get_ip_blocks_for_asn "$ASN"
    echo "-----------------------------------"
done

