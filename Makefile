.PHONY: all entry
entry: all

marker.d/%: module.d/%
	@bash $<
	@touch $@

all: $(patsubst module.d/%, marker.d/%, $(wildcard module.d/*))

include $(wildcard module.d/*.mk)