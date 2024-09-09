#!/bin/bash
# Define the namespace
NAMESPACE="YourNameSpace"

# ---- Delete Evicted Pods ----
echo "Deleting Evicted Pods..."

# Using a script approach to handle the deletion one by one
kubectl get pods -n $NAMESPACE --field-selector status.phase=Failed -o jsonpath="{.items[?(@.status.reason=='Evicted')].metadata.name}" | \
tr ' ' '\n' | sort | uniq | while read -r POD; do
    kubectl delete pod "$POD" -n $NAMESPACE
done


echo "Cleanup completed."


