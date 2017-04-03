rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *, %,$2),$d))
	CHK_DIR_EXISTS = test -d $1 || mkdir -p $1
	NUKE = rm -r
	COPY_DIR = cp -rv $1 $2
	FIX_PATH = $1
PROJECT_DIR :=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
AUX_DIR := $(PROJECT_DIR)aux
PDF_DIR := $(PROJECT_DIR)pdf
TEX_DIR := $(PROJECT_DIR)chapters

TEX_FILES := $(call rwildcard, $(TEX_DIR), *.tex)
PDF_FILES = $(patsubst $(TEX_DIR)/%.tex,$(PDF_DIR)/%.pdf,$(TEX_FILES))

thesis: $(TEX_FILES)
	$(call CHK_DIR_EXISTS, $(AUX_DIR))
	$(call CHK_DIR_EXISTS, $(PDF_DIR))
	pdflatex -output-directory=$(AUX_DIR) thesis.tex
	pdflatex -output-directory=$(AUX_DIR) thesis.tex
	mv $(AUX_DIR)/thesis.pdf $(PDF_DIR)/thesis.pdf

all: $(PDF_FILES) thesis

$(PDF_DIR)/%.pdf : $(TEX_DIR)/%.tex
	$(call CHK_DIR_EXISTS, $(AUX_DIR))
	$(call CHK_DIR_EXISTS, $(PDF_DIR))
	pdflatex -output-directory=$(AUX_DIR) "$<"
	pdflatex -output-directory=$(AUX_DIR) "$<"
	mv $(patsubst $(PDF_DIR)/%.pdf, $(AUX_DIR)/%.pdf,$@) $@

clean:
	$(NUKE) "$(AUX_DIR)" "$(PDF_DIR)"
