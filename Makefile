SHELL = /bin/bash

build:
	rubocop -a && \
	bundle install

test:
	bundle exec rspec

.PHONY: build test