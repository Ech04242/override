#include <stdio.h>
#include <string.h>

int main() {
    printf("-> Enter Login: ");
    char login[32];
    fgets(login, 32, stdin);
    login[strcspn(login, "\n")] = '\0';
    int length = strnlen(login, 32);
    if (length <= 5) {
        printf("Login too short !\n");
        return 1;
    }
    int checksum = (login[3] ^ 0x1337) + 6221293;
    for (int i = 0; i < length; ++i) {
        if (login[i] <= 31)
            return 1;
        checksum += (checksum ^ (unsigned int)login[i]) % 0x539;
    }
    printf("checksum : %d\n", checksum);
    return 0;
}