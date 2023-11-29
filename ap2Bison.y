%{
#include <stdlib.h>
#include <stdio.h>
extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s); 

%}

%union {
    int num;
    char* str;
}

%token VAR PROGRAM 
%token L_BRACE R_BRACE SEMICOLON
%token INT_TYPE STRING_TYPE
%token ID

%start program

%%

program: VAR L_BRACE declarations R_BRACE PROGRAM L_BRACE R_BRACE {printf("\n*program\n ");}
;
declarations: 
            | declaration declarations {printf("\n*declarations ");}
;
declaration: type id {printf("\n*declaration ");}
;
type: INT_TYPE ID SEMICOLON{printf("\n*INT_TYPE ID SEMICOLON ");}
    | STRING_TYPE ID SEMICOLON{printf("\n*STRING_TYPE ID SEMICOLON ");}
;
id:
;
%%

int main(){
    yyin = stdin;

    do {
        yyparse();
    }while(!feof(yyin));
    
    return 0;
}

void yyerror(const char* s){
    fprintf(stderr, "%s\n", s);
    exit(1);
}
