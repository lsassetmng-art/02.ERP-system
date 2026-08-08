# ============================================================
# COMPLIANCE AUDIT SUBMODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 51.audit / 05.compliance-audit

entities:
- compliance_audit_package
- compliance_check_result
- compliance_audit_finding
- compliance_audit_remediation
- compliance_audit_closure

invariant:
- compliance findings and closures remain historically visible and source-referenced
