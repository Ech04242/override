#include <stdio.h>

int verify_user_name(char* name) {
    char* user = "dat_wil";
    for (int i = 0; i < 7; i++) {
        if (user[i] != name[i])
            return 1;
    }
    return 0;
}

int verify_user_pass(char* password) {
    char* pass = "admin";
    for (int i = 0; i < 5; i++) {
        if (pass[i] != password[i])
            return 1;
    }
    return 0;
}

int main() {
    char username[256];
    char password[100];
    
    puts("********* ADMIN LOGIN PROMPT *********");
    printf("Enter Username: ");
    fgets(username, sizeof(username), stdin);
    int ret = verify_user_name(username);
    if (ret == 0) {
        printf("Enter Password: ");
        fgets(password, sizeof(password), stdin);
        ret = verify_user_pass(password);
    }
    puts("nope, incorrect username...\n");
    return 1;
}