#include <stdio.h>
#include "Ast.h"


int main(){

    printf("Main: %c\n", IF);
    AST ast = createAST();

    addNode(ast, IF);
    addNode(ast, FOR);
    

    return 0;
}