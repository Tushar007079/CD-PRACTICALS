%{
#include <stdio.h>
#include <stdlib.h>

int count = 0; 
%}

%%

[aA][a-zA-Z0-9]*[bB]\b   { 
    count++; 
    printf("Matched word: %s\n", yytext); 
}
[a-zA-Z0-9]+            
[ \t\n]+                

%%

int yywrap() {
    return 1; 

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error: Could not open file %s\n", argv[1]);
        return 1;
    }

    yylex(); 
    fclose(yyin); 

    printf("Words starting with 'a' and ending with 'b': %d\n", count);
    return 0;
}