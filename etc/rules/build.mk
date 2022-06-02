PROJECT   = $(NAME)
prefix   ?= /usr/local

install-$(PROJECT):
	-mkdir -p $(prefix)/bin
	ln -s exec $(prefix)/bin/$(PROJECT)

