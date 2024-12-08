%{
#include <stdio.h>
%}
%%
"scanf" { printf("Keyword: %s\n", yytext); }
"printf" { printf("Keyword: %s\n", yytext); }
"%d" { printf("Format specifier: %s\n", yytext); }
"," { printf("Comma: %s\n", yytext); }
";" { printf("Semicolon: %s\n", yytext); }
"\"" { /* Ignore double quotes */ }
[ \t\n]+ { /* Ignore whitespace */ }
"&"[a-zA-Z_][a-zA-Z0-9_]* { printf("Address of Identifier: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
"(" { printf("Opening Parenthesis: %s\n", yytext); }
")" { printf("Closing Parenthesis: %s\n", yytext); }
. { printf("Unrecognized text: %s\n", yytext); }
%%
int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
