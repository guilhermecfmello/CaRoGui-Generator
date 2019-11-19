#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "Ast.h"



/*
* struct types:
*   - 1: do-while
*   - 2: if
*   - 3: while
*   - 4: for
*   - 5: printf
*   - 6: scanf
*   - 7: exit
*   - 8: return
*/


/*
* PLUS                9
* MINUS              10
* MULTIPLY           11
* DIV                12
* REMAINDER          13
* BITWISE_AND        14
* BITWISE_OR         15
* BITWISE_XOR        16
* LOGICAL_AND        17
* LOGICAL_OR         18
* EQUAL              19
* NOT_EQUAL          20
* LESS_THAN          21
* GREATER_THAN       22
* LESS_EQUAL         23
* GREATER_EQUAL      24
* R_SHIFT            25
* L_SHIFT            26
* ASSIGN             27
* ADD_ASSIGN         28
* MINUS_ASSIGN       29
* VAR                30
*/
int nExp = 0;

typedef struct __node {
    int type;
    
    Lista commands_then; // Command then used in while, if, for and do-while blocks
    Lista commands_else; // Command else user in if block

    Exp exp_start; // The start expression used on for block
    Exp exp_stop; // Stop Condition
    Exp exp_cond; // Conditional expression
    Exp exp_adjust; // Values adjust of for block
    Exp exp_end; // Expresion of addres used on pointers


    char *string; // String value used on printf and scanf block


} node;

typedef struct _expression {
    int type;
    Exp left;
    Exp right;

    char *id; // Variable identifier
} exp;

typedef struct __ast {
    Lista nodes;
} ast;


AST createAST(){
    ast *a = (ast*) malloc(sizeof(ast));
    a->nodes = createList();
    return a;
}

// Node addNode(AST as, int type){
//     node *n = (node*) malloc(sizeof(node));
//     ast *a = (ast*) as;
//     n->type = type;
//     insert(a, n);
// }

Exp expCreate(AST as,  int type){
    ast *a = (ast*) as;

    exp *e = (exp*) malloc(sizeof(exp));
    e->type = type;
    e->left = NULL;
    e->right = NULL;
    e->id = NULL;
}

Exp expSetId(Exp ex, char *identifier){
    exp *e = (exp*) ex;

    if(e->type == VAR_EXP)
        e->id = identifier;
    // else
        // e->id = NULL;
    return e;
}

Exp expInsertLeft(Exp parent, Exp child){
    exp *e = (exp*) parent;
    e->left = child;
}


Exp expInsertRight(Exp parent, Exp child){
    exp *e = (exp*) parent;
    e->right = child;
}

// void printExpression(Exp ex){
//     exp *e = (exp*) ex;

//     if(ex->left != NULL){
//         nExp++;
//         printExpression(ex->left);
//     }
//     printf("LEFT level %d: %s", nExp, ex->id);
//     nExp = 0;
//     if(ex->right != NULL){
//         nExp++;
//         printExpression(ex->right);
//     }
//     printf("LEFT level %d: %s", nExp, ex->id);
// }





