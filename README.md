# fates-sp_initialization_issue

## logs folder

- cesm.log.2130868.210224-142049  
  - Search for "treelai", where you will find that "treelai = ****". treelai and treesai are not initialized with the prescribed values which are 2.0 and 0.5, respectively
  - You will see at the bottom of the file the error message: "ERROR in BalanceCheckMod.F90 at line 654"

- cesm.log.2139088.210224-171910
  - The same as above, but in this simulation the following code has been added. The error still exists. 
    - see https://github.com/huitang-earth/fates/commit/e4716ec7132cbf73728a07085de65da885d06345# line 1536-1538 

- cesm.log.2139491.210224-174705.gz
  - The same as above, but in this simulation the following codes have been added. The error is gone.
    - see https://github.com/huitang-earth/ctsm/commit/28df6f7367ac7c38e25bde6c0655515b8ddeb397
    - see https://github.com/huitang-earth/ctsm/commit/913910fe569a1a3c42227cedb032b8d79d6da1f3 line 1024-1040

## ALP1_moss folder
- The case directory that produce the above log files.
- You can use the case directory to reproduce the errors, but you have to change the configuration for your machine. 

## Model code    
- CTSM: https://github.com/huitang-earth/ctsm/tree/MossLichen
- FATES: https://github.com/huitang-earth/fates/tree/MossLichen_sci.1.43.2_api.14.2.0
- Note that I found this problem when I was developing moss and lichen module. You might have to use the above mentioned code to reproduce the exact problem.
