PROJECT   = $(NAME)
prefix   ?= /usr/local

install-$(PROJECT):
	-mkdir -p $(prefix)/bin
	ln -s $(prefix)/exec $(prefix)/bin/$(PROJECT)

