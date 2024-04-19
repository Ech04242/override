#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/ptrace.h>

void clear_stdin() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
}

int get_unum() {
    int num;
    fflush(stdout);
    scanf("%u", &num);
    clear_stdin();
    return num;
}

bool auth(char *login, int serial) {
    login[strcspn(login, "\n")] = '\0';
    int length = strnlen(login, 32);
    if (length <= 5)
        return 1;
    if (ptrace(PTRACE_TRACEME, 0, 1, 0) == -1) {
        puts("\x1B[32m.---------------------------.");
        puts("\x1B[31m| !! TAMPERING DETECTED !!  |");
        puts("\x1B[32m'---------------------------'");
        return 1;
    } 
    int checksum = (login[3] ^ 0x1337) + 6221293;
    for (int i = 0; i < length; ++i) {
        if (login[i] <= 31)
            return 1;
        checksum += (checksum ^ (unsigned int)login[i]) % 0x539;
    }
    return serial != checksum;
}

int main() {
    puts("***********************************");
    puts("*\t\tlevel06\t\t  *");
    puts("***********************************");
    printf("-> Enter Login: ");
    char login[32];
    fgets(login, 32, stdin);
    puts("***********************************");
    puts("***** NEW ACCOUNT DETECTED ********");
    puts("***********************************");
    printf("-> Enter Serial: ");
    int serial = get_unum();
    if (auth(login, serial))
        return 1;
    puts("Authenticated!");
    system("/bin/sh");
    return 0;
}