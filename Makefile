CTAGS_TEST ?= ./ctags
SHELL = /bin/sh

TIMEOUT=
LANGUAGES=
CATEGORIES=
UNITS=

.PHONY: check units clean-units
check: units
#
# UNITS Target
#
units: TIMEOUT := $(shell timeout --version > /dev/null 2>&1 && echo 5 || echo 0)
units: $(CTAGS_TEST)
	@ \
	c="misc/units run \
		--ctags=$(CTAGS_TEST) \
		--languages=$(LANGUAGES) \
		--categories=$(CATEGORIES) \
		--units=$(UNITS) \
		--with-timeout=$(TIMEOUT)"; \
	 $(SHELL) $${c} Units

clean-units:
	$(SHELL) misc/units clean Units

# vi:set tabstop=8:
