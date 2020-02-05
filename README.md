# Rust Docker

This repository contains Debian based Rust images to use for CI/CD and more.

# Flavors
All images are built on top of the official ```rust:latest``` image. 

The images were created primarily to cover cross compilation needs on CI/CD pipelines. 

- Images tagged with ```mingw``` can cross compile for ```i686-pc-windows-gnu``` and ```x86_64-pc-windows-gnu``` Rust targets.
- Images tagged with ```flatc``` contain the [flatbuffers](https://github.com/google/flatbuffers) ```flatc``` compiler and can compile ```.fbs``` files.

