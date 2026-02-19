%{
#include "calcE1.tab.h"
void error();

%}

digito [0-9]
%option yylineno

%%

[ \n\t]+                 ;
{digito}+      {yylval= atoi(yytext); return NUM;}
"+"            return MAS;
"*"            return POR;
"("            return PARI;
")"            return PARD;
";"            return FIN;
.              {error();}

%%

void error() {
    printf("Error lexico en el caracter %s en la linea %d\n", yytext, yylineno);
}