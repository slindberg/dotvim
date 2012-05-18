INSTALLED = ./bundle
ACTIVE = ./active

all: submodule link helptags command-t

submodule:
	git submodule init
	git submodule update

link:
	mkdir -p ${ACTIVE}
	for file in ${INSTALLED}/*; do \
		ln -shf ../$$file ${ACTIVE}; \
	done

helptags:
	vim -c 'call pathogen#helptags()|q'

command-t:
	cd ./bundle/command-t/ruby/command-t; \
	ruby extconf.rb; \
	make

.PHONY: all submodule link helptags command-t
