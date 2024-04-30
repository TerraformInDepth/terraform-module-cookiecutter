

build:
	mkdir -p build

test: build
	rm -Rf build/terraform-example-module
	cookiecutter --no-input --config-file=cookiecutter.json --output-dir build/terraform-example-module .
