programaLexySintcMiniC: lex.yy.c sintacticoMiniC.tab.h lexicoMiniC.h
	gcc lex.yy.c sintacticoMiniC.tab.c -lfl -o programaLexySintcMiniC

lex.yy.c: lexicoMiniC.l
	flex lexicoMiniC.l

sintacticoMiniC.tab.c sintacticoMiniC.tab.h: sintacticoMiniC.y #Para separar el lexico del sintactico
	bison -d sintacticoMiniC.y

limpiar:
	rm lex.yy.c programaLexySintcMiniC

 