TESTS = test/*.coffee
REPORTER = spec

test:
	./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--slow 20 \
		$(TESTS)  

.PHONY: test