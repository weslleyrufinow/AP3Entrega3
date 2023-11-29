%{
#include <stdlib.h>
#include <stdio.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror (const char* s); 

%}

%union {
    int num;
    char* str;
}


%start prog

%%

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
