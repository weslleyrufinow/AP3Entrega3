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

{PROGRAM}     {printf("%s ", yytext);}
{VAR}         {printf("%s ", yytext);}
{L_BRACE}     {printf("%s ", yytext);}
{R_BRACE}     {printf("%s ", yytext);}
{IF}          {printf("%s ", yytext);}
{ELSE}        {printf("%s ", yytext);}
{WHILE}       {printf("%s ", yytext);}
{IN}          {printf("%s ", yytext);}
{OUT}         {printf("%s ", yytext);}
{EQ}          {printf("%s ", yytext);}
{NEQ}         {printf("%s ", yytext);}
{LT}          {printf("%s ", yytext);}
{GT}          {printf("%s ", yytext);}
{LTE}         {printf("%s ", yytext);}
{GTE}         {printf("%s ", yytext);}
{ASSIGN}      {printf("%s ", yytext);}
{COMMA}       {printf("%s ", yytext);}
{L_PAREN}     {printf("%s ", yytext);}
{R_PAREN}     {printf("%s ", yytext);}
{PLUS}        {printf("%s ", yytext);}
{MIN}         {printf("%s ", yytext);}
{MUL}         {printf("%s ", yytext);}
{DIV}         {printf("%s ", yytext);}
{INT_TYPE}    {printf("%s ", yytext);}
{FLOAT_TYPE}  {printf("%s ", yytext);}
{STRING_TYPE} {printf("%s ", yytext);}
{NUMBER}      {printf("%s ", yytext);}
{STRING}      {printf("%s ", yytext);}
{NEW_LINE}    {printf("\n");}
{ID}          {printf("%s ", yytext);}
{IGNORE}      {;}

%%

int main() {
    yylex();return 0;
}
