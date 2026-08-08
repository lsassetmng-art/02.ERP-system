# ============================================================
# STORE AUDIT SUBMODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 51.audit / 01.store-audit

entities:
- store_audit_package
- store_audit_checklist_result
- store_audit_finding
- store_audit_remediation
- store_audit_closure

invariant:
- store audit findings and closures remain historically visible
