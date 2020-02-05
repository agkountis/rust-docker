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

# compile/install flatbuffers
RUN git clone https://github.com/google/flatbuffers.git && cmake -B flatbuffers -S flatbuffers -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
WORKDIR "flatbuffers"
RUN make -j4 && chmod +x flatc && cp flatc /usr/local/bin/flatc

# Cleanup flatbuffers
WORKDIR "/"
RUN rm -rf flatbuffers

# Add rust mingw targets
RUN rustup target add x86_64-pc-windows-gnu
RUN rustup target add i686-pc-windows-gnu

# Add cargo configuration for mingw targets
RUN mkdir /root/.cargo
ADD config /root/.cargo
