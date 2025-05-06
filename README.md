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

[CMake](https://cmake.org/) is the build system used in this project.

1.  Run CMake at the root of the project.

    ```sh
    cmake .
    ```

2.  This should have created a `Makefile`. Run the `make` command to compile the project binaries.

    ```sh
    make
    ```

3.  You should now have a compiled binary that can be run.

    ```sh
    ./bin/hello
    > Hello, World!
    ```

Happy Hacking! 🧑‍💻 🇨

## ✅ Testing

This project uses [CUnit](https://cunit.sourceforge.net/) to run unit tests, and it is configured to work in the
devcontainer after successfully compiling.

```sh
./bin/tests
```

## 📚 Resources

-   [VS Code Documentation - Setting up Devcontainers](https://code.visualstudio.com/docs/devcontainers/containers)
-   ["Official" C Documentation (ISO Standard)](https://www.iso.org/standard/82075.html)
-   [Microsoft's C Documentation](https://learn.microsoft.com/en-us/cpp/c-language/?view=msvc-170)
-   [CMake Documentation](https://cmake.org/documentation/)
-   [GNU Make Documentation](https://www.gnu.org/software/make/)
-   [CUnit Documentation](https://cunit.sourceforge.net/doc/index.html)
