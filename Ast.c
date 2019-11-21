#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Ast.h"

/*
*   Constants for Breadth-First search
*/
#define WHITE 100
#define GREY 101
#define BLACK 102

typedef struct __node {
    int type;
    
    Lista commands_then; // Command then used in while, if, for and do-while blocks
    Lista commands_else; // Command else user in if block

    Exp exp_start;       // The start expression used on for block
    Exp exp_stop;        // Stop Condition
    Exp exp_cond;        // Conditional expression
    Exp exp_adjust;      // Values adjust of for block
    Exp exp_end;         // Expresion of addres used on pointers

    char *string;        // String value used on printf and scanf block
} node;

typedef struct _expression {
    int type;
    Exp left;
    Exp right;

    char *id;             // Variable identifier
    int color;            // Used to print the tree on default output
    int nivel;            // Used to print the tree on default output
} exp;

typedef struct __ast {
    Lista nodes;
} ast;

AST createAST(){
    ast *a = (ast*) malloc(sizeof(ast));
    a->nodes = createList();
    return a;
}

// ======================== Commands functions ======================== // 



// ======================== Expressions functions ======================== //
Exp expCreate(AST as,  int type){
    ast *a = (ast*) as;

    exp *e = (exp*) malloc(sizeof(exp));
    e->type = type;
    e->left = NULL;
    e->right = NULL;
    e->id = NULL;

    e->color = WHITE;   // Used to print the tree on default output
    e->nivel = 0;       // Used to print the tree on default output
}


Exp expGetLeft(Exp ex){
    exp *e = (exp*) ex;
    return e->left;
}

Exp expGetRight(Exp ex){
    exp *e = (exp*) ex;
    return e->right;
}

Exp expSetId(Exp ex, char *identifier){
    exp *e = (exp*) ex;

    if(e->type == VAR_EXP){
        e->id = (char*) malloc(sizeof(char) * strlen(identifier));
        strcpy(e->id, identifier);
    }
    return e;
}

Exp expInsertLeft(Exp parent, Exp child){
    exp *e = (exp*) parent;
    exp *e_child = (exp*) child;

    refreshExpTree(child); // Used to print the tree on default output
    e->left = child;
}


Exp expInsertRight(Exp parent, Exp child){
    exp *e = (exp*) parent;
    exp *e_child = (exp*) child;

    refreshExpTree(child); // Used to print the tree on default output
    e->right = child;
}

char *expGetId(Exp ex){
    exp *e = (exp*) ex;

    return e->id;
}


int expGetType(Exp ex){
    exp *e = (exp*) ex;
    
    return e->type;
}

void refreshExpTree(Exp ex){
    exp *e = (exp*) ex;
    if(e != NULL){
        refreshExpTree(e->left);
        refreshExpTree(e->right);
        e->nivel = e->nivel + 1;
    }

}

void printExpression(Exp ex){
    int i, last_nivel;
    exp *e = (exp*) ex;
    exp *left, *right;
    Exp aux;
    Lista list = createList();


    printf("\n========= Starting expressions printing =========\n");
    insert(list, e);

    last_nivel = e->nivel;
    i = 0;
    while(length(list) > 0){
        aux = getFirst(list);
        e = (exp*) get(list, aux);

        left = e->left;
        right = e->right;

        if(left != NULL){
            if(left->color == WHITE){
                left->color = GREY;
                insert(list, left);
            }
        }

        if(right != NULL){
            if(right->color == WHITE){
                right->color = GREY;
                insert(list, right);
            }
        }

        
        if(last_nivel != e->nivel){
            printf("\n");
            last_nivel = e->nivel;
        }
        
        if(e->type == VAR_EXP){
            printf("%s ", e->id);
        } else{
            printf("%s ", getTypeString(e));
        }

        e->color = BLACK;
        remover(list, aux);


    }
    
}


char *getTypeString(Exp ex){
    char *s;
    exp *e = (exp*) ex;
    switch(e->type){
        case(PLUS_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"PLUS_EXP");
            break;
        case(MINUS_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"MINUS_EXP");
            break;
        case(MULTIPLY_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"MULTIPLY_EXP");
            break;
        case(DIV_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"DIV_EXP");
            break;
        case(REMAINDER_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"REMAINDER_EXP");
            break;
        case(BITWISE_AND_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"BITWISE_AND_EXP");
            break;
        case(BITWISE_OR_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"BITWISE_OR_EXP");
            break;
        case(BITWISE_XOR_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"BITWISE_XOR_EXP");
            break;
        case(LOGICAL_AND_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"LOGICAL_AND_EXP");
            break;
        case(LOGICAL_OR_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"LOGICAL_OR_EXP");
            break;
        case(EQUAL_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"EQUAL_EXP");
            break;
        case(NOT_EQUAL_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"NOT_EQUAL_EXP");
            break;
        case(LESS_THAN_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"LESS_THAN_EXP");
            break;
        case(GREATER_THAN_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"GREATER_THAN_EXP");
            break;
        case(LESS_EQUAL_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"LESS_EQUAL_EXP");
            break;
        case(GREATER_EQUAL_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"GREATER_EQUAL_EXP");
            break;
        case(R_SHIFT_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"R_SHIFT_EXP");
            break;
        case(L_SHIFT_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"L_SHIFT_EXP");
            break;
        case(ASSIGN_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"ASSIGN_EXP");
            break;
        case(ADD_ASSIGN_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"ADD_ASSIGN_EXP");
            break;
        case(MINUS_ASSIGN_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"MINUS_ASSIGN_EXP");
            break;
        case(VAR_EXP):
            s = malloc(sizeof(char)*20);
            strcpy(s,"VAR_EXP");
            break;
        default:
            s = malloc(sizeof(char)*20);
            strcpy(s, "UNDEFINED");
            break;
    }
    return s;
}






