# clingo-vs-telingo-planning

## Introduction

This repository encompasses the data discussed in the conference paper "*telingo* = ASP + time" (submitted for the [*15th International Conference on Logic Programming and Non-monotonic Reasoning*](https://sites.sju.edu/plw/lpnmr-2019/)) as well as the tools to replicate that data.

A link to the paper will be provided as soon as it is published.

## Replicating the data

In order to get started make sure you have installed clingo 5.3 and telingo 1.0 on a cluster of your choice (we ran the benchmarks on a cluster with Linux, Intel Xeon E5-2650v4 processors with 2.20GHz and 64 GB memory), e.g. by executing:

```shell
conda install -c potassco clingo
conda install -c potassco telingo
```

Upload the folder `benchmark-tool` to the cluster. It contains all necessary test files and configurations to run both the clingo and telingo benchmarks. You do not need to change anything.
The test instances are located in the folders `benchmark-tool/benchmarks/clingo/` and `benchmark-tool/benchmarks/telingo/` respectively.
The configuration files can be found in the folder `benchmark-tool/runscripts/`.

### Running benchmarks

To run the clingo benchmark change to the previously uploaded folder `benchmark-tool` and execute the following commands:
```shell
./bgen runscripts/runscript-cvst-clingo.xml
```
This creates a shell script that will automatically run clingo with each of the test instances once the benchmark is started.

To start the benchmark run:

```shell
./output-clingo/clingo-bmarks/zuse/start.sh
``` 

To set up and run the telingo benchmark:
```shell
./bgen runscripts/runscript-cvst-telingo.xml
./output-telingo/telingo-bmarks/zuse/start.sh
```

For more information about the used benchmark tool check out the corresponding [repository](https://github.com/potassco/benchmark-tool).

## Collecting the data

Once a benchmark has finished download the folder

```shell
benchmark-tool/output-clingo/clingo-bmarks/zuse/results/ALL/clingo-pmork-Base/
```

or

```shell
benchmark-tool/output-telingo/telingo-bmarks/zuse/results/ALL/telingo-pmork-Base/
```

respectively from the cluster. These contain the command line output of each test. The provided Python script `create-csv.py` (Python v2.7) extracts these informations and generates a csv file:

```shell
python create-csv.py ./clingo-pmork-Base/
```

or

```shell
python create-csv.py ./telingo-pmork-Base/
```