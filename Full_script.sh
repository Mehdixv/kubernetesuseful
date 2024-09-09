#!/bin/bash

# Define the namespace
NAMESPACE="Your_Name_space"

# ---- Delete Completed Pods ----

echo "Deleting Completed Pods..."

# Using a script approach to handle the deletion one by one
kubectl get pods -n $NAMESPACE --field-selector status.phase=Succeeded -o jsonpath="{.items[*].metadata.name}" | \
tr ' ' '\n' | while read -r POD; do
    kubectl delete pod "$POD" -n $NAMESPACE
done



# ---- Delete Duplicated Pods ----

echo "Deleting Duplicated Pods..."

# Find and delete duplicated pods
kubectl get pods -n $NAMESPACE -o custom-columns=NAME:.metadata.name,STATUS:.status.phase --no-headers | \
awk '{print $1}' | sort | uniq -d | while read -r POD; do
    kubectl delete pod "$POD" -n $NAMESPACE
done



# ---- Delete Evicted Pods ----

echo "Deleting Evicted Pods..."

# Using a script approach to handle the deletion one by one
kubectl get pods -n $NAMESPACE --field-selector status.phase=Failed -o jsonpath="{.items[?(@.status.reason=='Evicted')].metadata.name}" | \
tr ' ' '\n' | sort | uniq | while read -r POD; do
    kubectl delete pod "$POD" -n $NAMESPACE
done





echo "Cleanup completed."
