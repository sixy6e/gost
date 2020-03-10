#!/bin/bash
#PBS -P v10
#PBS -W umask=017
#PBS -q express
#PBS -l walltime=00:05:00,mem=4GB,ncpus=1
#PBS -l wd
#PBS -l storage=scratch/da82+gdata/da82+scratch/v10+gdata/v10+scratch/xu18+gdata/xu18

module use /g/data/v10/private/modules/modulefiles
module use /g/data/v10/public/modules/modulefiles
module load wagl/5.4.1

python merge.py --pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/c2-raijin-gadi-nbar-comparison.h5 --out-pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/merge-general-results-c2.geojsonl --framing WRS2 --dataset-name GENERAL-RESULTS
python merge.py --pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/c2-raijin-gadi-nbar-comparison.h5 --out-pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/merge-fmask-results-c2.geojsonl --framing WRS2 --dataset-name FMASK-RESULTS
python merge.py --pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/c2-raijin-gadi-nbar-comparison.h5 --out-pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/merge-contiguity-results-c2.geojsonl --framing WRS2 --dataset-name CONTIGUITY-RESULTS
python merge.py --pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/c2-raijin-gadi-nbar-comparison.h5 --out-pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/merge-shadow-results-c2.geojsonl --framing WRS2 --dataset-name SHADOW-RESULTS

python summarise.py --pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/merge-general-results-c2.geojsonl --out-pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/summary-general-results-c2.csv
python summarise.py --pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/merge-fmask-results-c2.geojsonl --out-pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/summary-fmask-results-c2.csv --categorical
python summarise.py --pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/merge-contiguity-results-c2.geojsonl --out-pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/summary-contiguity-results-c2.csv --categorical
python summarise.py --pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/merge-shadow-results-c2.geojsonl --out-pathname /g/data/v10/testing_ground/jps547/gadi-test/C2/diff-results-test/summary-shadow-results-c2.csv --categorical
