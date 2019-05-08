#!/bin/bash
#SBATCH -J D_pmar=0.054_dist=100_repair_6_males=12_nmar=11
#SBATCH --time=07:00:00
#SBATCH -p broadwl
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

module load Anaconda3/5.1.0
python3 bowerbird_prog.py ../to_store/D_pmar=0.054_dist=100_repair_6_males=12_nmar=11/parameters/in_00D_pmar=0.054_dist=100_repair_6_males=12_nmar=11
mv res_00D_pmar=0.054_dist=100_repair_6_males=12_nmar=11.csv ../to_store/D_pmar=0.054_dist=100_repair_6_males=12_nmar=11/results/res_00D_pmar=0.054_dist=100_repair_6_males=12_nmar=11.csv
python3 bowerbird_prog.py ../to_store/D_pmar=0.054_dist=100_repair_6_males=12_nmar=11/parameters/in_01D_pmar=0.054_dist=100_repair_6_males=12_nmar=11
mv res_01D_pmar=0.054_dist=100_repair_6_males=12_nmar=11.csv ../to_store/D_pmar=0.054_dist=100_repair_6_males=12_nmar=11/results/res_01D_pmar=0.054_dist=100_repair_6_males=12_nmar=11.csv
