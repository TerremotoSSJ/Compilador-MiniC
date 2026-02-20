%{
#include "sintacticoMiniC.tab.h"
#include <stdlib.h>
#include <math.h>
void error_lexico();
%}

digito              [0-9]
letra               [a-zA-Z]
entero              {digito}+
%option yylineno

%%
[ \n\t\r]+                            ;

void                                return VOID;
var                                 return VAR;
const                               return CONST;
int                                 return INT;
if                                  return IF;
else                                return ELSE;
while                               return WHILE;
print                               return PRINT;
read                                return READ;

{letra}({letra}|{digito}|_)*  {      
    
    if (yyleng < 33) return ID;
    printf("El id no puede superar los 32 caracteres.");
    }
{entero} {

    if (yyleng < 10 || yyleng == 10 && atoll(yytext) <= pow(2,31)) return INTLITERAL;
    printf("El numero es mayor que 2^31 en valor absoluto\n");
}



\"([^"]|\\\\|\\\")*\"               return STRINGLITERAL;
"/*"([^*]|[*]+[^*/])*[*]+"/"                     ;
"//".*                                           ;
"("                                 return LPAREN;		
")"                                 return RPAREN;
"{"                                 return LLLAVE;
"}"                                 return RLLAVE;
";"                                 return SEMICOLON;
","                                 return COMMA;
"="                                 return ASSIGN;
"+"                                 return PLUSOP;
"-"                                 return MINUSOP;
"*"                                 return MULTIOP;
"/"                                 return BARRAD;
[^a-zA-Z0-9(){};,"=+\-*\/\n\t]+     error_lexico();
%%

void error_lexico()
{
    printf("Error lexico en el caracter %s en la linea %d\n", yytext, yylineno);
}