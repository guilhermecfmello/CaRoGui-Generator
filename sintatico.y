%output "sintatico.tab.c"
%defines "sintatico.tab.h"

%{
#define YYMAXDEPTH 1000000000000000000
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lexico.yy.h"


extern char* yytext;
int yyerror(char *s);
extern int yylex();


%}

%union{
  int int_t;
}

%token END_LINE
%token END_FILE


%start inicio

%type <int_t> programa

%%

  inicio: END_FILE {exit(0);}
        | programa inicio {}
  ;

  programa: graph registradores programa2 { }
  ;


%%

int yyerror(char *s){
  printf("Teve algum erro %s",s);
}

int main(int argc, char **argv){

  yyparse();

  return 0;
}
