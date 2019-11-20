#ifndef AST_H
#define AST_H

#include "Lista.h"

typedef void* AST;
typedef void* Node;
typedef void* Exp;

#define DOWHILE_NODE    1
#define IF_NODE         2
#define WHILE_NODE      3
#define FOR_NODE        4
#define PRINTF_NODE     5
#define SCANF_NODE      6
#define EXIT_NODE       7
#define RETURN_NODE     8


/* Expressions */
#define PLUS_EXP                9
#define MINUS_EXP              10
#define MULTIPLY_EXP           11
#define DIV_EXP                12
#define REMAINDER_EXP          13
#define BITWISE_AND_EXP        14
#define BITWISE_OR_EXP         15
#define BITWISE_XOR_EXP        16
#define LOGICAL_AND_EXP        17
#define LOGICAL_OR_EXP         18
#define EQUAL_EXP              19
#define NOT_EQUAL_EXP          20
#define LESS_THAN_EXP          21
#define GREATER_THAN_EXP       22
#define LESS_EQUAL_EXP         23
#define GREATER_EQUAL_EXP      24
#define R_SHIFT_EXP            25
#define L_SHIFT_EXP            26
#define ASSIGN_EXP             27
#define ADD_ASSIGN_EXP         28
#define MINUS_ASSIGN_EXP       29
#define VAR_EXP                30




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

Exp expCreate(AST as,  int type);

Exp expSetId(Exp ex, char *identifier);

Exp expInsertLeft(Exp parent, Exp child);

Exp expInsertRigdht(Exp parent, Exp child);

char *expGetId(Exp ex);


void printExpression(Exp ex);

#endif