# ============================================================
# ERP SAFE AUTOMATION PROFILE VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2981
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.safe_automation_profile_vs_management.boundary_rule
component: safe-automation-profile-vs-management-boundary-rule


# RULE

Safe automation profile owns:
- safety eligibility interpretation
- constraint interpretation
- precheck and rollback profile interpretation

Management owns:
- higher-order approval and policy truth

# CONSEQUENCE

A safe automation profile is not management policy truth.
Profile interpretation may require management visibility,
but it does not replace management-owned truth.

