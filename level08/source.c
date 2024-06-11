#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

unsigned int log_wrapper(FILE *log_file, const char *message_prefix, const char *message_content) {
    char formatted_message[264];
    unsigned int canary_value;

    canary_value = __readfsqword(0x28u);
    strcpy(formatted_message, message_prefix);
    snprintf(&formatted_message[strlen(formatted_message)], 254 - strlen(formatted_message), "%s", message_content);
    formatted_message[strcspn(formatted_message, "\n")] = 0;
    fprintf(log_file, "LOG: %s\n", formatted_message);
    return __readfsqword(0x28u) ^ canary_value;
}

int main(int argc, const char **argv, const char **envp) {
    FILE *log_file;
    FILE *input_file;
    int backup_file_descriptor;
    char byte_buffer;
    char backup_file_path[104];
    unsigned int canary_value;

    canary_value = __readfsqword(0x28u);
    byte_buffer = -1;

    if (argc != 2)
        printf("Usage: %s filename\n", argv[0]);

    log_file = fopen("./backups/.log", "w");
    if (!log_file) {
        printf("ERROR: Failed to open %s\n", "./backups/.log");
        exit(1);
    }

    log_wrapper(log_file, "Starting back up: ", argv[1]);

    input_file = fopen(argv[1], "r");
    if (!input_file) {
        printf("ERROR: Failed to open %s\n", argv[1]);
        exit(1);
    }

    strcpy(backup_file_path, "./backups/");
    strncat(backup_file_path, argv[1], 99 - strlen(backup_file_path));

    backup_file_descriptor = open(backup_file_path, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    if (backup_file_descriptor < 0) {
        printf("ERROR: Failed to open %s\n", backup_file_path);
        exit(1);
    }

    while ((byte_buffer = fgetc(input_file)) != EOF)
        write(backup_file_descriptor, &byte_buffer, 1);

    log_wrapper(log_file, "Finished back up: ", argv[1]);

    fclose(input_file);
    close(backup_file_descriptor);
    fclose(log_file);

    if (canary_value != __readfsqword(0x28u))
        __stack_chk_fail();

    return 0;
}
