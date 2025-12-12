#!/bin/bash
set -x

# Copy input to DATA
cp ${COMINeagle}/hrrr_15km.nc ${DATA}
cp ${COMINeagle}/latentx2.spongex1.combined.sorted.npz ${DATA}

# Copy config file to DATA
cp ${PARMeagle}/hrrr.yaml ${DATA}

srun --nodes ${SLURM_JOB_NUM_NODES} --ntasks ${SLURM_NTASKS} ufs2arco hrrr.yaml --overwrite
export err=$?; #err_chk

if [[ ${err} -ne 0 ]]; then
    echo "Aborted job with err=${err}"
    exit ${err}
fi

# Copy output to COMOUTeagle
cp ${DATA}/conservative_1059x1799_211x359.nc ${COMOUTeagle}
cp -r ${DATA}/hrrr.zarr ${COMOUTeagle}

exit
