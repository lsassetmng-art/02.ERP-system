# ============================================================
# ERP AUDIT INFRASTRUCTURE BOUNDARY ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for cross-cutting audit infrastructure outside the audit schema.

main_objects:
- core.trg_audit_iud()
- core.fn_audit_trail()
- core.audit_trail
- core.audit_trail_2025_12
- core.audit_trail_2026_01
- core.audit_trail_2026_02
- core.audit_trail_2026_03
- core.audit_trail_2026_04
- core.audit_trail_2026_05
- core.audit_trail_2026_06
- core.audit_trail_2026_07
- core.audit_impact_rule
- core.audit_column_weight

role_split:
- capture mechanism
- audit trail storage
- weighting / impact support rules

main_rule:
These objects support audit capture and storage broadly across the ERP,
but they are not identical to audit-domain truth objects.

design_implication:
Audit architecture must include an explicit infrastructure boundary
separate from audit truth and audit event subdomains.

conclusion:
Cross-cutting audit infrastructure is a supporting layer,
not the same thing as the audit domain itself.
