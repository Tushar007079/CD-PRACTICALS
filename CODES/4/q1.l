%{
int INT = 0, FLOAT = 0, EP = 0;
%}
%%
[+-]?[0-9]+ { printf("%s is an integer\n", yytext); INT++; }
[+-]?[0-9]*[.][0-9]+ { printf("%s is a float\n", yytext); FLOAT++; }
[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)([eE][+-]?[0-9]+)? { printf("%s is an exponential value\n", yytext); EP++; }
%%
int yywrap(){
    return 1;
}

int main() {
    yylex();
    printf("Number of\n1. Integer values: %d\n2. Float numbers: %d\n3. Exponential values: %d\n", INT, FLOAT, EP);
    return 0;
}
