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
%token MULTIPLY
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
%token ID
%token ARROW
%token CHAR
%token COLON
%token ESTRELA
%token INT
%token NUM
%token PARAMETER
%token AST_TOKEN
%token VOID
%token SEMICOLON
%token QUOTE

%token END_FILE

%start inicio

// %type <int_t> programa

%%
    inicio: AST_TOKEN ARROW body { printf("RODOU"); exit(0); }
    ;

    body2: {}
    ;

    body:
        constant_def body
        | global_def body
        | function_def body
        |
    ;

    constant_def:
        CONSTANT COLON ID VALUE COLON NUM
        | CONSTANT COLON ID VALUE COLON MINUS NUM
        |
    ;

    global_def:
        GLOBAL VARIABLE COLON ID TYPE COLON tipo
        |
    ;

    local_def:
        VARIABLE COLON ID TYPE COLON tipo
        |
    ;

    tipo:
        INT ponteiro array
        | CHAR ponteiro array
        | VOID ponteiro array
    ;

    ponteiro:
        ESTRELA ponteiro
        |NUM
    array:
        LBRACKET NUM RBRACKET
        |
    ;

    function_def:
        FUNCTION COLON ID function_body function_return END_FUNCTION{

        }
    ;

    function_body:
        return_type parameters local_def commands{
        }
    ;
    return_type:
        RETURN_TYPE COLON tipo
    ;

    parameters:
        PARAMETER COLON ID TYPE COLON tipo parameters
        |
    ;
    commands:
         comando_do_while commands
        | comando_if commands
        | comando_while commands
        | comando_for commands
        | comando_printa commands
        | comando_scanf commands
        | comando_exit commands
        | expressao SEMICOLON commands
        |
    ;
     
    expressao:
        bin_exp { printf("Expressao Binaria\n"); }
        | unary_exp { printf("Expressao Unaria\n"); }
        | ID { printf("Identifier\n"); }
    ;
    bin_exp:
         ASSIGN LPAR expressao COMMA expressao RPAR 
         | PLUS LPAR expressao COMMA expressao RPAR
         | MINUS LPAR expressao COMMA expressao RPAR
         | MULTIPLY LPAR expressao COMMA expressao RPAR
         | DIV LPAR expressao COMMA expressao RPAR
         | REMAINDER LPAR expressao COMMA expressao RPAR
         | BITWISE_AND LPAR expressao COMMA expressao RPAR
         | BITWISE_OR LPAR expressao COMMA expressao RPAR
         | BITWISE_XOR LPAR expressao COMMA expressao RPAR
         | LOGICAL_AND LPAR expressao COMMA expressao RPAR
         | LOGICAL_OR LPAR expressao COMMA expressao RPAR
         | EQUAL LPAR expressao COMMA expressao RPAR
         | NOT_EQUAL LPAR expressao COMMA expressao RPAR
         | LESS_THAN LPAR expressao COMMA expressao RPAR
         | GREATER_THAN LPAR expressao COMMA expressao RPAR
         | LESS_EQUAL LPAR expressao COMMA expressao RPAR
         | GREATER_EQUAL LPAR expressao COMMA expressao RPAR
         | R_SHIFT LPAR expressao COMMA expressao RPAR
         | L_SHIFT LPAR expressao COMMA expressao RPAR
         | ADD_ASSIGN LPAR expressao COMMA expressao RPAR
         | MINUS_ASSIGN LPAR expressao COMMA expressao RPAR
    ;
        
    unary_exp:
        PLUS LPAR expressao RPAR {printf("TENTANDO\n");}
        | MINUS LPAR expressao RPAR {printf("TENTANDO\n");}
        | INC LPAR expressao RPAR {printf("TENTANDO\n");}
        | LPAR expressao RPAR INC {printf("TENTANDO\n");}
        | DEC LPAR expressao RPAR {printf("TENTANDO\n");}
        | LPAR expressao RPAR DEC {printf("TENTANDO\n");}
        | BITWISE_NOT LPAR expressao RPAR {printf("TENTANDO\n");}
        | NOT LPAR expressao RPAR {printf("TENTANDO\n");}
        | BITWISE_AND LPAR expressao RPAR {printf("TENTANDO\n");}

    ;

    comando_do_while:
        DO_WHILE LPAR commands COMMA expressao RPAR
    ;
    comando_if:
        IF LPAR 
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
        RETURN LPAR expressao RPAR
        | RETURN LPAR RPAR


    ;
   
        
%%

int yyerror(char *s){
  printf("Teve algum erro %s\n",s);
}

int main(int argc, char **argv){

  yyparse();

  return 0;
}


//TODO lidar com ponteiro 

