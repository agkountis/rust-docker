FROM rust:latest
LABEL maintainer="Angelos Gkountis <angelos.gkountis@gmail.com>"

RUN apt update && apt install -y \
    cmake \
    build-essential

# compile/install flatbuffers
RUN git clone https://github.com/google/flatbuffers.git && cmake -B flatbuffers -S flatbuffers -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
WORKDIR "flatbuffers"
RUN make -j4 && chmod +x flatc && cp flatc /usr/local/bin/flatc

# Cleanup flatbuffers
WORKDIR "/"
RUN rm -rf flatbuffers
