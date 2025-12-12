#!/bin/bash
set -x

# Copy input to DATA
cp ${COMINeagle}/global_one_degree.nc ${DATA}
cp ${COMINeagle}/latentx2.spongex1.combined.sorted.npz ${DATA}

# Copy config file to DATA
cp ${PARMeagle}/gfs.yaml ${DATA}

srun --nodes ${SLURM_JOB_NUM_NODES} --ntasks ${SLURM_NTASKS} ufs2arco gfs.yaml --overwrite
export err=$?; #err_chk

if [[ ${err} -ne 0 ]]; then
    echo "Aborted job with err=${err}"
    exit ${err}
fi

# Copy output to COMOUTeagle
cp ${DATA}/conservative_719x1440_180x360.nc ${COMOUTeagle}
cp -r ${DATA}/gfs.zarr ${COMOUTeagle}

exit
