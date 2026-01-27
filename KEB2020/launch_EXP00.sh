#!/usr/bin/env bash
#SBATCH --job-name=KEB2020
#SBATCH --hint=nomultithread       # 1 MPI process per physical core (no hyperthreading)
#SBATCH --time=2:00:00
#SBATCH --output=KEB2020.out
#SBATCH --ntasks-per-node=40
#SBATCH --nodes=15
######################


cd ./EXP00

pwd; hostname; date

module purge # purge modules inherited by default

# loading necessary modules
intel_version=19.0.4
module load intel-compilers/${intel_version}
module load intel-mpi/${intel_version}
module load hdf5/1.10.5-mpi
module load netcdf/4.7.2-mpi
module load netcdf-fortran/4.5.2-mpi

source $I_MPI_ROOT/intel64/bin/mpivars.sh release_mt

time srun  --multi-prog ./mpmd.conf

date

