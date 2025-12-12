#!/bin/bash
set -x

# Copy input to DATA
cp -r ${COMINeagle}/gfs.zarr ${DATA}
cp -r ${COMINeagle}/hrrr.zarr ${DATA}
cp ${COMINeagle}/latentx2.spongex1.combined.sorted.npz ${DATA}
cp -r /scratch3/NCEPDEV/nems/David.Burrows/work_gEAGLE/full_workflow_run/eagle/nested_eagle/ursa/scientific_workflow/training/training ${DATA}
cp -r /scratch3/NCEPDEV/nems/David.Burrows/work_gEAGLE/full_workflow_run/eagle/nested_eagle/ursa/scientific_workflow/training/data ${DATA}
cp -r /scratch3/NCEPDEV/nems/David.Burrows/work_gEAGLE/full_workflow_run/eagle/nested_eagle/ursa/scientific_workflow/training/dataloader ${DATA}
cp -r /scratch3/NCEPDEV/nems/David.Burrows/work_gEAGLE/full_workflow_run/eagle/nested_eagle/ursa/scientific_workflow/training/datamodule ${DATA}
cp -r /scratch3/NCEPDEV/nems/David.Burrows/work_gEAGLE/full_workflow_run/eagle/nested_eagle/ursa/scientific_workflow/training/diagnostics ${DATA}
cp -r /scratch3/NCEPDEV/nems/David.Burrows/work_gEAGLE/full_workflow_run/eagle/nested_eagle/ursa/scientific_workflow/training/graph ${DATA}
cp -r /scratch3/NCEPDEV/nems/David.Burrows/work_gEAGLE/full_workflow_run/eagle/nested_eagle/ursa/scientific_workflow/training/hardware ${DATA}
cp -r /scratch3/NCEPDEV/nems/David.Burrows/work_gEAGLE/full_workflow_run/eagle/nested_eagle/ursa/scientific_workflow/training/graph ${DATA}

# Copy config file to DATA
cp ${PARMeagle}/training.yaml ${DATA}

#srun --nodes ${SLURM_JOB_NUM_NODES} --ntasks ${SLURM_NTASKS} ufs2arco gfs.yaml --overwrite
anemoi-training train --config-name=training
export err=$?; #err_chk

if [[ ${err} -ne 0 ]]; then
    echo "Aborted job with err=${err}"
    exit ${err}
fi

# Copy output to COMOUTeagle
#cp ${DATA}/conservative_719x1440_180x360.nc ${COMOUTeagle}
#cp -r ${DATA}/gfs.zarr ${COMOUTeagle}

exit
