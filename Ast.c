#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Ast.h"
#include "Lista.h"

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