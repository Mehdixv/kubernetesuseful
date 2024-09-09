#!/bin/bash
# Define the namespace
NAMESPACE="YourNameSpace"

# ---- Delete Completed Pods ----
echo "Deleting Completed Pods..."

# Using a script approach to handle the deletion one by one
kubectl get pods -n $NAMESPACE --field-selector status.phase=Succeeded -o jsonpath="{.items[*].metadata.name}" | \
tr ' ' '\n' | while read -r POD; do
    kubectl delete pod "$POD" -n $NAMESPACE
done


echo "Cleanup completed."

                      