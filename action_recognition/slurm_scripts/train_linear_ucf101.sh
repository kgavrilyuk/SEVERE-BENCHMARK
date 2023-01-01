#!/bin/bash
#SBATCH --job-name=TRAIN
#SBATCH --output=/mnt/rnd/kirill/last_slurm_outputs/train_mult_ucf101_%A.txt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=2080,V100
#SBATCH --gres=gpu:4

export PATH=/mnt/rnd/kirill/anaconda3/bin:$PATH
conda init bash
conda activate severe_env1

#python ../linear_eval.py ../configs/benchmark/ucf/112x112x32-fold1-linear.yaml   --pretext-model-name supervised --pretext-model-path ../../checkpoints_pretraining/fully_supervised_kinetics/r2plus1d_18-91a641e6.pth --finetune-ckpt-path ./checkpoints/fully_supervised_kinetics/
#python ../linear_eval.py ../configs/benchmark/ucf/112x112x32-fold1-linear.yaml   --pretext-model-name  video_moco --pretext-model-path ../../checkpoints_pretraining/video_moco/r2plus1D_checkpoint_0199.pth.tar --finetune-ckpt-path ../checkpoints/video_moco/ 
#python ../linear_eval.py ../configs/benchmark/ucf/112x112x32-fold1-linear.yaml   --pretext-model-name  selavi --pretext-model-path ../../checkpoints_pretraining/selavi/selavi_kinetics.pth --finetune-ckpt-path ../checkpoints/selavi/
python ../linear_eval.py ../configs/benchmark/ucf/112x112x32-fold1-linear.yaml   --pretext-model-name  gdt --pretext-model-path ../../checkpoints_pretraining/gdt/gdt_K400.pth --finetune-ckpt-path ../checkpoints/gdt/
