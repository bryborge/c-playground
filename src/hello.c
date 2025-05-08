#include <stdio.h>
#include "../include/hello.h"

int get_hello_result(void) {
    char greeting[] = "Hello, World!";

    printf("%s\n", greeting);
    return 0;
}
