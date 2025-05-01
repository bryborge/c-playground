FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install development packages
RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    cmake \
    valgrind \
    clang \
    clang-format \
    clang-tidy \
    clangd \
    libcunit1 \
    libcunit1-doc \
    libcunit1-dev \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Conan package manager
RUN pip3 install --no-cache-dir conan

# Set default compiler to clang
ENV CC=/usr/bin/clang
