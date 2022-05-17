# GFDL FMS Build

## Installation

```
    git clone --recursive https://github.com/iitm-esm/gfdl-fms.git
    cd gfdl-fms
    ./build.sh
```
This builds the FMS library inside `build/{COMPILER}/{COMPILER_VERSION}/` within the `gfdl-fms` directory.
`COMPILER` and `COMPILER_VERSION` can be changed in `build.sh`.

Currently build is only configured for `Intel` compilers in `Pratyush HPC`.
`COMPILER_VERSION` available for `Intel` compiler in `Pratyush HPC` are: `16.0` and `19.0`

By default, `./build.sh` will build for `Intel version 16.0`.
