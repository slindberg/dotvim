INSTALLED = ./bundle
ACTIVE = ./active

all: submodule link helptags command-t

submodule:
	@ echo "Initializing submodules..."
	@ git submodule init
	@ git submodule update

link:
	@ echo "Linking all bundles..."
	@ mkdir -p ${ACTIVE}
	@ for file in ${INSTALLED}/*; do \
			ln -shf ../$$file ${ACTIVE}; \
		done

helptags:
	@ echo "Generating helptags..."
	@ vim -c 'call pathogen#helptags()|q'

command-t:
	@ echo "Installing Command-T C extension"
	@ cd ./bundle/command-t/ruby/command-t; \
		ruby extconf.rb; \
		make

.PHONY: all submodule link helptags command-t
