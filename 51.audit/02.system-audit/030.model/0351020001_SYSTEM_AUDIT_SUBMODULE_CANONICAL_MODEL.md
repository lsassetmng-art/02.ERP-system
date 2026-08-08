# ============================================================
# SYSTEM AUDIT SUBMODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 51.audit / 02.system-audit

entities:
- system_audit_package
- system_control_review
- system_audit_finding
- system_audit_remediation
- system_audit_closure

invariant:
- system audit findings and closures remain historically visible and source-referenced
