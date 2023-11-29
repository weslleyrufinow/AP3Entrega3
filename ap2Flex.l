%{
  #include <stdlib.h>
  #define YY_DECL int yylex()
  #include "ap2Bison.tab.h"
%}

VAR ("var")
PRINT ("print")
ID [a-zA-Z][a-zA-Z0-9]*
OP_ATT [=]
OP_SOM [+]
OP_SUB [-]
OP_MUL [*]
OP_DIV [/]
INTEIRO [-+]?[0-9]+
PONTO_E_VIRGULA [;]
JOGO_DA_VELHA #
ESPACO [ \t]
BARRA_N [\n]
COMENTARIO "#".*\n


%%

{VAR}                {return VAR;}
{PRINT}              {return PRINT;}
{ID}                 {yylval.sval = strdup(yytext); return ID;}
{OP_ATT}             {return OP_ATT;}
{OP_SOM}             {return OP_SOM;}
{OP_SUB}             {return OP_SUB;}
{OP_MUL}             {return OP_MUL;}
{OP_DIV}             {return OP_DIV;}
{INTEIRO}            {yylval.ival = atoi(yytext); return INTEIRO;}
{PONTO_E_VIRGULA}    {return PONTO_E_VIRGULA;}
{JOGO_DA_VELHA}      {;}
{ESPACO}             {;}
{BARRA_N}            {return BARRA_N;}
{COMENTARIO}         {;}

%%
