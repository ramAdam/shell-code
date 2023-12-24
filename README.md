# Shell Code

This repository contains shell code examples and scripts for various purposes.

## How to Run

To run the shell code examples and scripts in this repository, follow these steps:

1. Clone the repository to your local machine.
2. Open a terminal and navigate to the repository directory.
3. Make sure you have the necessary permissions to execute shell scripts.
4. Build the `setreuid` script using the makefile. For example, run the following command:

    ```bash
    make setreuid
    ```

5. Run the `setreuid` script with `sudo`. For example, use the following command:

    ```bash
    sudo ./setreuid
    ```

6. Follow any additional instructions provided in the script's documentation.

Please note that some scripts may require specific dependencies or configurations. Make sure to read the documentation and requirements for each script before running it.

## Contents

# setreuid.asm

This assembly program demonstrates the use of the `setreuid` and `execve` system calls.

The program starts by setting up the registers for the `setreuid` system call. It sets the real and effective user IDs to 0, which corresponds to the root user. This is done using the `xor` instruction to clear the `rdi` and `rsi` registers.

The `syscall` instruction is then used to make the `setreuid` system call. If the system call fails (i.e., if it returns -1), the program jumps to the `fail` label. Here, it sets up the registers for the `write` system call to print an error message to stdout, then jumps to the `exit` label to terminate the program.

If the `setreuid` system call succeeds, the program jumps to the `success` label. Here, it sets up the registers for the `execve` system call to execute `/bin/sh`, effectively spawning a shell with root privileges.

This program is intended for educational purposes to demonstrate how system calls can be made from assembly. Note that running programs with root privileges can be a security risk and should be done with caution.

Feel free to explore the repository and use the shell code examples and scripts as needed.
