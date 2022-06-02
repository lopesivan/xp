PROJECT   = $(NAME)
prefix   ?= /usr/local

install-$(PROJECT):
	-mkdir -p $(prefix)/bin
	ln -s `pwd`/exec $(prefix)/bin/$(PROJECT)

