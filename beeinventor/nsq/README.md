# NSQ

NSQ is a realtime distributed messaging platform designed to operate at scale, handling billions of messages per day.

This chart only provides `nsqlookupd` and `nsqadmin` components, since the best practice to deploy `nsqd` is to use the `Sidecar Pattern` that run with the app container in the pod.

## Values

The following table lists the configurable parameters of the nsq chart and their default values.

### common

| Value            | Description                                      | Default                |
| ---------------- | ------------------------------------------------ | ---------------------- |
| fullnameOverride | String to partially override nsq.fullname        | `Chart name`           |
| image.repository | NSQ image repository                             | `nsqio/nsq`            |
| image.tag        | NSQ image tag                                    | `v{.Chart.AppVersion}` |
| image.pullPolicy | Image pull policy                                | `IfNotPresent`         |
| imagePullSecrets | Specify docker-registry secret names as an array | `[]`                   |

### nsqlookupd

| Value                          | Description                                                  | Default                    |
| ------------------------------ | ------------------------------------------------------------ | -------------------------- |
| nsqlookupd.enabled             | Enable the nsqlookupd                                        | `true`                     |
| nsqlookupd.fullnameOverride    | String to partially override nsq.nsqlookupd.fullname         | `.Release.Name-nsqlookupd` |
| nsqlookupd.replicaCount        | Number of nsqlookupd replicas                                | `3`                        |
| nsqlookupd.extraArgs           | Extra arguments to provide to the `nsqlookupd` command       | `[]`                       |
| nsqlookupd.podManagementPolicy | The pod management policy of the StatefulSet                 | `Parallel`                 |
| nsqlookupd.podAnnotations      | The annotations to attach to the nsqlookupd pods             | `{}`                       |
| nsqlookupd.podSecurityContext  | The security context to attach to the nsqlookupd pods        | `{}`                       |
| nsqlookupd.resources           | The resources to allocate to the nsqlookupd pods             | `{}`                       |
| nsqlookupd.nodeSelector        | The tags that will be used to select the node on which the pods should be scheduled | `{}`                       |
| nsqlookupd.tolerations         | Tolerations for pod assignment                               | `[]`                       |
| nsqlookupd.affinity            | Affinity for pod assignment                                  | `[]`                       |

### nsqadmin

| Value                        | Description                                                  | Default                  |
| ---------------------------- | ------------------------------------------------------------ | ------------------------ |
| nsqadmin.enabled             | Enable the nsqadmin                                          | `true`                   |
| nsqadmin.fullnameOverride    | String to partially override nsq.nsqadmin.fullname           | `.Release.Name-nsqadmin` |
| nsqadmin.replicaCount        | Number of nsqadmin replicas                                  | `1`                      |
| nsqadmin.extraArgs           | Extra arguments to provide to the `nsqadmin` command         | `[]`                     |
| nsqadmin.service.type        | The nsqadmin service type                                    | `ClusterIP`              |
| nsqadmin.service.port        | The nsqadmin service port                                    | `4171`                   |
| nsqadmin.service.nodePort    | The nsqadmin service node port                               | `nil`                    |
| nsqadmin.ingress.enabled     | Enable the nsqadmin ingress                                  | `false`                  |
| nsqadmin.ingress.host        | Host of the nsqadmin ingress                                 | `nil`                    |
| nsqadmin.ingress.annotations | The annotations to attach to the ingress                     | `{}`                     |
| nsqadmin.ingress.tls         | TLS configurations for the hostname                          | `[]`                     |
| nsqadmin.podAnnotations      | The annotations to attach to the nsqadmin pods               | `{}`                     |
| nsqadmin.podSecurityContext  | The security context to attach to the nsqadmin pods          | `{}`                     |
| nsqadmin.resources           | The resources to allocate to the nsqadmin pods               | `{}`                     |
| nsqadmin.nodeSelector        | The tags that will be used to select the node on which the pods should be scheduled | `{}`                     |
| nsqadmin.tolerations         | Tolerations for pod assignment                               | `[]`                     |
| nsqadmin.affinity            | Affinity for pod assignment                                  | `[]`                     |
