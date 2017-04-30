OUTFILES = \
xp__debug.out           \
xp__help.out            \
xp__debug__list.out     \
xp__debug__add.out      \
xp__debug__add__list.out\
xp_git__help.out        \
xp_git__debug.out

all: $(OUTFILES)

xp__debug__add__list.out:
	xp --debug --add --list > $@

xp__debug__add.out:
	xp --debug --add > $@

xp__debug__list.out:
	xp --debug --list > $@

xp__debug.out:
	xp --debug > $@

xp__help.out:
	xp --help > $@

xp_git__help.out:
	xp git --help > $@

xp_git__debug.out:
	xp git --debug > $@
