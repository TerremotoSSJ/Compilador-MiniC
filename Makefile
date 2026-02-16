#Makefile for compilin the file lexicoMiniC.l

# Variables
FLEX = flex
GCC = gcc
FLEX_FILE = lexicoMiniC.l
OUTPUT_C = lex.yy.c
MAIN_C = mainMiniC.c
OUTPUT_EXEC = programalexico

# Targets
all: $(OUTPUT_EXEC)

$(OUTPUT_EXEC): $(FLEX_FILE) $(MAIN_C)
	$(FLEX) $(FLEX_FILE)
	$(GCC) $(MAIN_C) $(OUTPUT_C) -lfl -o $(OUTPUT_EXEC)

clean:
	rm -f $(OUTPUT_EXEC) $(OUTPUT_C)
