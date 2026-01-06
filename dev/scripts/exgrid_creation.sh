#!/bin/bash
set -x

python ${USHeagle}/grid_creation.py
export err=$?; #err_chk

if [[ ${err} -ne 0 ]]; then
    echo "Aborted job with err=${err}"
    exit ${err}
fi

# Copy output to COMOUTeagl
cp ${DATA}/global_one_degree.nc ${COMOUTeagle}
cp ${DATA}/hrrr_15km.nc ${COMOUTeagle}
cp ${DATA}/latentx2.spongex1.combined.sorted.npz ${COMOUTeagle}

exit



