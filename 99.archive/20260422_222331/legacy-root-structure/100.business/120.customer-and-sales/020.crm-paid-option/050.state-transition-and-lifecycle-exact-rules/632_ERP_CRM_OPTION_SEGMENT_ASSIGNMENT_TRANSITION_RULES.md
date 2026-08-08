# ============================================================
# ERP CRM OPTION SEGMENT ASSIGNMENT TRANSITION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-632
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.segment_assignment.transition_rules
component: crm-option-segment-assignment-transition-rules


# OBJECT

crm_customer_segment_assignment


# INTERPRETATION

Segment assignment is not a simple mutable label.

It is a governed classification record with time effect.


# ALLOWED OPERATIONS

- create assignment
- end-date assignment
- replace current assignment with exact effective boundary
- archive mistaken assignment with reason


# PROHIBITIONS

- overwrite historical segment assignment without trace
- create overlapping primary segment assignments if
  exclusivity is required by the segment family
- backdate segment change silently


# REQUIRED FIELDS FOR CHANGE

- segment_code
- segment_source_code
- effective_from
- effective_to
- assigned_reason
- assigned_by


# RULE

If one assignment replaces another, the previous
assignment must be explicitly end-dated or archived.

