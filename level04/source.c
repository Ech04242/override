#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/ptrace.h>
#include <sys/user.h>
#include <unistd.h>
#include <signal.h>
#include <sys/prctl.h>

void prog_timeout(int a1) {
	exit(1);
}

unsigned int enable_timeout_cons() {
	signal(SIGALRM, (__sighandler_t)prog_timeout);
	return alarm(60);
}

int main(int argc, const char **argv, const char **envp) {
	pid_t childPid;
	char userInput[32];
	int status;
	int childStatus;

	childPid = fork();
	memset(userInput, 0, sizeof(userInput));
	status = 0;

	if (childPid) {
		while (1) {
			wait(&status);
			childStatus = status;
			if (WIFEXITED(childStatus) || WIFSIGNALED(childStatus)) {
				puts("child is exiting...");
				return 0;
			}
			if (ptrace(PTRACE_PEEKUSER, childPid, 44, 0) == 11) {
				puts("no exec() for you");
				kill(childPid, SIGKILL);
				break;
			}
		}
	} else {
		prctl(PR_SET_PDEATHSIG, 1);
		ptrace(PTRACE_TRACEME, 0, 0, 0);
		puts("Give me some shellcode, k");
		gets(userInput);
	}
	return 0;
}
