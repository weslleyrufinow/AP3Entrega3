%{
#include <stdlib.h>
#define YY_DECL int yylex()
#include "ap2Bison.tab.h"
%}

VAR      ("VAR")
PROGRAM  ("PROGRAM")
L_BRACE  [\{]
R_BRACE  [\}]
IGNORAR  [ \t\n]

%%

{VAR}                {printf("VAR\n"); return VAR;}
{PROGRAM}            {printf("PROGRAM\n"); return PROGRAM;}
{L_BRACE}            {printf("R_BRACE\n"); return L_BRACE;}
{R_BRACE}            {printf("L_BRACE\n"); return R_BRACE;}
{IGNORAR}            {;}

%%

