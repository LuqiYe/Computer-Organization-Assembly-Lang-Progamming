
/*****************************************************************************\
* Programmin Assignment COMP 3350                                             *
* Author: Saad Biaz                                                           *
* Date  : May 22, 2018                                                   *
\*****************************************************************************/

/*****************************************************************************\
*                             Global system headers                           *
\*****************************************************************************/
#include <stdio.h>
#include <stdlib.h>



/*****************************************************************************\
*                             Global data types                               *
\*****************************************************************************/



/*****************************************************************************\
*                             Global definitions                              *
\*****************************************************************************/





/*****************************************************************************\
*                            Global data structures                           *
\*****************************************************************************/




/*****************************************************************************\
*                                  Global data                                *
\*****************************************************************************/



/*****************************************************************************\
*                               Function prototypes                           *
\*****************************************************************************/

unsigned int         binaryDigit2Value(char whichCharacter);
unsigned int         hexaDigit2Value(char whichCharacter);
char                 *integerToString(unsigned int number);


/*****************************************************************************\
* function: main()                                                            *
* usage:    command line with no parameter - main tries 3 fi=unctions         *
*******************************************************************************
* Inputs: ANSI flat C NO command line parameters                              *
* Output: None                                                                *
*                                                                             *

\*****************************************************************************/

int main () {
  printf("binaryDigit2Value %d\n",binaryDigit2Value('1'));
  printf("hexaDigit2Value %d\n",hexaDigit2Value('C'));
  printf("hexaDigit2Value %s\n",integerToString(12));
} /* end of main function */

/***********************************************************************\
* Input : binary digit (character)                                      *          
* Output: value of the digit                                            *        
* Function: returns value of binary digit                               *
\***********************************************************************/
unsigned int         binaryDigit2Value(char whichCharacter){
  unsigned int value;
  // Convert here from digit character to value       
  // ........
  value = 1;
  return(value);
}

/***********************************************************************\
* Input : hexadecimal digit (character)                                 *
* Output: value of the digit                                            *           
* Function: returns value of binary digit                               *                                               
\***********************************************************************/
unsigned int         hexaDigit2Value(char whichCharacter){
  unsigned int value;
  // Convert here from digit character to value
  // .....
  value = 12;
  return(value);
}

/***********************************************************************\
* Input : integer number n                                              *
* Output: string s of characters representing n in binary               * 
* Function: returns a string s                                          *                                              
\***********************************************************************/
char                 *integerToString(unsigned int number){
  unsigned int value;
  char *string;
  // Convert here n to a string                
  // .....   
  string = malloc(33); // 33 = 32+1 as string of 32 charcaters + null characters at the end
  string[0] = 'B';
  string[1] = 'o';
  string[2] = 'n';
  string[3] = 'j';
  string[4] = 'o';
  string[5] = 'u';
  string[6] = 'r';
  string[7] = '\0';
  return(string);
}


