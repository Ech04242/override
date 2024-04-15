int main(void)
{
    int ret;
    int password;

    printf("Password: ");
    scanf("%d", &password);
    if (password != 5276){
        printf("\nInvalid Password!\n");
        ret = 0;
    }
    else {
        printf("\nAuthenticated!\n");
        system("/bin/sh");
        ret = 1;
    }
    return (ret);
}