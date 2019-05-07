//  Exercise 3 soluton, C program
#include <stdio.h>
#include <stdlib.h>

// input a decimal number and return binary equivalent
char* exercise3_function(int decimalNumber)
{
    // integer array to hold binary numbers
    int len = 0;
    int binaryNumber[100000];
    int number = decimalNumber;
    // determine binary values until number is greater than 0
    while (number > 0) 
    {
        // store binary value in array
        binaryNumber[len] = number%2;
        len++;
        // divide the number by 2
        number = number / 2;
        
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

int main() 
{
    // declare variable and get user input dcimal number
    int decimalNumber;
    printf("Please input a  decimal number: ");
    scanf("%d", &decimalNumber);
    
    // function return the value to string
    char *binaryString = exercise3_function(decimalNumber);

    // display resilt
    printf("Binary equivalent of %d is %s\n",decimalNumber, binaryString);
    return 0;
}


