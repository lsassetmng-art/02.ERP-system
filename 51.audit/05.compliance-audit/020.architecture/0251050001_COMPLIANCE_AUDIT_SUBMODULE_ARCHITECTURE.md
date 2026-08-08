# ============================================================
# COMPLIANCE AUDIT SUBMODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 51.audit / 05.compliance-audit

components:
- compliance review package service
- rule/regulation check service
- finding and remediation service
- closure service

rule:
Compliance Audit records compliance review truth and findings, not source transaction truth.
