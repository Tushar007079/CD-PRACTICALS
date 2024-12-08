#include<stdio.h>
#include<conio.h>

void main() {
    // Declaration of variable
    int a, b = 1000, c, i = 10; // Integer declarations
    char x, y;                 // Character declarations
    char a = 'x';              // Incorrect: redeclaration of 'a'
    float p = 10.2, q = 20.5;  // Float declarations

    scanf("%d %d", &a, &b);   // Input two integers

    /*
    Addition of Two number
    */
    c = a + b;                 // Addition of a and b
    printf("Sum: %d", c);      // Print sum

    // Comment1
    if (a > b) {               // If statement to check max
        printf("a is max");
    } else {
        printf("b is max");
    }
    
    a = b++ + c++;             // Post-increment a and b
    a += b;                    // Add b to a
    b = c && a;                // Logical AND assignment

    // Print 1 to 100
    for (i = 1; i < 100; i++) { // Loop to print numbers
        printf("%d", i);
    }
}
