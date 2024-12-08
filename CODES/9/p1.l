%{
#include "p1.tab.h"
#include <string.h> /* Include this for strdup */
%}

%%
"int"           { return INT; }
"float"         { return FLOAT; }
"char"          { return CHAR; }
[ \t\n]+        ; /* Ignore whitespace */
[a-zA-Z_][a-zA-Z0-9_]* {
                    yylval.str = strdup(yytext);
                    return ID;
                 }
";"             { return SEMICOLON; }
","             { return COMMA; }
%%

int yywrap(void) {
    return 1;
}
