%{
#include <stdio.h>
#include <string.h>  

int kw = 0, op = 0, sym = 0, id = 0, cons = 0, com = 0;

char *keywords[] = {"int", "return", "if", "else", "while", "for", "float", "char", "double", "void"};
int is_keyword(char *s) {
    for(int i = 0; i < 10; i++) 
        if(strcmp(s, keywords[i]) == 0) 
            return 1;
    return 0;
}
%}

%%

"/*"([^*]|\*+[^*/])*\*+"/"      { com++; }       
"//".*                          { com++; }       

[0-9]+                          { cons++; }      
[a-zA-Z_][a-zA-Z0-9_]*           { if(is_keyword(yytext)) kw++; else id++; }  

"+"|"-"|"*"|"/"|"%"|"="|"<"|">"  { op++; }       
"(" | ")" | "{" | "}" | "[" | "]" | "," | ";" { sym++; }  

[ \t\n]+                        
.                               

%%

int yywrap() {
    return 1;  
}

int main(int argc, char *argv[]) {
    if(argc > 1) 
        yyin = fopen(argv[1], "r");
    else { 
        printf("Usage: %s <C source file>\n", argv[0]); 
        return 1;
    }
    yylex();
    fclose(yyin); 
    printf("Keywords: %d\nOperators: %d\nSpecial Symbols: %d\nIdentifiers: %d\nConstants: %d\nComments: %d\n", kw, op, sym, id, cons, com);
    return 0;
}
