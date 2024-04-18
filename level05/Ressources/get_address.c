#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("value env = %p\n", getenv("exploit"));
}