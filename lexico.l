%option noyywrap
%x COMMENT
%option header-file="lexico.yy.h"
%option outfile="lexico.yy.c"

%{
#include <stdio.h>
#include <string.h>
#include "sintatico.tab.h"

%}

%%
AST {return ARROW_TOKEN; }
--> {return ARROW_TOKEN; }
:         {return COLON;  }

[\t\n]     ;
[0-9]+  {yylval.int_t = strtod(yytext, NULL); return(NUM);}
"CONSTANT" {return CONSTANT; }
"VALUE" {return VALUE;}
"GLOBAL" {return GLOBAL; }
"VARIABLE" {return VARIABLE; }
"TYPE" {return TYPE; }
"int" {return INT;}
"char" {return CHAR;}
"void" {return VOID;}
"FUNCTION"{return FUNCTION;}
"RETURN_TYPE" {return RETURN_TYPE; }
"END_FUNCTION" {return END_FUNCTION; }
"DO_WHILE" {return DO_WHILE;}
"WHILE" {return WHILE;}
"IF" {return IF; }
"FOR" {return FOR;}
"PRINTF" {return PRINTF; }
"SCANF" {return SCANF; }
"EXIT" {return EXIT;}
"RETURN" {return RETURN;}
"BOP" {return BOP;}
"UOP" {return UOP;}
"RETURN" {return RETURN; }
"(" {return LPAR;}
")" {return RPAR;}
"," {return COMMA;}
=         {return ASSIGN;  }
<<EOF>> {return(END_FILE);}
.       {printf("Erro lexico"); exit(0);}
%%
