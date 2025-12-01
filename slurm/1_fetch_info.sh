#!/bin/bash

cluster_name=$(awk -F '=' '/ClusterName/{print $2}' /etc/slurm/slurm.conf | head -1)
found_cluster="yes"
if [ -z "${cluster_name}" ]; then
    found_cluster="no"
fi

# Get all partition names and store them in an array
readarray -t partition_names < <(awk -F '=' '/PartitionName/{split($2,a," "); print a[1]}' /etc/slurm/slurm.conf)

echo "found_cluster=${found_cluster},cluster_name=${cluster_name},partitions=${partition_names[*]}"