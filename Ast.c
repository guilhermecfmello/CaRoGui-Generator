#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "Ast.h"



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

typedef struct __node {
    char type;
    
    Lista command_list;
} node;

typedef struct __ast {
    Lista nodes;
} ast;


AST createAST(){
    ast *a = (ast*) malloc(sizeof(ast));
    a->nodes = createList();
    return a;
}

Node addNode(AST as, char type){
    node *n = (node*) malloc(sizeof(node));
    ast *a = (ast*) a;
    n->type = type;
    insert(a, n);


}