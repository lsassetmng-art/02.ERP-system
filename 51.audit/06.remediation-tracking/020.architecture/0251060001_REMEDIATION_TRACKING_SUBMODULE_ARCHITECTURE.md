# ============================================================
# REMEDIATION TRACKING SUBMODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 51.audit / 06.remediation-tracking

components:
- remediation master service
- action plan tracking service
- due-date monitoring service
- follow-up review service
- closure / reopen service

rule:
Remediation Tracking owns corrective-action lifecycle truth after findings are raised.
