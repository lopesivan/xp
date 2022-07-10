PROJECT   = $(NAME)
prefix   ?= /usr/local

brew:
	brew reinstall $(PROJECT)

install-$(PROJECT):
	-mkdir -p $(prefix)/bin
	ln -s $(prefix)/exec $(prefix)/bin/$(PROJECT)

