{{- define "gaz.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "gaz.selectorLabels" -}}
app: {{ . }}
{{- end }}

{{- define "gaz.podSecurityContext" -}}
securityContext:
  runAsNonRoot: true
  runAsUser: 1000
  fsGroup: 1000
{{- end }}

{{- define "gaz.containerSecurityContext" -}}
securityContext:
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: true
  capabilities:
    drop:
      - ALL
{{- end }}
