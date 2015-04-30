bower_components:=$(shell find bower_components -type f)

all: dist.zip

dist/bower_components/%: bower_components/%
	mkdir -p $(@D)
	cp $< $@

dist/assets/%: assets/%
	mkdir -p dist/assets
	cp $< $@

dist/index.html: index.html
	mkdir -p dist
	cp $< $@

dist.zip: dist/index.html dist/assets/harness.js dist/assets/harness.css dist/assets/favicon.ico $(patsubst %,dist/%,$(bower_components))
	zip -r dist.zip dist
