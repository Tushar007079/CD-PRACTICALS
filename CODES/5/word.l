%{
#include <stdio.h>
int valid = 0;
%}
%%
[+-]?[0-9]+ { printf("Integer: %s\n", yytext); valid++; }
[+-]?[0-9]*\.[0-9]+ { printf("Float: %s\n", yytext); valid++; }
[+-]?[0-9]*\.[0-9]+([eE][+-]?[0-9]+)? { printf("Exponential: %s\n", yytext); valid++; }
int|char|float|void|main|if|else|for|else[ ]if|scanf|printf { printf("Keywords: %s\n", yytext); valid++; }
"/*"([^*]|\*+[^*/])*\*+"/" { /* Ignore multi-line comments */ }
"//".* { /* Ignore single-line comments */ }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); valid++; }
\"([^\\\"]|\\.)*\" { printf("String: %s\n", yytext); valid++; }
[\(\)\[\]\{\}\+\-\*\/\=\>\<\!\&\|\%\^\;\,\.\?] { printf("Operators/Brackets: %s\n", yytext); valid++; }
\+\+|\-\-|\+=|-=|\*=|\/=|\%=|\&=|\|=|\^=|\!=|\==|<=|>=|\&&|\|\| { printf("Operators: %s\n", yytext); valid++; }
\#.* { printf("Header: %s\n", yytext); valid++; }
\'([^\\\']|\\.)*\' { printf("Character: %s\n", yytext); valid++; }  // Changed to "Character"
\n { /* Ignore newlines */ }
[ \t]+ { /* Ignore whitespace */ }
. { printf("Unrecognized Character: %s\n", yytext); }
%%
int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("P5.c", "r");
    if (!yyin) {
        perror("Error opening file");
        return 1;
    }
    yylex();
    printf("Valid Tokens: %d\n", valid);
    fclose(yyin);  // Added file closure
    return 0;
}
