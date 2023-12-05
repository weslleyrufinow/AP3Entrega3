%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;
FILE* output_file;

void ILOC_Code(char *op, char * r1, char * r2);

char str[101];
char str2[100];
int count = 1;

void yyerror(const char* s); 

%}

%union {
    char* str;
}

%token VAR PROGRAM 
%token L_BRACE R_BRACE L_PAREN R_PAREN SEMICOLON COMMA
%token INT_TYPE FLOAT_TYPE STRING_TYPE
%token ID<str> ASSIGN STRING INT FLOAT
%token SUM SUB MUL DIV
%token EQ NEQ LT GT LTE GTE
%token IF ELSE
%token WHILE
%token IN OUT
%start program

%left SUM SUB
%left MUL DIV

%type<str> mat_op
%type<str> term
%type<str> att
%type<str> exp
%type<str> value
%type<str> declarations
%type<str> declaration

%%

program: VAR L_BRACE declarations R_BRACE PROGRAM L_BRACE cmds R_BRACE 
                                       {}
;
declarations:                          {}
            | declaration declarations {}
;
declaration: type ID SEMICOLON         {}
;
type: INT_TYPE                         {printf("loadI 0 => r1\n");}
    | FLOAT_TYPE                       {printf("loadI 0 => r1\n");}
    | STRING_TYPE                      {printf("loadI 0 => r1\n");}
                                        //Carrega o valor 0 no registrador r1.
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
                                        /*Armazena o valor do registrador r1 na memória 
                                        no endereço especificado pelo registrador r0 
                                        mais o deslocamento 0 (sem pegar espaço de memória adjacente)
                                        */
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

mat_op: term SUM term                  {ILOC_Code("ADD", $1, $3); $$ = strdup(str);
                                                     printf("ADD, %s, %s\n",$1,$3);}
      | term SUB term                  {ILOC_Code("SUB", $1, $3); $$ = strdup(str);
                                                     printf("SUB, %s, %s\n",$1,$3);}
      | term MUL term                  {ILOC_Code("MUL", $1, $3); $$ = strdup(str);
                                                     printf("MUL, %s, %s\n",$1,$3);}
      | term DIV term                  {ILOC_Code("DIV", $1, $3); $$ = strdup(str);
                                                     printf("DIV, %s, %s\n",$1,$3);}
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
                                        /*Esta instrução é usada para um desvio condicional. 
                                          Se o valor no registrador r1 for verdadeiro, 
                                          o controle é transferido para o rótulo L1, 
                                          caso contrário, para o rótulo L2.*/
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
                                       /*Lê um valor de entrada e armazena-o no registrador r2*/
;

input:                                 {}
      | STRING                         {}
      | INT                            {}
;

out: OUT L_PAREN outputs R_PAREN SEMICOLON 
                                       {}
;
 
outputs:  value                        {}
        | value COMMA outputs          {}
;

%%

void ILOC_Code(char *op, char * r1, char * r2) {
    strcpy(str, "R"); 
    sprintf(str2, "%d", count);  
    strcat(str, str2); 
    fprintf(output_file, "%s, %s, %s, R%d\n", op, r1, r2, count++); 
}

int main(){
    yyin = stdin;
    output_file = fopen("output.il", "w");

    if (output_file == NULL) {
        perror("Erro ao abrir o arquivo de saída");
        exit(EXIT_FAILURE);
    }

    do {
        yyparse();
    } while (!feof(yyin));

    return 0;
}

void yyerror(const char* s){
    fprintf(stderr, "%s\n", s);
    exit(1);
}
