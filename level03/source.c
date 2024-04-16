#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int clear_stdin() {
  int result;

  do
    result = getchar();
  while ((char)result != '\n' && (char)result != 0xFF);
  return result;
}

int get_unum(){
  int userInput[3];

  userInput[0] = 0;
  fflush(stdout);
  scanf("%u", userInput);
  clear_stdin();
  return userInput[0];
}

int decrypt(char input) {
  unsigned int i;
  unsigned int length;
  char encryptedMessage[29];

  strcpy(encryptedMessage, "Q}|u`sfg~sf{}|a3");
  length = strlen(encryptedMessage);
  for (i = 0; i < length; ++i)
    encryptedMessage[i] ^= input;
  if (!strcmp(encryptedMessage, "Congratulations!"))
    return system("/bin/sh");
  else
    return puts("\nInvalid Password");
}

int test(int lowerBound, int upperBound) {
  int difference;

  difference = upperBound - lowerBound;
  switch (difference) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
      return decrypt(difference);
    default:
      difference = rand();
      return decrypt(difference);
  }
}

int main(int argc, const char **argv) {
  unsigned int seed;

  seed = time(0);
  srand(seed);
  puts("***********************************");
  puts("*\t\tlevel03\t\t**");
  puts("***********************************");
  printf("Password:");
  int userInput = get_unum();
  test(userInput, 322424845);
  return 0;
}
