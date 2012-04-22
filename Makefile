all: submodule helptags command-t

submodule:
	git submodule init
	git submodule update

helptags:
	vim -c 'call pathogen#helptags()|q'

command-t:
	cd ./bundle/command-t/ruby/command-t; \
	ruby extconf.rb; \
	make

.PHONY: all submodule helptags command-t
