%{
#include "lexicoMiniC.h"
#include <stdlib.h>
void error_lexico();
%}
digito              [0-9]
letra               [a-zA-Z]
entero              {digito}+
%%
[ \n\t]+                            ;

void                                return VOID;
var                                 return VAR;
const                               return CONST;
int                                 return INT;
if                                  return IF;
else                                return ELSE;
while                               return WHILE;
print                               return PRINT;
read                                return READ;

{letra}({letra}|{digito}|_)*        return ID;
{entero} {

    if (yylen < 10 || yylen == 10 && atoll(yytext) < pow(2,32)) return INTLITERAL;
    printf("El numero es mayor que 2^32");
    return yytext;
}



\"([^"]|\\\\|\\\")*\"               return STRINGLITERAL;

"("                                 return LPAREN;		
")"                                 return RPAREN;
"{"                                 return LLLAVE;
"}"                                 return RLLAVE;
";"                                 return SEMICOLON;
","                                 return COMMA;
"="                                 return ASSIGN;
"+"                                 return PLUSOP;
"-"                                 return MINUSOP;
"*"                                 return ASTERISC;
"/"                                 return BARRAD;
.                                   error_lexico();
%%

void error_lexico()
{
  printf("\nERROR, s�mbolo no reconocido %s\n",yytext);
}

void main() {
    int i;
    while (i=yylex())
        printf("%d %s\n",i,yytext);
    printf("FIN DE ANALISIS LEXICO\n");
}
