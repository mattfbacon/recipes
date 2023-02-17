dist/%.html: %.md style.css
	mkdir -p $(shell dirname $@)
	echo '<style>' > $@
	cat style.css >> $@
	echo '</style>' >> $@
	md2html $< >> $@

.PHONY: all
all: $(patsubst %.md,dist/%.html,$(wildcard *.md))
