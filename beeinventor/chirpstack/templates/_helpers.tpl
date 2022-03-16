{{/*
Expand the name of the chart.
*/}}
{{- define "chirpstack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chirpstack.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "chirpstack.region" -}}
{{- (printf "%s-%s" .Values.networkServer.band.name .Values.networkServer.variant) | lower -}}
{{- end -}}

{{- define "chirpstack.mosquitto" -}}
{{- (printf "tcp://%s-mosquitto:1883" (include "chirpstack.name" .)) -}}
{{- end -}}
