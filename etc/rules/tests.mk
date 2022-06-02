
%-task-test:
	bang test tests/tasks/$(@:-task-test=)_test.sh

