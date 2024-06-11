int main(int ac, char **av) {
    int i = 0;
    int value = atoi(av[1]);
    
    while (--i)
        if ((i << 2) == value)
            printf("found : %d\n", i); 
    return 0;
}