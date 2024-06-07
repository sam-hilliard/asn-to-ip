# asn_to_ip

`asn_to_ip.sh` is a bash script used to find the IP blocks given a single ASN or a list of ASNs. This script queries the whois.radb.net service to retrieve IP blocks associated with the specified ASNs.

## Purpose

The purpose of `asn_to_ip.sh` is to facilitate the identification of IP blocks assigned to Autonomous System Numbers (ASNs) during reconnaissance activities. This information is valuable for understanding the network infrastructure associated with a particular ASN and can aid in security assessments and investigations.

## Usage

### Running asn_to_ip.sh

To use `asn_to_ip.sh`, provide a single ASN as an argument, or pipe a list of ASNs directly into the script. Optionally, you can use the `-q` flag for quiet mode, which only outputs the IP blocks separated by newlines.

```bash
./asn_to_ip.sh AS12345
```

or

```bash
cat asns.txt | ./asn_to_ip.sh
```

To enable quiet mode:

```bash
./asn_to_ip.sh -q AS12345
```

or

```bash
cat asns.txt | ./asn_to_ip.sh -q
```

### Example Usage

Suppose `asns.txt` contains the following list of ASNs:
```
AS12345
AS67890
```

Running `asn_to_ip.sh` with this file will produce the following output:
```
IP blocks for ASN AS12345:
[IP block 1]
[IP block 2]
...

-----------------------------------
IP blocks for ASN AS67890:
[IP block 1]
[IP block 2]
...

-----------------------------------
```

If running in quiet mode, the output will only consist of the IP blocks separated by newlines.

### Notes

- The script retrieves IP blocks using the whois.radb.net service.
- Ensure that the input file is formatted correctly, with one ASN per line.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.
