SHELL = /bin/bash

build:
	bundle install && \
	rubocop -a

test:
	bundle exec rspec

.PHONY: build test