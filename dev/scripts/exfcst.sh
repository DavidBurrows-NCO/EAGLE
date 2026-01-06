#!/bin/bash
set -x

# Copy config file to DATA
cp ${PARMeagle}/inference.yaml ${DATA}
cp ${COMINeagle}/inference-last.ckpt ${DATA}
cp -r ${COMINeagle}/gfs.zarr ${DATA}
cp -r ${COMINeagle}/hrrr.zarr ${DATA}

eagle-tools inference inference.yaml
export err=$?; #err_chk

if [[ ${err} -ne 0 ]]; then
    echo "Aborted job with err=${err}"
    exit ${err}
fi

# Copy output to COMOUTeagle
#cp ${DATA}/conservative_719x1440_180x360.nc ${COMOUTeagle}
#cp -r ${DATA}/gfs.zarr ${COMOUTeagle}

exit
