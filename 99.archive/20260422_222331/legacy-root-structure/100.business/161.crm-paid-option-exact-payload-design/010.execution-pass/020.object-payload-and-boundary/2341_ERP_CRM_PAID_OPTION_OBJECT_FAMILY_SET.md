# ============================================================
# ERP CRM PAID OPTION OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2341
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_paid_option.object_family_set
component: crm-paid-option-object-family-set


# PRIMARY OBJECT FAMILIES

- customer_account
- customer_contact
- customer_interaction_case
- customer_segment_assignment
- customer_relationship_health_snapshot

# RULE

Customer account is not customer contact.
Customer contact is not interaction case.
Interaction case is not segment assignment.
Segment assignment is not relationship health snapshot.

