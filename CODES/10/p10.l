%{
    #include "p10.tab.h"
    #include <stdlib.h>  // For malloc and strcpy
    #include <string.h>  // For strcpy
%}

%% 
[0-9]+ {
    yylval.num = atoi(yytext);  // Assign numeric value
    return NUMBER;
}

[a-zA-Z]+ {
    yylval.str = malloc(strlen(yytext) + 1);  // Allocate memory for the string
    strcpy(yylval.str, yytext);  // Copy the identifier to yylval.str
    return ID;
}

[ \t]+ ;  // Skip whitespaces

\n { return 0; }  // End of input

. { return yytext[0]; }  // Return individual characters
%%

int yywrap() {
    return 1;  // End of file
}
