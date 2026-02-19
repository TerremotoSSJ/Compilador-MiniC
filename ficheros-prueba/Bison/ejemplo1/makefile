calcE1: lex.yy.c calcE1.tab.h calcE1.h
	gcc lex.yy.c calcE1.tab.c -lfl -o calcE1

lex.yy.c: calcE1.l
	flex calcE1.l

calcE1.tab.c calcE1.tab.h: calcE1.y #Para separar el lexico del sintactico
	bison -d calcE1.y

limpiar:
	rm lex.yy.c calcE1

