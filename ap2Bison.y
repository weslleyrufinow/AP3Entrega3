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
%token R_BRACE L_BRACE

%start program

%%

program: VAR L_BRACE R_BRACE PROGRAM L_BRACE R_BRACE {printf("Achou program\n");}
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
