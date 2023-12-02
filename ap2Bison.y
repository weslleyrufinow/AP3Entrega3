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
%token L_BRACE R_BRACE L_PAREN R_PAREN SEMICOLON
%token INT_TYPE STRING_TYPE
%token ID ASSIGN STRING INT
%token SUM SUB MUL DIV
%token EQ NEQ LT GT LTE GTE
%token IF ELSE

%token loop in out
%start program

%%

program: VAR L_BRACE declarations R_BRACE PROGRAM L_BRACE cmds R_BRACE {printf("\n*program\n ");}
;
declarations:                          {printf("\n*declarations ");}
            | declaration declarations {printf("\n*declarations ");}
;
declaration: type ID SEMICOLON {printf("\n*declaration - type ID SEMICOLON");}
;
type: INT_TYPE    {printf("\n*type - INT_TYPE");}
    | STRING_TYPE {printf("\n*type - STRING_TYPE");}
;
cmds:          {printf("\n*cmds ");} 
    | cmd cmds {printf("\n*cmds ");}
;
cmd: att       {printf("\n*cmd - att");}
   | condition {printf("\n*cmd - condition");}
   | loop   
   | in 
   | out
;
att: ID ASSIGN value SEMICOLON {printf("\n*att - ID ASSIGN value SEMICOLON ");}
;
value: term     {printf("\n*value - term ");}
     | relation {printf("\n*value - relation ");}
     | STRING   {printf("\n*value - STRING ");}
;
term: INT      {printf("\n*term - INT ");}
    | ID       {printf("\n*term - ID ");}
    | mat_exp  {printf("\n*term - mat_exp ");}
;
mat_exp: L_PAREN term R_PAREN             {printf("\n*mat_exp - ( term )" );}
       | term mat_op term                 {printf("\n*mat_exp - term mat_op term" );}
       | L_PAREN term mat_op term R_PAREN {printf("\n*mat_exp - ( term mat_op term )" );}
;
mat_op: SUM {printf("\n*mat_op - SUM" );}
      | SUB {printf("\n*mat_op - SUB" );}
      | MUL {printf("\n*mat_op - MUL" );}
      | DIV {printf("\n*mat_op - DIV" );}
;

relation: term rel_op term {printf("\n*relation - term rel_op term" );}
;

rel_op: EQ  {printf("\n*rel_op - EQ" );}
      | NEQ {printf("\n*rel_op - NEQ" );}
      | LT  {printf("\n*rel_op - LT" );}
      | GT  {printf("\n*rel_op - GT" );}
      | LTE {printf("\n*rel_op - LTE" );}
      | GTE {printf("\n*rel_op - GTE" );}
;

condition: IF L_PAREN {printf("\n*condition - if" );}
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
