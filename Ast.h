#ifndef AST_H
#define AST_H

#include "Lista.h"

typedef void* AST;
typedef void* Node;
typedef void* Exp;

#define DOWHILE    1
#define IF         2
#define WHILE      3
#define FOR        4
#define PRINTF     5
#define SCANF      6
#define EXIT       7
#define RETURN     8


/* Expressions */
#define PLUS                9
#define MINUS              10
#define MULTIPLY           11
#define DIV                12
#define REMAINDER          13
#define BITWISE_AND        14
#define BITWISE_OR         15
#define BITWISE_XOR        16
#define LOGICAL_AND        17
#define LOGICAL_OR         18
#define EQUAL              19
#define NOT_EQUAL          20
#define LESS_THAN          21
#define GREATER_THAN       22
#define LESS_EQUAL         23
#define GREATER_EQUAL      24
#define R_SHIFT            25
#define L_SHIFT            26
#define ASSIGN             27
#define ADD_ASSIGN         28
#define MINUS_ASSIGN       29
#define VAR                30




AST createAST();

/*
* struct types:
*   - 'd': do-while
*   - 'i': if
*   - 'w': while
*   - 'f': for
*   - 'p': printf
*   - 's': scanf
*   - 'e': exit
*   - 'r': return
*/
// Node addNode(AST a, int type);




/* Print the AST tree on the default output */
void printAST(AST a);

/* createExpression(AST as,  int type); */
Exp createExpression(AST as,  int type);

Exp expSetId(Exp ex, char *identifier);

Exp expInsertLeft(Exp parent, Exp child);


Exp expInsertRight(Exp parent, Exp child);


void printExpression(Exp ex);

#endif