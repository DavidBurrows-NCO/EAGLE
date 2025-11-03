#!/bin/bash

#SBATCH -J nested_eagle_verification 
#SBATCH -o slurm/verification.%j.out
#SBATCH -e slurm/verification.%j.err
#SBATCH --account=epic
#SBATCH --partition=u1-service
#SBATCH --mem=128g
#SBATCH -t 01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1

source /scratch4/NAGAPE/epic/role-epic/miniconda/bin/activate

export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH

conda activate wxvx 

wxvx -c wxvx_lam.yaml -t plots
