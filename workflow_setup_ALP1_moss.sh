#!/bin/bash

# remember to copy the inputdata to the correct place

cd ~/ctsm/cime/scripts

./create_newcase --case ../../../ctsm_cases/ALP1_moss --compset 2000_DATM%1PTGSWP3_CLM50%FATES_SICE_SOCN_MOSART_SGLC_SWAV --res 1x1_ALP1 --machine saga --run-unsupported --project nn2806k

# Build the case
cd ~/ctsm_cases/ALP1_moss

./xmlchange --file env_run.xml --id STOP_OPTION --val nyears               
./xmlchange --file env_run.xml --id STOP_N --val 1                        
./xmlchange --file env_run.xml --id DOUT_S --val FALSE 
./xmlchange --file env_run.xml --id DATM_CLMNCEP_YR_START --val 2000
./xmlchange --file env_run.xml --id DATM_CLMNCEP_YR_END --val 2010   

./case.setup
./case.build


# remember to copy "user_nl_clm" to the case folder you create

# Change the following namelist parameters to the correct ones
 fsurdat = "${YOUR_WORKING_FOLDER}/inputdata/lnd/clm2/surfdata_map/ALP1/surfdata_ALP1_simyr2000_moss.nc"         
 fates_paramfile = "${YOUR_WORKING_FOLDER}/inputdata/lnd/clm2/paramdata/fates_params_moss_only.nc"              # "fates_params_moss_only.nc" should be used to reproduce the problem. 

# Run the model
./case.submit
