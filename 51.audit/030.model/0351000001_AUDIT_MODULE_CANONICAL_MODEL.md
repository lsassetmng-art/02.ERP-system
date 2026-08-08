# ============================================================
# AUDIT MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 51.audit

Entities:
- audit_package
- audit_control_test
- audit_finding
- audit_remediation_request
- audit_conclusion
- audit_evidence_link

Status canon:
- prepared
- in_review
- finding_open
- remediation_in_progress
- closed
- exception_accepted

Invariant:
- audit evidence links remain source-referenced
- findings and conclusions remain historically visible
