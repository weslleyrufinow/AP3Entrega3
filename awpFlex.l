%{
#include <stdio.h>
#include <stdlib.h>
%}

PROGRAM     ("PROGRAM")
VAR         ("VAR")
L_BRACE     [\{]
R_BRACE     [\}]
IF          ("if")
ELSE        ("else")
WHILE       ("while")
IN          ("in")
OUT         ("out")
EQ          ("==")
NEQ         ("!=")
LT          ("<")
GT          (">")
LTE         ("<=")
GTE         (">=")
ASSIGN      [=]
COMMA       [,]
L_PAREN     [\(]
R_PAREN     [\)]
PLUS        [+]
MIN         [-]
MUL         [*]
DIV         [\/]
INT_TYPE    ("int")
FLOAT_TYPE  ("float")
STRING_TYPE ("string")
NUMBER      [0-9]+
NEW_LINE    [\n]
ID          [a-zA-Z][a-zA-Z0-9]*
STRING      ("\""[^\"]*"\"")
IGNORE      [ \t]

%%

{PROGRAM}     {printf("PROGRAM: %s\n",yytext);}
{VAR}         {printf("VAR: %s\n",yytext);}
{L_BRACE}     {printf("L_BRACE: %s\n",yytext);}
{R_BRACE}     {printf("R_BRACE: %s\n",yytext);}
{IF}          {printf("IF: %s\n",yytext);}
{ELSE}        {printf("ELSE: %s\n",yytext);}
{WHILE}       {printf("WHILE: %s\n",yytext);}
{IN}          {printf("IN: %s\n",yytext);}
{OUT}         {printf("OUT: %s\n",yytext);}
{EQ}          {printf("EQ: %s\n",yytext);}
{NEQ}         {printf("NEQ: %s\n",yytext);}
{LT}          {printf("LT: %s\n",yytext);}
{GT}          {printf("GT: %s\n",yytext);}
{LTE}         {printf("LTE: %s\n",yytext);}
{GTE}         {printf("GTE: %s\n",yytext);}
{ASSIGN}      {printf("ASSIGN: %s\n",yytext);}
{COMMA}       {printf("COMMA: %s\n",yytext);}
{L_PAREN}     {printf("L_PAREN: %s\n",yytext);}
{R_PAREN}     {printf("R_PAREN: %s\n",yytext);}
{PLUS}        {printf("PLUS: %s\n",yytext);}
{MIN}         {printf("MIN: %s\n",yytext);}
{MUL}         {printf("MUL: %s\n",yytext);}
{DIV}         {printf("DIV: %s\n",yytext);}
{INT_TYPE}    {printf("INT_TYPE: %s\n",yytext);}
{FLOAT_TYPE}  {printf("FLOAT_TYPE: %s\n",yytext);}
{STRING_TYPE} {printf("STRING_TYPE: %s\n",yytext);}
{NUMBER}      {printf("NUMBER: %s\n",yytext);}
{STRING}      {printf("STRING: %s\n",yytext);}
{NEW_LINE}    {printf("NEW_LINE\n");}
{ID}          {printf("ID: %s\n",yytext);}
{IGNORE}      {;}

%%

int main() {
    yylex();
    return 0;
}
