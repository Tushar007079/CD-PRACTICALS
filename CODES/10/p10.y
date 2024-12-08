%{
    /* Definition section */
    #include <stdio.h>
    #include <stdlib.h> /* For atoi */

    int yylex(void);       /* Prototype for yylex */
    int yyerror(const char *s); /* Prototype for yyerror */
%}

/* Union declaration for semantic values */
%union {
    int num;  // For numeric values
    char* str;  // For identifiers
}

/* Token declarations with associated types */
%token <num> NUMBER
%token <num> ID

/* Declare types for non-terminals */
%type <num> E T

/* Operator precedence and associativity */
%left '+' '-'
%left '*' '/'

%%
E:
    T {
        printf("Result = %d\n", $1);
        return 0;
    }
;

T:
    T '+' T { $$ = $1 + $3; }
    | T '-' T { $$ = $1 - $3; }
    | T '*' T { $$ = $1 * $3; }
    | T '/' T {
        if ($3 == 0) {
            yyerror("Division by zero!");
            exit(1);
        }
        $$ = $1 / $3;
    }
    | '(' T ')' { $$ = $2; }
    | NUMBER { $$ = $1; }
;
%%

int main() {
    printf("Enter the expression:\n");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
