install:
	cpanm CJFIELDS/BioPerl-1.6.924.tar.gz --force
	cpanm Data::Dumper
	cpanm Getopt::Long
	cpanm File::Temp
   cpanm Try::Tiny::Retry
clean:
	find ./ -name "*.DS_Store" -delete
	find ./ -name "*.log" -delete
	find ./ -name "*.gz" -delete
