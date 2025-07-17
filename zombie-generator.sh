#!/bin/bash
# Random number between 1 and 10
NUM=$((RANDOM % 10 + 1))
echo "Creating $NUM zombie processes"

for i in $(seq 1 $NUM); do
    # Create unique filename for each process
    BIN_FILE=$(mktemp /tmp/zombie_XXXXXX)
    
    # Compile and run C program in background
    gcc -x c -o "$BIN_FILE" - <<'EOF' && "$BIN_FILE" &
#include <unistd.h>
#include <stdlib.h>

int main() {
    pid_t pid = fork();
    if (pid == 0) {
        _exit(0);  // Child exits immediately → becomes zombie
    } else {
        sleep(600);  // Parent sleeps 10 minutes (doesn't call wait)
    }
    return 0;
}
EOF
done

echo "Check zombie processes using: ps aux | grep 'Z'"