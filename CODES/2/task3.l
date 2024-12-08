%{
#include <stdio.h>
#include <string.h>
int count_a = 0;
int count_a_star_b_plus = 0;
int count_abb = 0;
int count_b_star = 0;
extern FILE *yyin;
%}

%%

abb             { printf("Matched 'abb'\n"); count_abb++; }
a*b+            { printf("Matched 'a*b+'\n"); count_a_star_b_plus++; }
a               { printf("Matched 'a'\n"); count_a++; }
b+              { /* We use 'b+' here, but will adjust count for 'b*' later */ }
.               { /* Ignore any other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    FILE *file = fopen("q3.txt", "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    yyin = file; 
    yylex();

    rewind(file);
    yyin = file;

    char buffer[1024];
    while (fgets(buffer, sizeof(buffer), file)) {
        char *ptr = buffer;
        while (*ptr) {
            if (*ptr == 'b') {
                count_b_star++;
                while (*ptr == 'b') ptr++; // Skip over the rest of the 'b's
            } else {
                ptr++;
            }
        }
    }

    fclose(file);
    printf("\nCounts:\n'a': %d\n'a*b+': %d\n'abb': %d\n'b*': %d\n", count_a, count_a_star_b_plus, count_abb, count_b_star);
    return 0;
}
