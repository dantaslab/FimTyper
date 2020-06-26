===================
FimTyper
===================

This project documents FimTyper service


Documentation
=============

## What is it?

The FimTyper service contains one perl script *fimtyper.pl* which is the
script of the latest version of the FimTyper service. FimTyper identifies
the FimH type in total or partial sequenced isolates of E. coli.

## Content of the repository
1. fimtyper.pl  - the program
2. INSTALL_DB   - shell script for downloading the FimTyper database
3. UPDATE_DB    - shell script for updating the database to the newest version
4. VALIDATE_DB  - python script for verifying the database contains all
                  required files
5. brew.sh      - shell script for installing dependencies
6. makefile     - make script for installing dependencies
7. test.fsa     - test fasta file

## Installation

Setting up FimTyper
```bash
# Go to wanted location for fimtyper
cd /path/to/some/dir
# Clone and enter the fimtyper directory
git clone https://bitbucket.org/genomicepidemiology/fimtyper.git
cd fimtyper
```

Installing up the FimTyper database
```bash
cd /path/to/fimtyper
./INSTALL_DB database

# Check all DB scripts works, and validate the database is correct
./UPDATE_DB database
./VALIDATE_DB database
```

Installing dependencies:
Perlbrew is used to manage isolated perl environments. To install it run:
```bash
bash brew.sh
```

This will installed Perl 5.23 in the Home folder, along with CPAN minus as 
package manager.
Blast will also be installed when running brew.sh if blastn and makeblastdb are 
not already installed and place in the user's path.
After running brew.sh and installing Blast add this command to the end of your 
~/bash_profile to add blastn and makeblastdb to the user's path

```bash
export PATH=$PATH:ncbi-blast-2.6.0+/bin
```

If you want to download the two external tools from the Blast package yourself go to
```url
ftp://ftp.ncbi.nlm.nih.gov/blast/executables/release/LATEST
```

and download the version for your OS with the format:
```url
blast-version-architecture-OS.tar.gz
```

after unzipping the file, add this command to the end of your ~/bash_profile.
```bash
export PATH=$PATH:/path/to/blast-folder/bin
```

where path/to/blast-folder is the folder you unzipped.

At last FimTyper has several Perl dependencies. To install them (this requires 
CPAN minus as package manager):
```bash
make install
```

The scripts are self contained. You just have to copy them to where they should
be used.

Remember to add the program to your system path if you want to be able to 
invoke the program without calling the full path.
If you don't do that you have to write the full path to the program when using 
it.

## Test the scripts and database
```bash
cd /path/to/test_dir
cp /path/to/fimtyper/test.fsa .
perl /path/to/fimtyper/fimtyper.pl -d /path/to/fimtyper/database \
-b /path/to/blast/parent/dir -i test.fsa -k 95.00 -l 0.60
```

## Usage

The program can be invoked with the -h option to get help and more information 
of the service.

```bash
Usage: perl fimtyper.pl [options]

Options:

    -h HELP
                    Prints a message with options and information to the screen
    -d DATABASE
                    The path to where you have located the database folder
    -b BLAST
                    The path to the location of ncbi-blast-2.6.0+ if it is not
                    added to the users path (see the install guide in 'README.md')
    -i INFILE
                    Your input file which needs to be preassembled partial
                    or complete genomes in fasta format
    -o OUTFOLDER
                    The folder you want to have your output files places.
                    If not specified the program will create a folder named
                    'Output' in which the result files will be stored
    -k THRESHOLD
                    The threshold for % identity for example '95.00' for 95 %
    -l MIN_LENGHT
                    The minimum length of the overlap ex 0.60 for an overlap
                    of minimum 60 %
```

#### Example of use with the *database* folder is loacted in the current
#### directory and Blast added to the user's path
```perl 
    perl fimtyper.pl -i test.fsa -o OUTFOLDER -k 95.00 -l 0.60
```
#### Example of use with the *database* and *blast-2.2.26* folders loacted in
#### other directories
```perl
    perl fimtyper.pl -d path/to/database -b ncbi-blast-2.6.0+ \
    -i test.fsa -o OUTFOLDER -k 95.00 -l 0.60
```

## Web-server

A webserver implementing the methods is available at the [CGE 
website](http://www.genomicepidemiology.org/) and can be found here:
https://cge.cbs.dtu.dk/services/FimTyper/


## The Latest Version


The latest version can be found at
https://bitbucket.org/genomicepidemiology/fimtyper/overview

## Documentation


The documentation available as of the date of this release can be found at
https://bitbucket.org/genomicepidemiology/fimtyper/overview.

## Citation
For publication of results, please cite:

Development of a web tool for Escherichia coli subtyping based on fimh alleles.
Roer L, Tchesnokova V, Allesoe R, Muradova M, Chattopadhyay S, Ahrenfeldt J, Thomsen MCF, Lund O, Hansen F, Hammerum AM, Sokurenko E, and Hasman H.
J Clin Microbiol. 2017. 55(8): 2538-2543.
View the abstract


References
=======

1. Camacho C, Coulouris G, Avagyan V, Ma N, Papadopoulos J, Bealer K, Madden TL. BLAST+: architecture and applications. BMC Bioinformatics 2009; 10:421. 

License
=======

Copyright (c) 2014, Ole Lund, Technical University of Denmark
All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.