#!/bin/bash
#SBATCH -J D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3
#SBATCH --time=07:00:00
#SBATCH -p broadwl
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

module load Anaconda3/5.1.0
python3 bowerbird_prog.py ../to_store/D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3/parameters/in_00D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3
mv res_00D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3.csv ../to_store/D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3/results/res_00D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3.csv
python3 bowerbird_prog.py ../to_store/D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3/parameters/in_01D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3
mv res_01D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3.csv ../to_store/D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3/results/res_01D_pmar=0.054_dist=1000_repair_6_males=8_nmar=3.csv
