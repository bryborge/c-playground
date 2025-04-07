# C Playground

This is a portable development environment for programming in C.

## ⚙️ Dependencies

-   And IDE that uses [Devcontainers](https://containers.dev/) ([VS Code](https://code.visualstudio.com/) works great for this)
-   [Docker](https://www.docker.com/)

## 🔧 Up and Running

These instructions assume you have the above dependencies installed, configured, and running.

1.  Open your IDE

2.  When your IDE asks you if you would like to run the project in a devcontainer, click "yes"

That's it!

## ♼ Compiling

You can compile your C code by running the command `make` (or `make all`) in the integrated terminal emulator at the
root of the project.

Example:

```sh
cd c-playground
make
```

You should see output like this:

```sh
mkdir -p build/obj
gcc -Wall -Wextra -Iinclude -c src/main.c -o build/obj/main.o
gcc  build/obj/main.o -o build/main
```

This means that the build succeeded and the compiled binary can be found in the `./build/main` directory of this
project.

To run the binary from the command line, run:

```sh
./build/main
```

Happy Hacking! 🧑‍💻 🇨

## ✅ Testing

TBD...

## 📚 Resources

-   [VS Code Documentation - Setting up Devcontainers](https://code.visualstudio.com/docs/devcontainers/containers)
-   ["Official" C Documentation (ISO Standard)](https://www.iso.org/standard/82075.html)
-   [Microsoft's C Documentation](https://learn.microsoft.com/en-us/cpp/c-language/?view=msvc-170)
