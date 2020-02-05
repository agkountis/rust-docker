FROM rust:latest
LABEL maintainer="Angelos Gkountis <angelos.gkountis@gmail.com>"

# Add 32bit architecture
RUN dpkg --add-architecture i386
RUN apt update && apt install -y \
    cmake \
    build-essential \
    mingw-w64 \
    wine64 \
    wine32

# Add rust mingw targets
RUN rustup target add x86_64-pc-windows-gnu
RUN rustup target add i686-pc-windows-gnu

# Add cargo configuration for mingw targets
RUN mkdir /root/.cargo
ADD config /root/.cargo
