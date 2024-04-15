int main(void)
{
    int password;

    printf("Password: ");
    scanf("%d", &password);
    if (password != 5276)
        printf("\nInvalid Password!\n");
    else {
        printf("\nAuthenticated!\n");
        system("/bin/sh");
    }
    return (password != 5276);
}