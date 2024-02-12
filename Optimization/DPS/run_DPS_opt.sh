#!/bin/bash
#SBATCH -D /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS
#SBATCH -e /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS/output/error.%j.out
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=2
#SBATCH --exclusive
#SBATCH --cpus-per-task=10
#SBATCH --partition=sla-prio           															# Queue name "parallel"
#SBATCH --account=azh5924_b  														        		# allocation name
#SBATCH --time=00:05:00       											 				      	# Run time (hh:mm:ss) - up to 36 hours
#SBATCH --mail-user=aas6791@psu.edu             				 						# address for email notification
#SBATCH --mail-type=ALL                  									    			# email at Begin and End of job

module load boost/1.81.1
module load openmpi/4.1.1-pmi2

srun LakeDPSparallel 1 100


# Run LakeDPSparallel inside loop
#for i in {1..50}
#do
#  srun ./LakeDPSparallel 1 100
#done

# -N3 -n20 -exclusive
