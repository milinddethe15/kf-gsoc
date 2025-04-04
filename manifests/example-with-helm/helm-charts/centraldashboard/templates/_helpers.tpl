{{/*
Expand the name of the chart.
*/}}
{{- define "centraldashboard.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "centraldashboard.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "centraldashboard.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "centraldashboard.labels" -}}
helm.sh/chart: {{ include "centraldashboard.chart" . }}
{{ include "centraldashboard.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: centraldashboard
app.kubernetes.io/name: centraldashboard
kustomize.component: centraldashboard
{{- end }}

{{/*
Selector labels
*/}}
{{- define "centraldashboard.selectorLabels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
app: centraldashboard
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "centraldashboard.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "centraldashboard.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
