#ifndef AST_H
#define AST_H

#include "Lista.h"

typedef void* AST;
typedef void* Node;

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
Node addNode(AST a, char type);



#endif