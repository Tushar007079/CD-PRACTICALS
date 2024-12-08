#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Function declarations for each non-terminal
void E();
void E_();
void T();
void T_();
void F();

char input[100]; // Input string
int current = 0; // Pointer to traverse the input string

// Function to check the current character and move forward
void match(char expected) {
    if (input[current] == expected) {
        current++;
    } else {
        printf("Error: Unexpected character '%c' at position %d\n", input[current], current);
        exit(1);
    }
}

// Non-terminal: E → T E'
void E() {
    T();
    E_();
}

// Non-terminal: E' → + T E' | ε
void E_() {
    if (input[current] == '+') {
        match('+');
        T();
        E_();
    }
    // ε-production: Do nothing and return
}

// Non-terminal: T → F T'
void T() {
    F();
    T_();
}

// Non-terminal: T' → * F T' | ε
void T_() {
    if (input[current] == '*') {
        match('*');
        F();
        T_();
    }
    // ε-production: Do nothing and return
}

// Non-terminal: F → ( E ) | a
void F() {
    if (input[current] == '(') {
        match('(');
        E();
        match(')');
    } else if (input[current] == 'a') {
        match('a');
    } else {
        printf("Error: Unexpected character '%c' at position %d\n", input[current], current);
        exit(1);
    }
}

// Main function
int main() {
    printf("Enter the input string (end with '$'): ");
    scanf("%s", input);

    // Start parsing from the start symbol: E
    E();

    // Check if the entire input string has been consumed
    if (input[current] == '$') {
        printf("Success: The input string is accepted by the grammar.\n");
    } else {
        printf("Error: Unconsumed input starting at position %d\n", current);
    }

    return 0;
}
