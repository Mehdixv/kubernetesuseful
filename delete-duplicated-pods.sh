#!/bin/bash
# Define the namespace
NAMESPACE="YourNameSpace"

# ---- Delete Duplicated Pods ----
echo "Deleting Duplicated Pods..."

# Find and delete duplicated pods
kubectl get pods -n $NAMESPACE -o custom-columns=NAME:.metadata.name,STATUS:.status.phase --no-headers | \
awk '{print $1}' | sort | uniq -d | while read -r POD; do
    kubectl delete pod "$POD" -n $NAMESPACE
done


echo "Cleanup completed."

