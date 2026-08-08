# ============================================================
# CRM MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. Canonical entities

### 1.1 crm_relationship_profile
- crm_relationship_profile_id
- company_id
- customer_id
- relationship_status
- relationship_health
- relationship_owner_id
- primary_contact_id nullable
- last_interaction_at nullable
- next_followup_due_at nullable
- risk_flag
- dormancy_flag
- created_at
- updated_at

### 1.2 crm_interaction
- crm_interaction_id
- customer_id
- contact_id nullable
- interaction_type
- interaction_channel
- subject
- interaction_note
- interaction_at
- performed_by
- related_sfa_opportunity_id nullable
- related_sales_quote_id nullable
- followup_plan_id nullable

### 1.3 crm_followup_plan
- crm_followup_plan_id
- customer_id
- plan_title
- plan_purpose
- due_at
- owner_id
- followup_status
- completion_note nullable
- completed_at nullable
- created_at
- updated_at

### 1.4 crm_account_note
- crm_account_note_id
- customer_id
- note_category
- note_title
- note_body
- visibility_scope
- created_by
- created_at
- updated_at

### 1.5 crm_engagement_snapshot
- crm_engagement_snapshot_id
- customer_id
- snapshot_date
- interaction_count_30d
- interaction_count_90d
- open_followup_count
- overdue_followup_count
- relationship_health_snapshot
- risk_reason_summary

### 1.6 crm_timeline_projection_source
- crm_timeline_projection_source_id
- customer_id
- source_module
- source_reference_id
- source_type
- source_occurred_at
- source_summary

## 2. Status canon

### 2.1 relationship_status
- prospective
- active
- monitored
- at_risk
- recovering
- dormant
- closed

### 2.2 relationship_health
- strong
- stable
- watch
- weak
- critical

### 2.3 followup_status
- open
- in_progress
- completed
- cancelled
- overdue

## 3. Keys and uniqueness
- one relationship profile per customer per company
- interaction id immutable
- follow-up plan id immutable
- timeline projection source append-oriented

## 4. Canonical invariants
- relationship profile requires customer_id
- overdue follow-up is derived from due date and completion state
- CRM context may reference SFA/Sales objects but never mutates them
- dormant flag and health snapshot are auditable
