//  Exercise 1 soluton, C program


/*****************************************************************************\
*                             Global system headers                           *
\*****************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/*****************************************************************************\
*                               Function prototypes                           *
\*****************************************************************************/
int exercise1_function1(char character_input);
int exercise1_function2(char* binary_string);



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
    int binaryValue;
    char binary_string[16];
    printf("Please input a binary string: ");
    scanf("%s", binary_string);

    // function call with input character 
    binaryValue = exercise1_function2(binary_string);

    // if result is not -1, display binary equivalent
    if(binaryValue != -1)
    {
        printf("Binary value: %d\n\n",binaryValue);
    }
    // else print invalid 
    else
    {
        printf("\nThe binary string %s is invalid: %s is not a binary string\n\n", binary_string, binary_string);
    }
}



/***********************************************************************\
* Input : binary digit (character)                                      *          
* Output: value of the digit                                            *        
* Function: returns value of binary digit                               *
\***********************************************************************/
int exercise1_function1(char character_input)
{
    // check if input is not 0 or 1
    if(character_input != '0' && character_input != '1')
    {
        // return -1
        return -1;
    }

    else 
    {
        // else return the binary equivalent
        return character_input - '0';
        
    }

}



/***********************************************************************\
* Input : binary string (char*)                                         *          
* Output: value of the binary string                                    *        
* Function: returns value of binary string                              *
\***********************************************************************/
int exercise1_function2(char* binary_string)
{
    int decimalResult = 0, binaryCharDecimalValue;
    int string_length = strlen(binary_string);
    int i = string_length - 1;
    // while loop to iterate over string
    while(i >= 0)
    {
        // get haxdeximal values
        binaryCharDecimalValue = exercise1_function1(binary_string[i]);

        // if value is negative, return -1
        if(binaryCharDecimalValue == -1)
            return -1;
        // else add it to decimal number
        decimalResult = decimalResult + binaryCharDecimalValue*pow(2,string_length-i-1);

        i--;
    }


    return decimalResult;
    
}