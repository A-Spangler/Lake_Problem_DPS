#!/bin/bash
#SBATCH -D /scratch/aas6791/Lake_Problem_DPS/Optimization/Intertemporal
#SBATCH -e /scratch/aas6791/Lake_Problem_DPS/Optimization/Intertemporal/output/error.%j.out
#SBATCH -o /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/Intertemporal/output/output.%j.out
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=20
#SBATCH --ntasks40
#SBATCH --exclusive
#SBATCH --mem-per-cpu=10gb
#SBATCH --partition=sla-prio           															# Queue name "parallel"
#SBATCH --account=azh5924_b  														        		# allocation name
#SBATCH --time=02:00:00       											 				      	# Run time (hh:mm:ss) - up to 36 hours
#SBATCH --mail-user=aas6791@psu.edu             				 						# address for email notification   

module load boost/1.81.1
module load openmpi/4.1.1-pmi2

# Your commands go here
# arguments are <seed> <NFE>
for i in {1..50}
do
  srun ./LakeITparallel $i 200000
done

 
