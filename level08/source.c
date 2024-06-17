#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

unsigned int log_wrapper(FILE *log_file, const char *msg, const char *file) {
    char buf[255];

    strcpy(buf, msg);
    snprintf(&buf[strlen(buf)], 254 - strlen(buf), file);
    buf[strcspn(buf, "\n")] = 0;
    fprintf(log_file, "LOG: %s\n", buf);
}

int main(int argc, const char **argv, const char **envp) {
    FILE *log_file;
    FILE *input_file;
    int new_fd;
    char byte_buffer = -1;
    char new_file_path[104];
    unsigned int canary_value;

    canary_value = __readfsqword(0x28u);

    if (argc != 2)
        printf("Usage: %s filename\n", argv[0]);

    if (!(log_file = fopen("./backups/.log", "w"))) {
        printf("ERROR: Failed to open %s\n", "./backups/.log");
        exit(1);
    }

    log_wrapper(log_file, "Starting back up: ", argv[1]);

    if (!(input_file = fopen(argv[1], "r"))) {
        printf("ERROR: Failed to open %s\n", argv[1]);
        exit(1);
    }

    strcpy(new_file_path, "./backups/");
    strncat(new_file_path, argv[1], 99 - strlen(new_file_path));

    new_fd = open(new_file_path, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    if (new_fd < 0) {
        printf("ERROR: Failed to open ./backups/%s\n", new_file_path);
        exit(1);
    }

    while ((byte_buffer = fgetc(input_file)) != EOF)
        write(new_fd, &byte_buffer, 1);

    log_wrapper(log_file, "Finished back up: ", argv[1]);

    fclose(input_file);
    close(new_fd);

    if (canary_value == __readfsqword(0x28u))
        return 0;
    
    __stack_chk_fail();
}
