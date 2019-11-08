%output "sintatico.tab.c"
%defines "sintatico.tab.h"

%{
#define YYMAXDEPTH 1000000000000000000
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lexico.yy.h"
#include "Lista.h"
#include "Ast.h"

extern char* yytext;
int yyerror(char *s);
extern int yylex();


%}

%union{
  int int_t;
}

%token CONSTANT
%token VALUE
%token GLOBAL
%token VARIABLE
%token TYPE
%token FUNCTION
%token RETURN_TYPE
%token END_FUNCTION
%token DO_WHILE
%token WHILE
%token IF
%token FOR
%token PRINTF
%token SCANF
%token EXIT
%token RETURN
%token LPAR
%token RPAR
%token LBRACKET
%token RBRACKET
%token COMMA
%token ASSIGN
%token PLUS
%token MINUS
// %token MULTIPLY
%token DIV
%token REMAINDER
%token BITWISE_AND
%token BITWISE_OR
%token BITWISE_XOR
%token LOGICAL_AND
%token LOGICAL_OR
%token EQUAL
%token NOT_EQUAL
%token LESS_THAN
%token GREATER_THAN
%token LESS_EQUAL
%token GREATER_EQUAL
%token R_SHIFT
%token L_SHIFT
%token ADD_ASSIGN
%token MINUS_ASSIGN
%token INC
%token DEC
%token BITWISE_NOT
%token NOT
%token ARROW
%token CHAR
%token COLON
%token ESTRELA
%token ID
%token INT
%token NUM
%token PARAMETER
%token AST2
%token VOID



%token END_FILE

%start inicio

// %type <int_t> programa

%%
    inicio: AST2 ARROW body2 { exit(0); }
    ;

    body2: {}
    ;

    body:
        constant_def body
        | global_def body
        | function_def body
    ;

    constant_def:
        CONSTANT COLON ID VALUE COLON NUM
        |
    ;

    global_def:
        GLOBAL VARIABLE COLON ID TYPE COLON
        |
    ;

    local_def:
        VARIABLE COLON ID TYPE COLON tipo
        |
    ;

    tipo:
        INT ponteiro
        | CHAR ponteiro array
        | VOID ponteiro array
    ;

    ponteiro:
        ESTRELA ponteiro
        |
    ;

    array:
        LBRACKET NUM RBRACKET
        |
    ;

    function_def:
        FUNCTION COLON ID function_body function_return END_FUNCTION
    ;

    function_body:
        return_type parameters local_def commands
    ;
    return_type:
        RETURN_TYPE COLON tipo
    ;

    parameters:
        PARAMETER COLON ID TYPE COLON tipo
        |
    ;
    commands:
        comando_assign commands
        | comando_do_while commands
        | comando_if commands
        | comando_while commands
        | comando_for commands
        | comando_printa commands
        | comando_scanf commands
        | comando_exit commands
    ;

    comando_assign:
    ;
    comando_do_while:
    ;
    comando_if:
    ;
    comando_while:
    ;
    comando_for:
    ;
    comando_printa:
    ;
    comando_scanf:
    ;
    comando_exit:
    ;

    function_return:
    ;
   
        
%%

int yyerror(char *s){
  printf("Teve algum erro %s",s);
}

int main(int argc, char **argv){

  yyparse();

  return 0;
}
