# Kubernetes Useful Scripts

This repository provides a set of comprehensive scripts that address common Kubernetes maintenance tasks, such as deleting completed pods, removing duplicate pods, and deleting evicted pods. Each section includes a commented-out one-liner command for reference, but the script approach is generally more reliable for handling large lists of pods.

## Delete Completed Pods

The `delete_completed_pods.sh` script iterates through each completed pod and deletes it. This approach is more reliable than the one-liner command, which may run into issues with a large number of pods.

```bash
# One-liner command (commented out):
# kubectl get pods -n $NAMESPACE --field-selector status.phase=Succeeded -o jsonpath="{.items[*].metadata.name}" | \tr ' ' '\n' | xargs -r -n 1 -I{} kubectl delete pod {} -n $NAMESPACE

```

## Delete Duplicate Pods

The `delete_duplicate_pods.sh` script identifies and deletes duplicate pod names. The one-liner command accomplishes the same task, but may require more careful handling of duplicate entries.

```bash
# One-liner command (commented out):
# kubectl get pods -n $NAMESPACE -o custom-columns=NAME:.metadata.name,STATUS:.status.phase --no-headers | \awk '{print $1}' | sort | uniq -d | xargs -r -n 1 -I{} kubectl delete pod {} -n $NAMESPACE


```

## Delete Evicted Pods

The `delete_evicted_pods.sh` script filters and deletes pods with the `Evicted` status. The one-liner command achieves the same, potentially more concisely.

```bash
# One-liner command (commented out):
# kubectl get pods -n $NAMESPACE --field-selector status.phase=Failed -o jsonpath="{.items[?(@.status.reason=='Evicted')].metadata.name}" | \ tr ' ' '\n' | sort | uniq | xargs -r -n 1 -I{} kubectl delete pod {} -n $NAMESPACE
```

Feel free to uncomment the one-liner commands if you prefer a more compact approach, but using the script approach can help handle large lists of pods more reliably.
TO  make it executable, and run it 
```bash
# 1) chmod +x Script.sh   //Make it executable
# 2) Run: ./Scripts.sh    // Run it 
```

