%{
#include <stdio.h>
int main(void); //El main no es obligatorio ponerlo
int yylex(void);
void yyerror (char const *);
extern int yylineno;
extern char *yytext;
%}

%token   NUM MAS POR PARI PARD FIN

%%
entrada	:	/*empty/lambda*/		{printf("Aplica entrada -> lambda \n");}
	|	entrada linea		{printf("Aplica entrada -> entrada linea \n");}
	;
linea	:	expr FIN		{$$=$1; printf("= %d\n", $$);}
	;

expr	:	expr MAS termino	{$$=$1+$3;}
	|	termino			{$$=$1;}
	;
termino	:	termino POR factor	{$$=$1*$3;}
	|	factor			{$$=$1;} //Todo esto es para tirarlo hacia arriba en el arbol hasta poder operar
	;
factor	:	PARI expr PARD		{$$=$2;} //Todo esto es para tirarlo hacia arriba en el arbol hasta poder operar
	|	NUM			{$$=$1;}
	;

%%

void yyerror (char const *s)
     {
    printf("Error sintactico en el caracter %s en la linea %d\n", yytext, yylineno);
     }

int main (void) {
	
	return yyparse();
  
}
