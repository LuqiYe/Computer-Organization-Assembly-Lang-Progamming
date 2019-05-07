//  Exercise 3 soluton, C program

/*****************************************************************************\
*                             Global system headers                           *
\*****************************************************************************/
#include <stdio.h>
#include <stdlib.h>


/*****************************************************************************\
*                               Function prototypes                           *
\*****************************************************************************/
char* exercise3_function(int decimalNumber);



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
    // declare variable and get user input dcimal number
    int decimalNumber;
    printf("Please input a  decimal number: ");
    scanf("%d", &decimalNumber);
    
    if(decimalNumber  > 0)    
    {
        // function return the value to string
        char *binaryString = exercise3_function(decimalNumber);
        // display resilt
        printf("Binary equivalent of %d is %s\n",decimalNumber, binaryString);
    }
    else
    {
        printf("Invaid Input\n");
    }

    
    
}



/***********************************************************************\
* Input : decimal number (int)                                          *          
* Output: binary binaryString                                           *        
* Function: returns the binary string corresponding to number           *
\***********************************************************************/
char* exercise3_function(int decimalNumber)
{
    // integer array to hold binary numbers
    int len = 0;
    int binaryNumber[100000];
    int number = decimalNumber;
    // determine binary values until number is greater than 0
    while (number > 0) 
    {
        // calculare result of logic operation and add to binaryNumber
        binaryNumber[len] = number&1;
        len++;
        // after extracting rightmost bit, push all bits to right
        number = number >> 1;
        
    }
    // declae a binary string
    char *binaryString = malloc (sizeof (char) * len);
    // reverse the binary int array and assign it to binary string
    for (int idx = len-1; idx >= 0; --idx)
    {
        binaryString[len-idx-1] =   binaryNumber[idx] + '0';
    }
    // return the final binary string
    return binaryString;
}