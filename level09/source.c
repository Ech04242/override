#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct  s_msg {
    char        message[140];
    char        username[40];
    int         size;
}               t_msg;

void secret_backdoor() {
    char s[128];
    fgets(s, 128, stdin);
    system(s);
}

void set_msg(t_msg *msg) {
    char s[1024] = {0};
    puts(">: Msg @Unix-Dude");
    printf(">>: ");
    fgets(s, 1024, stdin);
    strncpy(msg->message, s, msg->size);
}

void set_username(t_msg *msg) {
    char s[128] = {0};
    puts(">: Enter your username");
    printf(">>: ");
    fgets(s, 128, stdin);
    s[128] = 0;
    for (int i = 0; i <= 40 && s[i]; i++)
        msg->username[i] = s[i];
    printf(">: Welcome, %s", msg->username);
}

void handle_msg() {
    t_msg msg;
    memset(&msg, 0, sizeof(t_msg));
    msg.size = 140;
    set_username(&msg);
    set_msg(&msg);
    puts(">: Msg sent!");
}

int main(int argc, const char **argv, const char **envp) {
    puts(
        "--------------------------------------------\n"
        "|   ~Welcome to l33t-m$n ~    v1337        |\n"
        "--------------------------------------------"
    );
    handle_msg();
    return 0;
}