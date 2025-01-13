#!/bin/bash

NCORE=8
dwi=`jq -r '.dwi' config.json`
bvals=`jq -r '.bvals' config.json`
bvecs=`jq -r '.bvecs' config.json`
target_bval=`jq -r '.bval' config.json`
FOLDER="nodif"


mkdir -p ${FOLDER}

# separate b0s from sos and sense data
dwiextract ${dwi} -shell ${target_bval} -fslgrad ${bvecs} ${bvals} ./${FOLDER}/dwi.nii.gz -export_grad_fsl ./${FOLDER}/dwi.bvecs ./${FOLDER}/dwi.bvals -nthreads $NCORE -force
