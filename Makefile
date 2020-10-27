HUGO_DIR=~/Dropbox/www/
SOURCES := $(shell find $(SOURCEDIR) -name '*.org')
MD := $(filter-out ./README.md, $(SOURCES:.org=.md))

web: $(MD)
	touch $(HUGO_DIR)content/teaching/bank-of-colombia-smc/_index.md
	touch $(HUGO_DIR)content/teaching/bank-of-colombia-smc/lectures/_index.md

%.md: %.org
	emacs-27.0.50 -Q \
	-u "$(id -un)" \
	--batch \
	$< \
	-f org-hugo-export-wim-to-md
