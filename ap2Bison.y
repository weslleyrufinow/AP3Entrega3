%{
#include <stdlib.h>
#include <stdio.h>
extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s); 

%}

%union {
    char* str;
}

%token VAR PROGRAM 
%token L_BRACE R_BRACE L_PAREN R_PAREN SEMICOLON COMMA
%token INT_TYPE FLOAT_TYPE STRING_TYPE
%token ID ASSIGN STRING INT FLOAT
%token SUM SUB MUL DIV
%token EQ NEQ LT GT LTE GTE
%token IF ELSE
%token WHILE
%token IN OUT
%start program

%%

program: VAR L_BRACE declarations R_BRACE PROGRAM L_BRACE cmds R_BRACE 
                                       {printf("loadI 0 => r1\n");}
;
declarations:                          {}
            | declaration declarations {}
;
declaration: type ID SEMICOLON         {printf("loadI 0 => r1\n");}
;
type: INT_TYPE                         {printf("loadI 0 => r1\n");}
    | FLOAT_TYPE                       {printf("loadI 0 => r1\n");}
    | STRING_TYPE                      {printf("loadI 0 => r1\n");}
;
cmds:                                  {}
    | cmd cmds                         {}
;
cmd: att                               {}
   | condition                         {}
   | loop                              {}
   | in                                {}
   | out                               {}
;
att: ID ASSIGN value SEMICOLON         {printf("storeAI r1 => r0, 0\n");}
;
value: term                            {}
     | relation                        {}
     | STRING                          {}
;                        
term: FLOAT                            {}
    | INT                              {}
    | ID                               {}
    | exp                              {}
;
exp:  L_PAREN term R_PAREN             {}
    | mat_op                           {}
    | L_PAREN mat_op R_PAREN           {}
;

mat_op: term SUM term                  {printf("add r1, r2 => r3\n");}
      | term SUB term                  {printf("sub r1, r2 => r3\n");}
      | term MUL term                  {printf("mult r1, r2 => r3\n");}
      | term DIV term                  {printf("div r1, r2 => r3\n");}
;

relation:                              {}
        | term rel_op term             {}
;

rel_op: EQ                             {printf("cbr r1 => L1, L2\n");}
      | NEQ                            {printf("cbr r1 => L1, L2\n");}
      | LT                             {printf("cbr r1 => L1, L2\n");}
      | GT                             {printf("cbr r1 => L1, L2\n");}
      | LTE                            {printf("cbr r1 => L1, L2\n");}
      | GTE                            {printf("cbr r1 => L1, L2\n");}
;

condition: IF L_PAREN relation R_PAREN L_BRACE cmds R_BRACE else 
                                       {printf("cbr r1 => L1, L2\n");}
;

else:                                  {}
    |ELSE L_BRACE cmds R_BRACE         {}
;

loop: WHILE L_PAREN relation R_PAREN L_BRACE cmds R_BRACE 
                                       {printf("cbr r1 => L1, L2\n");}
;

in: ID ASSIGN IN L_PAREN input R_PAREN SEMICOLON          
                                       {printf("read r1 => r2\n");}
;

input:                                 {}
      | STRING                         {}
      | INT                            {}
;

out: OUT L_PAREN outputs R_PAREN SEMICOLON 
                                       {printf("*out");}
;
 
outputs:  value                        {printf("*out - output");}
        | value COMMA outputs          {printf("*out - outputs");}
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
