#!/bin/bash

found_cluster="<%=results.fetch_slurm_info.hostname%>" 
cluster_name="<%=results.fetch_slurm_info.cluster_name%>"
partition_names="<%=results.fetch_slurm_info.partitions%>"
has_errors="<%=results.fetch_slurm_info.has_errors%>"

echo "Cluster: $cluster_name"
echo "Partitions: $partition_names"