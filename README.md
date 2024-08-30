# PodBee

PodBee is an open-source debugging pod that collects a curated stack of tools for everyday debugging needs.

## Usage

We recommend to store the pod configuration in a ConfigMap, and run the pod whenever you need it.

```
# podbee.yaml
apiVersion: v1
data:
  pod: |
    apiVersion: v1
    kind: Pod
    metadata:
      name: podbee
      annotations:
        linkerd.io/inject: disabled // if you have linkerd
    spec:
      containers:
      - image: ghcr.io/biznesbees/podbee:v0.1.4
        name: podbee
        command:
        - /bin/bash
        - -c
        - |
          while true; do date; sleep 2; done
        resources:
          limits:
            cpu: 2
            memory: 250Mi
          requests:
            cpu: 10m
            memory: 250Mi
        securityContext:
          allowPrivilegeEscalation: false
          privileged: false
          readOnlyRootFilesystem: true
          runAsNonRoot: true
          runAsUser: 10001
          capabilities:
            add: ["NET_ADMIN", "SYS_TIME"]
      dnsPolicy: ClusterFirst
      restartPolicy: Always
kind: ConfigMap
metadata:
  name: podbee
  namespace: default
```

Save the configuration into a ConfigMap.
```
kubectl apply -f podbee.yaml
```

Whenever you need it, run:
```
kubectl get cm podbee -o jsonpath='{.data.pod}' | kubectl  apply  -f  -
```
Voilaa, Happy debugging!

## Contributing

Contributions are welcome! Whether it's bug fixes, feature enhancements, or documentation improvements, feel free to submit a pull request.
