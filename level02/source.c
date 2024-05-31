#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, const char **argv, const char **envp) {
  char userInput[100];
  char passwordFromFile[48];
  char userPassword[100];
  int bytesRead;
  FILE *passwordFile;

  memset(userInput, 0, sizeof(userInput));
  memset(passwordFromFile, 0, sizeof(passwordFromFile));
  memset(userPassword, 0, sizeof(userPassword));
  bytesRead = 0;
  passwordFile = NULL;

  passwordFile = fopen("/home/users/level03/.pass", "r");
  if (!passwordFile) {
    fwrite("ERROR: failed to open password file\n", 1, 36, stderr);
    exit(1);
  }

  bytesRead = fread(passwordFromFile, 1, 41, passwordFile);
  passwordFromFile[strcspn(passwordFromFile, "\n")] = '\0';

  if (bytesRead != 41) {
    fwrite("ERROR: failed to read password file\n", 1, 36, stderr);
    fwrite("ERROR: failed to read password file\n", 1, 36, stderr);
    exit(1);
  }

  fclose(passwordFile);

  puts("===== [ Secure Access System v1.0 ] =====");
  puts("/***************************************\\");
  puts("| You must login to access this system. |");
  puts("\\**************************************/");
  printf("--[ Username: ");
  fgets(userInput, 100, stdin);
  userInput[strcspn(userInput, "\n")] = '\0';
  printf("--[ Password: ");
  fgets(userPassword, 100, stdin);
  userPassword[strcspn(userPassword, "\n")] = '\0';
  puts("*****************************************");

  if (strncmp(passwordFromFile, userPassword, 41) != 0) {
    printf(userInput);
    puts(" does not have access!\n");
    exit(1);
  }

  printf("Greetings, %s!\n", userInput);
  system("/bin/sh");

  return 0;
}
