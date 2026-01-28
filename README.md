# DINO-Parameterizations-2026

Source code for the paper `Kamm, D., Perezhogin, P., Deshayes, J., Meunier, E., Barge, A. (2026). **An Assessment of Data-Driven Eddy-Parameterisations in an Atlantic Sector Model**. To be submitted to JAMES.

This repository, together with the respective data linked on Zenodo (TODO DOI), can be used to reproduce all the model experiments performed in this study. The processed data, as well as a Jupyter notebook to reproduce all figures can be found in a separate Zenodo archive (TODO DOI).

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

Each folder contains subfolders with the Fortran source files to be compiled with the [NEMO ocean model](https://www.nemo-ocean.eu/) (`MY_SRC`) as well as all other source files related to the respective reference experiment (`EXPREF`).

`cpp_DINO*.fcm` files contain the relevant keys needed for the compilation of each experiment and `launch_EXP00.sh` files are demonstrative slurm scripts to run each experiment (included here for the [Jean Zay](http://www.idris.fr/eng/jean-zay/index.html) supercomputer).


 ----
## Installation

We will not go into the details of installing NEMO and its input/output-witer XIOS, but refer to their [documentation](https://sites.nemo-ocean.io/user-guide/install.html) and the installation guide of the [DINO configuration](https://github.com/vopikamm/DINO). It is **important that you install NEMO version 4.2.1**. All parameterization were only tested for this version. If you are new to NEMO, we suggest you first compile and run one of the test configurations, as described in the NEMO [installation guide](https://sites.nemo-ocean.io/user-guide/install.html).

### KEB2020 and ZB2020

For both equation-based parameterizations, the experiments can be directly compiled like any other NEMO test configuration. Just make sure to 

- copy the respective configuration into the test case folder of your NEMO installation, e.g. `~./nemo_4.2.1/tests/`
- add the respective configuration to the `demo_cfgs.txt` file of your NEMO installation

After successful compiling `KEB2020` or `ZB2020`, you should find the `EXP00` folder containing the NEMO executable. 

### GZ2021

The neural-network-based parameterization runs Python processes in parallel to the NEMO core running on Fortran processes, using the [EOPHIS framework](https://eophis.readthedocs.io/en/latest/). For a tutorial on how to install the required dependencies alongside NEMO, we refer to [their documentation](https://morays-doc.readthedocs.io/en/latest/nemo.getting_started.html).

To build a configuration reproducing the demonstrated experiments, make sure to replace the ML-model (`trained_model.pth`), Python, and Fortran sources in the tutorial with the ones found in this repository.

----

## Run the experiment

Each experiment folder contains a slurm script (`launch_EXP00.sh`) to run the compiled reference experiment. The `namelist_cfg` defines a run of the first year of the respective experiment, as performed in the study. The slurm scripts (`launch_EXP00.sh`) and the associated process allocation files (`mpmd.conf`) are prototypical, and have been configured for reasonable parallelization on the ressources that where available to us on the [Jean Zay](http://www.idris.fr/eng/jean-zay/index.html) supercomputer. They might differ on other machines.

**Note:** the GZ2021 experiments were conducted using a hybrid CPU-GPU approach. If hybrid CPU-GPU nodes are not available, the experiments can be run on CPU only, at the cost of reduced computational performance.
 