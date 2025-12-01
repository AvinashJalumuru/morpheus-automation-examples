#!/bin/bash

echo "1. Fetch cluster information"

cluster_name=$(awk -F '=' '/ClusterName/{print $2}' /etc/slurm/slurm.conf | head -1)

if [ -z "${cluster_name}" ]; then
    echo "ERROR: Cannot find cluster name in the slurm configuration"
    exit 1
fi

echo "2. Cluster Name: ${cluster_name}"

# Get all partition names and store them in an array
readarray -t partition_names < <(awk -F '=' '/PartitionName/{split($2,a," "); print a[1]}' /etc/slurm/slurm.conf)

echo "3. List of Partitions: ${partition_names[*]}"