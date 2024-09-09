# kubernetesuseful
 
Below is a comprehensive scripts that includes the different sections for deleting Completed pods, removing duplicate pods, and deleting Evicted pods. Each section is accompanied by a commented-out one-liner command for your reference.

Explanation:
1)Delete Completed Pods:

Script Approach: Iterates through each pod name and deletes it.
One-Liner Command: The commented-out one-liner does the same but might run into issues with a large number of pods.
2)Delete Duplicated Pods:

Script Approach: Identifies and deletes duplicated pod names.
One-Liner Command: The commented-out one-liner accomplishes the same task but may require handling duplicate entries carefully.
3)Delete Evicted Pods:

Script Approach: Filters and deletes pods with the Evicted status.

Note:
---------------------------------------------------------------------------------------------------------------------
One-Liner Command: The commented-out one-liner achieves the same, potentially more concisely.
Feel free to uncomment the one-liner commands if you prefer a more compact approach, but using the script approach can help handle large lists more reliably.
----------------------------------------------------------------------------------------------------------------------
