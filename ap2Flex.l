%{
#include <stdlib.h>
#define YY_DECL int yylex()
#include "ap2Bison.tab.h"
%}

VAR         ("VAR")
PROGRAM     ("PROGRAM")
L_BRACE     [\{]
R_BRACE     [\}]
L_PAREN     [\(]
R_PAREN     [\)]
COMMA       [\,]
SEMICOLON   [\;]
IF          ("if")
ELSE        ("else")
WHILE       ("while")
IN          ("in")
OUT         ("out")
IGNORE      [ \n\t]*
INT_TYPE    ("int")
FLOAT_TYPE  ("float")
STRING_TYPE ("string")
ID          [a-zA-Z][a-zA-Z0-9]*
FLOAT       [+-]?[0-9]+(\.)([0-9]+)*
INT         [+-]?[0-9]+
ASSIGN      ("=")
SUM         ("+")
SUB         ("-")
MUL         ("*")
DIV         ("/")
EQ          ("==")
NEQ         ("!=")
LT          ("<")
GT          (">")
LTE         ("<=")
GTE         (">=")
STRING      (\"([^"]*)\")

%%

{VAR}         {return VAR;}
{PROGRAM}     {return PROGRAM;}
{L_BRACE}     {return L_BRACE;}
{R_BRACE}     {return R_BRACE;}
{L_PAREN}     {return L_PAREN;}
{R_PAREN}     {return R_PAREN;}
{COMMA}       {return COMMA;}
{SEMICOLON}   {return SEMICOLON;}
{IF}          {return IF;}
{ELSE}        {return ELSE;}
{WHILE}       {return WHILE;}
{IN}          {return IN;}
{OUT}         {return OUT;}
{IGNORE}      {;}
{INT_TYPE}    {return INT_TYPE;}
{FLOAT_TYPE}  {return FLOAT_TYPE;}
{STRING_TYPE} {return STRING_TYPE;}
{ID}          {yylval.str = strdup(yytext); return ID;}
{FLOAT}       {yylval.numfloat = atoi(yytext); return FLOAT;}
{INT}         {yylval.numint = atoi(yytext); return INT;}
{ASSIGN}      {return ASSIGN;}
{SUM}         {return SUM;}
{SUB}         {return SUB;}
{MUL}         {return MUL;}
{DIV}         {return DIV;}
{EQ}          {return EQ;}
{NEQ}         {return NEQ;}
{LT}          {return LT;}
{GT}          {return GT;}
{LTE}         {return LTE;}
{GTE}         {return GTE;}
{STRING}      {return STRING;}


%%

