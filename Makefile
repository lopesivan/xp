VERSION   = 0.1
NAME      = xp

include etc/rules/build.mk
include etc/rules/tests.mk
include etc/rules/run.mk

install: install-$(PROJECT)
	@-cp -r etc exec modules tasks tests xp $(prefix)

clean:
	@-rm -rf $(prefix)/bin/$(PROJECT)

test-task-list:
	@(ls tests/tasks/| sed -r 's/(^.+)_test.sh/make \1-task-test/')

test-task:
	ls tests/tasks/| sed -r 's/(^.+)_test.sh/make \1-task-test/'|sh
test:
	bang test

test-clean:
	@-rm tests/*.out

