INSTALLED = ./bundle
ACTIVE = ./active

default: submodule link helptags

all: default spell command-t

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
	@ vim -c 'Helptags|q'

spell:
	@ echo "Generating Vim spell file..."
	@ vim -c 'mkspell! spell/en.utf-8.add|q'

command-t:
	@ echo "Installing Command-T C extension..."
	@ cd ./bundle/command-t/ruby/command-t; \
		/usr/bin/ruby extconf.rb; \
		make

.PHONY: default all submodule link helptags spell command-t
