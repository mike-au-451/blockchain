# World's Simplest Blockchain

This program was written for a short talk with the goal of showing that blockchains are not magic, or even complicated.

## Usage

	blockadd data-file block-file
	
Adds the data in *data-file* to the chain stored in *block-file*

## File Format

The blockchain is stored in a file.  Each block has a header, followed by the data, followed by a checksum of the whole file up to the end of the data.

The header is a single line starting with "BLOC", a tab, a raw data count, and the system time the block was added in UTC.  For example:

	BLOC	1234	Fri 31 Mar 00:45:05 UTC 2023

The data count is a 4 character hex number, so the maximum data size is 64K.

Itd possible to step through each nlock in the chain with grep.

## Example

	$ echo foo > foo.txt
	$ echo barbar > barbar.txt
	$ rm -f blockfile && touch blockfile
	$ blockadd foo.txt blockfile
	$ blockadd barbar.txt blockfile
	$ cat blockfile
	BLOC	0004	Fri 31 Mar 00:50:05 UTC 2023
	foo
	56ef7e7f6797aef7155474cea7437c63
	BLOC	0007	Fri 31 Mar 00:50:11 UTC 2023
	barbar
	aab8d0b594ee01c2f284570f6aad82dc

