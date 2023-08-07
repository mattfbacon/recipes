OUT_DIR ?= dist
MD2HTML ?= md2html

.PHONY: all
all: $(ALL_OUTPUTS) $(OUT_DIR)/index.html

$(OUT_DIR)/%.html: %.md style.css
	mkdir -p $(shell dirname $@)
	echo '<style>' > $@
	cat style.css >> $@
	echo '</style>' >> $@
	$(MD2HTML) $< >> $@

ALL_OUTPUTS := $(patsubst %.md,$(OUT_DIR)/%.html,$(filter-out _%,$(wildcard *.md)))

$(OUT_DIR)/index.html: $(ALL_OUTPUTS)
	python gen-index.py > $@
