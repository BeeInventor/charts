{{/*
nsq fullname
*/}}
{{- define "nsq.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Chart name
*/}}
{{- define "nsq.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
nsqlookupd fullname
*/}}
{{- define "nsq.nsqlookupd.fullname" -}}
{{- if .Values.nsqlookupd.fullnameOverride -}}
{{- .Values.nsqlookupd.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name "nsqlookupd" -}}
{{- end }}
{{- end }}

{{/*
nsqadmin fullname
*/}}
{{- define "nsq.nsqadmin.fullname" -}}
{{- if .Values.nsqadmin.fullnameOverride -}}
{{- .Values.nsqadmin.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name "nsqadmin" -}}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nsq.commonLabels" -}}
helm.sh/chart: {{ include "nsq.chart" . }}
helm.sh/release: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "nsq.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
nsqlookupd selector labels
*/}}
{{- define "nsq.nsqlookupd.selectorLabels" -}}
app.kubernetes.io/component: nsqlookupd
{{- end }}

{{/*
nsqadmin selector labels
*/}}
{{- define "nsq.nsqadmin.selectorLabels" -}}
app.kubernetes.io/component: nsqadmin
{{- end }}
