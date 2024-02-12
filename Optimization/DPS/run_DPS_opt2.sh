#!/bin/bash
#SBATCH -D /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS
#SBATCH -e /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS/output/error.%j.out
#SBATCH -o /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS/output/output.%j.out
#SBATCH --nodes=2       											 					        # Number of nodes to use
#SBATCH --exclusive       											 					      # Exclusive use of those nodes
#SBATCH --ntasks-per-node=20       											 				# Number of tasks each node can perform
#SBATCH --ntasks=40       											 					      # 3*20=60
#SBATCH --mem-per-cpu=10gb       											 					# Memory per cpu. specified if changing from preset
#SBATCH --partition=sla-prio           													# Queue name "parallel"
#SBATCH --account=azh5924_b  																    # Allocation name
#SBATCH --time=00:05:00       											 					  # Run time (hh:mm:ss) 
#SBATCH --mail-user=aas6791@psu.edu             								# Address for email notification
#SBATCH --mail-type=ALL                  												# Email at Begin and End of job

module load boost/1.81.1
module load openmpi/4.1.1-pmi2

# Your commands go here
mpirun --mca btl tcp,self -n 2 ./LakeDPSparallel 1 100

# arguments are <seed> <NFE>
#for i in {1..50}
#do
 # mpirun --mca btl tcp,self -n 3 ./LakeDPSparallel $i 200000
#done
