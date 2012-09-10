CURDIR=$(CURDIR)/continent

all:
	if [ ! -d continent ]; then git clone git@github.com:rithis/continent.git; fi
	make --directory continent --makefile ../Makefile subtree

subtree: pull BootstrapBundle

pull:
	git pull origin master:master

%Bundle:
	git subtree split --prefix src/Rithis/$@ --branch $@
	git checkout $@
	-git remote add $@ git@github.com:rithis/$@.git
	git push $@ $@:master
	git checkout master
