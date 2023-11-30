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
SEMICOLON  [\;]
IGNORAR  [ \n\t]*
INT_TYPE ("int")
STRING_TYPE ("string")
ID [a-zA-Z][a-zA-Z0-9]*
INT [+-]?[0-9]+
STRING (\"([^"]*)\")
ASSIGN ("=")
SUM ("+")
SUB ("-")
MUL ("*")
DIV ("/")

%%

{VAR}                {/*printf("VAR\n");*/ return VAR;}
{PROGRAM}            {/*printf("\nPROGRAM\n");*/ return PROGRAM;}
{L_BRACE}            {/*printf("L_BRACE ");*/ return L_BRACE;}
{R_BRACE}            {/*printf("R_BRACE ");*/ return R_BRACE;}
{L_PAREN}            {/*printf("L_PAREN ");*/ return L_PAREN;}
{R_PAREN}            {/*printf("R_PAREN ");*/ return R_PAREN;}
{SEMICOLON}          {/*printf("SEMICOLON\n");*/ return SEMICOLON;}
{IGNORAR}            {;}
{INT_TYPE}           {/*printf("INT_TYPE ");*/ return INT_TYPE;}
{STRING_TYPE}        {/*printf("STRING_TYPE ");*/ return STRING_TYPE;}
{ID}                 {/*printf("ID ");*/ return ID;}
{INT}                {/*printf("INT ");*/ return INT;}
{STRING}             {/*printf("STRING ");*/ return STRING;}
{ASSIGN}             {/*printf("ASSIGN ");*/ return ASSIGN;}
{SUM}                {/*printf("SUM ");*/ return SUM;}
{SUB}                {/*printf("SUB ");*/ return SUB;}
{MUL}                {/*printf("MUL ");*/ return MUL;}
{DIV}                {/*printf("DIV ");*/ return DIV;}

%%
