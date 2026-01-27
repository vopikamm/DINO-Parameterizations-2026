# DINO-Parameterizations-2026

Source code for the paper `Kamm, D., Perezhogin, P., Deshayes, J., Meunier, E., Barge, A. (2026). **An Assessment of Data-Driven Eddy-Parameterisations in an Atlantic Sector Model**. To be submitted to JAMES.

This repository along with respective data linked on zenodo (TODO DOI) can be used to reproduce all the model experiments performed in this study. The processed data along with a Jupyter notebook to reproduce all figures can be found in a separate zenodo archive (TODO DOI).

---- 
## Content

```bash
DINO-Parameterization-2026/
├── GZ2021/
│   ├── EXPREF/
│   ├── MY_SRC/
│   ├── cpp_DINO_GZ21.fcm
│   └── launch_EXP00.sh
├── KEB2020/
│   ├── EXPREF/
│   ├── MY_SRC/
│   ├── cpp_DINO_GZ21.fcm
│   └── launch_EXP00.sh
└── ZB2020/
    ├── EXPREF/
    ├── MY_SRC/
    ├── cpp_DINO_GZ21.fcm
    └── launch_EXP00.sh
```

The first level corresponds to the three tested parameterizations: [Guillaumin and Zanna (2021)](https://doi.org/10.1029/2021MS002534) (`GZ2021`), Kinetic Energy Backscatter implemented by [Perezhogin (2020)](https://doi.org/10.1515/rnam-2020-0006) (`KEB2020`), [Zanna and Bolton (2020)](https://doi.org/10.1029/2020GL088376) (`ZB2020`).

Each folder contains subfolders with the Fortran source files to be compiled with the [NEMO ocean model](https://www.nemo-ocean.eu/) (`MY_SRC`) and all other source files regarding the respective reference experiment (`EXPREF`).

`cpp_DINO*.fcm` contain the relevant keys needed for compilation of each experiment and `launch_EXP00.sh` are demonstrative slurm scripts to run each experiment (here for the [Jean Zay](http://www.idris.fr/eng/jean-zay/index.html) supercomputer).


 ----
## Installation

We will not go into the details of installing NEMO and its input/output-witer XIOS, but refer to their [documentation](https://sites.nemo-ocean.io/user-guide/install.html) and the installation guide of the [DINO configuration](https://github.com/vopikamm/DINO). It is **Important that you install NEMO v4.2.1**. All parameterization where only tested for this version. If you are new to NEMO, we suggest you first compile and run one of the test configurations, as described in the NEMO [installation guide](https://sites.nemo-ocean.io/user-guide/install.html).

### KEB2020 and ZB2020

For both equation-based parameterizations, the experiments can be directly compiled as any other NEMO test configuration. Just make sure to 

- copy the respective configuration into the test case folder of your NEMO installation, e.g. `~./nemo_4.2.1/tests/`
- add the respective configuration to the `demo_cfgs.txt` of your NEMO installation

After successful compiling `KEB2020` or `ZB2020`, you should find the `EXP00` folder containing the NEMO executable. 

### GZ2021

TODO 

## Run the experiment

TODO
 