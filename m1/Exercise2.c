//  Exercise 2 soluton, C program
#include <stdio.h>
#include <stdlib.h>

// input argument character and return the binary equivalent, else return -1
int exercise2_function(char character_input)
{
    // check if input character is from A , B C D E F
    if(character_input == 'A' || character_input == 'B' || character_input == 'C'|| character_input == 'D'|| character_input == 'E' || character_input <= 'F')
            return (character_input - '7');
    // check if character is between 0 and 9
    if(character_input == '0'|| character_input == '1' || character_input == '2'|| character_input == '3'|| character_input == '4'|| character_input == '5'|| character_input == '6'|| character_input == '7'|| character_input == '8'|| character_input == '9')
        return (character_input - '0');
    
    // else if any other character is present return -1
    return -1;
}

int main() 
{
    // declare variables and get user input
    char character_input;
    int hexadecimalValue;
    
    printf("Please input a character: ");
    scanf("%c", &character_input);
    
    // function call with input character 
    hexadecimalValue = exercise2_function(character_input);

    // if hexadecimalValue is not -1, display hexa equivalent
    if(hexadecimalValue != -1)
    {
        printf("%d\n",hexadecimalValue);
    }
    // else print invalid 
    else
    {
        printf("The character %c is invalid: %c is not a  hexadecimal digit\n", character_input, character_input);
    }
    return 0;
}


