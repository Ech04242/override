#include <stdio.h>
#include <string.h>

void clear_stdin() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
}

unsigned int get_unum() {
    unsigned int num;

    fflush(stdout);
    scanf("%u", &num);
    clear_stdin();

    return num;
}

int store_number(unsigned int *data) {
    unsigned int index, number;

    printf(" Number: ");
    number = get_unum();
    printf(" Index: ");
    index = get_unum();

    if (!(index % 3) || number >> 0x18 != 0xb7) {
        puts(" *** ERROR! ***");
        puts("   This index is reserved for wil!");
        puts(" *** ERROR! ***");
        return 1;
    }
    data[index << 2] = number;
    return 0;
}

int read_number(unsigned int *data) {
    unsigned int index;

    printf(" Index: ");
    index = get_unum();
    printf(" Number at data[%u] is %u\n", index, data[index << 2]);
    return 0;
}

int main(int argc, char **argv, char **envp) {
    unsigned int data[100] = {0};
    char command[20] = {0};

    memset(*argv, 0, strlen(*argv));
    memset(*envp, 0, strlen(*envp));

    puts("----------------------------------------------------\n"\
         " Welcome to wil's crappy number storage service!    \n"\
         "----------------------------------------------------\n"\
         " Commands:                                          \n"\
         "    store - store a number into the data storage    \n"\
         "    read  - read a number from the data storage     \n"\
         "    quit  - exit the program                        \n"\
         "----------------------------------------------------\n"\
         "   wil has reserved some storage :>                 \n"\
         "----------------------------------------------------\n");

    while (1) {
        printf("Input command: ");
        int ret = 0;
        fgets(command, 20, stdin);
        command[strlen(command) - 1] = 0;

        if (!strcmp(command, "store"))
            ret = store_number(data);
        else if (!strcmp(command, "read"))
            ret = read_number(data);
        else if (!strcmp(command, "quit"))
            break;
        else
            ret = 1;

        if (!ret)
            printf(" Completed %s command successfully\n", command);
        else
            printf(" Failed to do %s command\n", command);
        memset(command, 0, 20);
    }
    return 0;
}