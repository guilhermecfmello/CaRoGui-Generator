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
"AST"                         {return AST_TOKEN; }
"-->"                         {return ARROW; }
":"                           {return COLON;  }
[\t\n ]                      { ;}
[0-9]+                      {yylval.int_t = strtod(yytext, NULL); return(NUM);}
"CONSTANT"                  {return CONSTANT; }
"VALUE"                     {return VALUE;}
"GLOBAL"                    {return GLOBAL; }
"VARIABLE"                  {return VARIABLE; }
"TYPE"                      {return TYPE; }
"int"                       {return INT;}
"char"                      {return CHAR;}
"void"                      {return VOID;}
"FUNCTION"                  {return FUNCTION;}
"RETURN_TYPE"               {return RETURN_TYPE; }
"END_FUNCTION"              {return END_FUNCTION; }
"DO_WHILE"                  {return DO_WHILE;}
"WHILE"                     {return WHILE;}
"IF"                        {return IF; }
"FOR"                       {return FOR;}
"PRINTF"                    {return PRINTF; }
"SCANF"                     {return SCANF; }
"EXIT"                      {return EXIT;}
"RETURN"                    {return RETURN;}
"PARAMETER"                 {return PARAMETER;}
"("                         {return LPAR;}
")"                         {return RPAR;}
","                         {return COMMA;}
"="                         {return ASSIGN;  }
"["                         {return LBRACKET;}
"]"                         {return RBRACKET;}
"+"                         {return PLUS;}
"-"                         {return MINUS;}
"*"                         {return ESTRELA;}
"/"                         {return DIV;}
"%"                         {return REMAINDER;}
"&"                         {return BITWISE_AND;}
"|"                         {return BITWISE_OR;}
"^"                         {return BITWISE_XOR;}
"&&"                        {return LOGICAL_AND;}
"||"                        {return LOGICAL_OR;}
"=="                        {return EQUAL;}
"!="                        {return NOT_EQUAL;}
"<"                         {return LESS_THAN;}
">"                         {return GREATER_THAN;}
"<="                        {return LESS_EQUAL;}
">="                        {return GREATER_EQUAL;}
">>"                        {return R_SHIFT;}
"<<"                        {return L_SHIFT;}
"+="                        {return ADD_ASSIGN;}
"-="                        {return MINUS_ASSIGN;}
"++"                        {return INC;}
"--"                        {return DEC;}
"~"                         {return BITWISE_NOT;}
"!"                         {return NOT;}
"\""                        {return QUOTE;}
";"                         {return SEMICOLON;}
[a-zA-Z_]+[a-zA-Z0-9_]*      {return ID;}

<<EOF>> {return(END_FILE);}
.       {printf("Erro lexico"); exit(0);}
%%
