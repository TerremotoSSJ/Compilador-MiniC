# Makefile for compiling lexicoMiniC.l

# Variables
FLEX = flex
GCC = gcc
FLEX_FILE = lexicoMiniC.l
OUTPUT_C = lex.yy.c
OUTPUT_EXEC = programalexico
HEADER_FILE = lexicoMiniC.h

# Targets
all: $(OUTPUT_EXEC)

$(OUTPUT_EXEC): $(OUTPUT_C) $(HEADER_FILE)
	$(GCC) $(OUTPUT_C) -lfl -o $(OUTPUT_EXEC)

$(OUTPUT_C): $(FLEX_FILE)
	$(FLEX) $(FLEX_FILE)

clean:
	rm -f $(OUTPUT_C) $(OUTPUT_EXEC)