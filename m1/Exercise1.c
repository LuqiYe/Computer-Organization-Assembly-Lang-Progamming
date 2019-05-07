//  Exercise 1 soluton, C program

#include <stdio.h>
#include <stdlib.h>


// input argument character and return the binary equivalent, else return -1
int exercise1_function(char character_input)
{
    // check if input not 0 or 1
    if(character_input != '0' || character_input != '1')
    {
        // return -1
        return -1;
    }

    else 
    {
        // else return the binary equivalent
        if(character_input == '0')
            return 0;
        else 
            return 1;
    }

}

int main() 
{
    // declare variables and get user input
    int binaryValue;
    char character_input;
    printf("Please input a character value: ");
    scanf("%c", &character_input);

    // function call with input character 
    binaryValue = exercise1_function(character_input);

    // if result is not -1, display binary equivalent
    if(binaryValue != -1)
    {
        printf("Binary value: %d\n\n",binaryValue);
    }
    // else print invalid 
    else
    {
        printf("\nThe character %c is invalid: %c is not a bit\n\n", character_input, character_input);
    }
    return 0;
}


