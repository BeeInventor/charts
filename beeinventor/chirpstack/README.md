# ChirpStack

> This chart is still under development

ChirpStack open-source LoRaWAN® Network Server

## TL;DR

```sh
helm repo add beeinventor https://beeinventor.github.io/charts
helm install my-release beeinventor/chirpstack
```

## Multi-band Installation

Using this chart, you can deploy multi-band network servers and gateway bridges,
additionally, the `networkServer.variant` value can separate deployments of the same band with different network settings.

### Senario

> Please note that each network server's postgres database must be separate, therefore, you must create a database before running the step 2.

1. Install the chart with `applicationServer.enabled: true` only.

    ```sh
    helm upgrade --install -f as-values.yaml chirpstack beeinventor/chirpstack -n chirpstack
    ```

2. Install the chart with `networkServer.enabled: true` and `gatewayBridge.enabled: true`, and modify the values of the network settings (band, networkSettings, etc.).

    ```sh
    helm upgrade --install -f as923-tw.values.yaml taiwan-lora beeinventor/chirpstack -n chirpstack 
    ```

3. Login to the web, and add the network server, for example, `taiwan-lora-chirpstack-gateway-bridge-as923-a:8080`.

### MQTT Topic Template

As for the default mqtt topic templates, the `${region}-${variant}` in lowercase will be prefixed. E.g.

- `as923-a/gateway/...`
- `eu868-a/gateway/...`

### Redis Key Prefix

As each server has its own key prefix, it is fine to share a redis server among several network servers.
For example, if the `networkServer.band.name` is set to `AS923` and the `networkServer.variant` is set to `A`, the network server redis key prefix will be `ns:as923-a`.
