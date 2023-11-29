%{
#include <stdlib.h>
#define YY_DECL int yylex()
#include "ap2Bison.tab.h"
%}

VAR      ("VAR")
PROGRAM  ("PROGRAM")
L_BRACE  [\{]
R_BRACE  [\}]
SEMICOLON  [\;]
IGNORAR  [ \n\t]*
INT_TYPE ("int")
STRING_TYPE ("string")
ID [a-zA-Z][a-zA-Z0-9]*

%%

{VAR}                {/*printf\("VAR\n"\);*/ return VAR;}
{PROGRAM}            {/*printf\("\nPROGRAM\n"\);*/ return PROGRAM;}
{L_BRACE}            {/*printf\("L_BRACE "\);*/ return L_BRACE;}
{R_BRACE}            {/*printf\("R_BRACE "\);*/ return R_BRACE;}
{SEMICOLON}          {/*printf\("SEMICOLON\n"\);*/ return SEMICOLON;}
{IGNORAR}            {;}
{INT_TYPE}           {/*printf\("INT_TYPE "\);*/ return INT_TYPE;}
{STRING_TYPE}        {/*printf\("STRING_TYPE "\);*/ return STRING_TYPE;}
{ID}                 {/*printf\("ID "\);*/ return ID;}


%%

