#!/bin/bash
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=60gb
#SBATCH --time=12:00:00
#SBATCH --job-name=Classification
#SBATCH --error=Outputs/%j.err_
#SBATCH --output=Outputs/%J.out_
#SBATCH -p tesla
#SBATCH -q tesla
#SBATCH -A kdm-grant594
#SBATCH --gres=gpu:tesla:1

apptainer exec --nv tensorflow_latest-gpu.sif pip3 install -q kaggle --user
apptainer exec --nv tensorflow_latest-gpu.sif pip3 install -q matplotlib seaborn scikit-learn imbalanced-learn --user

apptainer exec --nv tensorflow_latest-gpu.sif python3 ./NIDS_CICIDS18_without_smote.py
