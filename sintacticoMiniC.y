%{
#include <stdio.h>
void yyerror (char const *);
int yylex(void);
extern int yylineno;
extern char *yytext;
%}

%token VOID VAR CONST INT ID INTLITERAL STRINGLITERAL IF ELSE WHILE PRINT LPAREN RPAREN LLLAVE RLLAVE SEMICOLON COMMA ASSIGN PLUSOP MINUSOP MULTIOP BARRAD READ

//Para evitar antiguedades se utiliza %left y %right para establecer asociatividad por la izquierda o derecha
%left PLUSOP MINUSOP
%left MULTIOP BARRAD
//El UMINUS LO PODEMOS USAR PARA ESTABLECER QUE EL - NO ES RESTA SINO SIGNO DE UN NUMERO
%right UMINUS

%nonassoc RPAREN
%nonassoc ELSE

%%

program     :   VOID ID LPAREN RPAREN LLLAVE body RLLAVE
    ;

body        :   body declaration
    |           body statement
    |            /* empty */
    ;

declaration :   VAR tipo id_list SEMICOLON
    |           CONST tipo id_list SEMICOLON
    ;

tipo        :   INT
    ;

id_list     :  id_decl
    |          id_list COMMA id_decl
    ;

id_decl     :  ID
    |          ID ASSIGN expression
    ;

statement   :  ID ASSIGN expression SEMICOLON
    |          LLLAVE statement_list RLLAVE
    |          IF LPAREN expression RPAREN statement ELSE statement
    |          IF LPAREN expression RPAREN statement
    |          WHILE LPAREN expression RPAREN statement
    |          PRINT LPAREN print_list RPAREN SEMICOLON
    |          READ LPAREN read_list RPAREN SEMICOLON
    ;

statement_list : statement_list statement
    |            /* empty */
    ;

print_list  :   print_item
    |           print_list COMMA print_item
    ;

print_item  :   expression
    |           STRINGLITERAL
    ;

read_list   :   ID
    |           read_list COMMA ID
    ;

expression  :   expression PLUSOP expression
    |           expression MINUSOP expression
    |           expression MULTIOP expression
    |           expression BARRAD expression
    |           MINUSOP expression %prec UMINUS
    |           LPAREN expression RPAREN
    |           ID
    |           INTLITERAL
    ;



%%


void yyerror (char const *s)
     {
    printf("Error sintactico en el caracter %s en la linea %d\n", yytext, yylineno);
     }


int main (void) {
	
	return yyparse();
  
}