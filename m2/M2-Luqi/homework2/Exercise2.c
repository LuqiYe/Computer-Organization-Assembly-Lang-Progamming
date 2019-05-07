//  Exercise 2 soluton, C program

/*****************************************************************************\
*                             Global system headers                           *
\*****************************************************************************/
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

/*****************************************************************************\
*                               Function prototypes                           *
\*****************************************************************************/
int exercise2_function1(char character_input);
int exercise2_function2(char* character_string);


/*****************************************************************************\
* function: main()                                                            *
* usage:    command line with no parameter                                    *
*******************************************************************************
* Inputs: ANSI flat C NO command line parameters                              *
* Output: None                                                                *
*                                                                             *
\*****************************************************************************/
int main() 
{
    // declare variables and get user input
    char character_string[4];
    int hexadecimalValue;
    
    printf("Please input a hex string: ");
    scanf("%s", character_string);
    
    // function call with input character 
    hexadecimalValue = exercise2_function2(character_string);

    // if hexadecimalValue is not -1, display hexa equivalent
    if(hexadecimalValue != -1)
    {
        printf("%d\n",hexadecimalValue);
    }
    // else print invalid 
    else
    {
        printf("The input %s is invalid: %s is not hexadecimal\n", character_string, character_string);
    }
}


/***********************************************************************\
* Input : hex input (character)                                         *          
* Output: value of the input hex                                        *        
* Function: returns value of hexadecimal input                          *
\***********************************************************************/
int exercise2_function1(char character_input)
{
    // check if input character is from A B C D E or F
    if(character_input == 'A' || character_input == 'B' || character_input == 'C'|| character_input == 'D'|| character_input == 'E' || character_input == 'F')
            return (character_input - '7');
    // check if character is between 0 and 9
    else if(character_input >= '0' &&  character_input <= '9')
        return (character_input - '0');
    
    // else if any other character is present return -1
    return -1;
}

/***********************************************************************\
* Input : hex input (string)                                            *          
* Output: value of the input hex  string                                *        
* Function: returns value of hexadecimal input string                   *
\***********************************************************************/
int exercise2_function2(char* character_string)
{
    int hexaDecimal = 0, charHexValue;
    int string_length = strlen(character_string);
    int i = string_length - 1;
    // while loop to iterate over string
    while(i >= 0)
    {
        // get haxdeximal values
        charHexValue = exercise2_function1(character_string[i]);

        // if value is negative, return -1
        if(charHexValue == -1)
            return -1;
        // else add it to hexadecimal number
        hexaDecimal = hexaDecimal + charHexValue*pow(16,string_length-i-1);

        i--;
    }


    return hexaDecimal;
    
}