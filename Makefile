VERSION   = 0.1
NAME      = xp

include rules/build.mk
include rules/tests.mk
include rules/run.mk

copy-$(PROJECT):
	@-cp -r etc exec modules tasks tests $(NAME) $(prefix)

install: copy-$(PROJECT) install-$(PROJECT)

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

