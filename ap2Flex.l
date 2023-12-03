%{
#include <stdlib.h>
#define YY_DECL int yylex()
#include "ap2Bison.tab.h"
%}

VAR      ("VAR")
PROGRAM  ("PROGRAM")
L_BRACE  [\{]
R_BRACE  [\}]
L_PAREN  [\(]
R_PAREN  [\)]
COMMA [\,]
SEMICOLON  [\;]
IF   ("if")
ELSE ("else")
WHILE ("while")
IN ("in")
OUT ("out")
IGNORAR  [ \n\t]*
INT_TYPE ("int")
FLOAT_TYPE ("float")
STRING_TYPE ("string")
ID [a-zA-Z][a-zA-Z0-9]*
DOT [\.]
FLOAT [+-]?[0-9]+(\.[0-9]+)+
INT [+-]?[0-9]+
ASSIGN ("=")
SUM ("+")
SUB ("-")
MUL ("*")
DIV ("/")
EQ  ("==")
NEQ ("!=")
LT  ("<")
GT  (">")
LTE ("<=")
GTE (">=")
STRING (\"([^"]*)\")

%%

{VAR}         {/*printf("VAR\n");*/ return VAR;}
{PROGRAM}     {/*printf("\nPROGRAM\n");*/ return PROGRAM;}
{L_BRACE}     {/*printf("L_BRACE ");*/ return L_BRACE;}
{R_BRACE}     {/*printf("R_BRACE ");*/ return R_BRACE;}
{L_PAREN}     {/*printf("L_PAREN ");*/ return L_PAREN;}
{R_PAREN}     {/*printf("R_PAREN ");*/ return R_PAREN;}
{COMMA}       {/*printf("SEMICOLON\n");*/ return COMMA;}
{SEMICOLON}   {/*printf("SEMICOLON\n");*/ return SEMICOLON;}
{IF}          {/*printf("IF ");*/  return IF;}
{ELSE}        {/*printf("ELSE ");*/ return ELSE;}
{WHILE}       {/*printf("ELSE ");*/ return WHILE;}
{IN}          {/*printf("ELSE ");*/ return IN;}
{OUT}         {/*printf("ELSE ");*/ return OUT;}
{IGNORAR}     {;}
{INT_TYPE}    {/*printf("INT_TYPE ");*/ return INT_TYPE;}
{FLOAT_TYPE}    {/*printf("INT_TYPE ");*/ return FLOAT_TYPE;}
{STRING_TYPE} {/*printf("STRING_TYPE ");*/ return STRING_TYPE;}
{ID}          {/*printf("ID ");*/ return ID;}
{DOT}         {/*printf("INT ");*/ return DOT;}
{FLOAT}       {/*printf("INT ");*/ return FLOAT;}
{INT}         {/*printf("INT ");*/ return INT;}
{ASSIGN}      {/*printf("ASSIGN ");*/ return ASSIGN;}
{SUM}         {/*printf("SUM ");*/ return SUM;}
{SUB}         {/*printf("SUB ");*/ return SUB;}
{MUL}         {/*printf("MUL ");*/ return MUL;}
{DIV}         {/*printf("DIV ");*/ return DIV;}
{EQ}          {/*printf("EQ ");*/ return EQ;}
{NEQ}         {/*printf("NEQ ");*/ return NEQ;}
{LT}          {/*printf("LT ");*/ return LT;}
{GT}          {/*printf("GT ");*/ return GT;}
{LTE}         {/*printf("EQ ");*/ return LTE;}
{GTE}         {/*printf("GTE ");*/ return GTE;}
{STRING}      {/*printf("STRING ");*/ return STRING;}


%%

