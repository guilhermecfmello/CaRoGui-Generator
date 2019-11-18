#ifndef AST_H
#define AST_H

#include "Lista.h"

typedef void* AST;
typedef void* Node;

#define DOWHILE    'd'
#define IF         'i'
#define WHILE      'w'
#define FOR        'f'
#define PRINTF     'p'
#define SCANF      's'
#define EXIT       'e'
#define RETURN     'r'


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


/* Print the AST tree on the default output */
void printAST(AST a);


#endif