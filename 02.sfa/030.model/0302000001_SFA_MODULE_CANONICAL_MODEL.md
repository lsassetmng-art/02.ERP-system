# ============================================================
# SFA MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. Canonical entities

### 1.1 sfa_lead
- sfa_lead_id
- company_id
- lead_number
- lead_source
- lead_status
- person_name
- organization_name
- email
- phone
- territory_code
- assigned_salesperson_id
- qualification_score
- qualification_result
- converted_opportunity_id nullable
- created_at
- updated_at

### 1.2 sfa_opportunity
- sfa_opportunity_id
- company_id
- opportunity_number
- customer_id nullable
- originating_lead_id nullable
- opportunity_title
- pipeline_stage
- opportunity_status
- owner_salesperson_id
- amount_estimate
- currency_code
- close_probability
- expected_close_date
- lost_reason_code nullable
- won_at nullable
- lost_at nullable
- disqualified_at nullable
- created_at
- updated_at

### 1.3 sfa_opportunity_stage_history
- sfa_opportunity_stage_history_id
- sfa_opportunity_id
- stage_from
- stage_to
- changed_by
- changed_at
- change_reason

### 1.4 sfa_activity
- sfa_activity_id
- sfa_opportunity_id nullable
- sfa_lead_id nullable
- activity_type
- activity_channel
- subject
- activity_note
- activity_at
- performed_by
- next_action_id nullable

### 1.5 sfa_next_action
- sfa_next_action_id
- sfa_opportunity_id nullable
- sfa_lead_id nullable
- action_type
- action_title
- due_at
- owner_salesperson_id
- action_status
- completion_note
- completed_at nullable

### 1.6 sfa_quote_request
- sfa_quote_request_id
- sfa_opportunity_id
- quote_request_status
- requested_by
- requested_at
- target_sales_quote_id nullable
- request_payload_version
- request_payload_hash
- last_error_code nullable
- last_error_message nullable

## 2. Status canon

### 2.1 lead_status
- new
- contacted
- qualified
- disqualified
- converted
- archived

### 2.2 opportunity_status
- open
- working
- quote_requested
- won
- lost
- disqualified
- archived

### 2.3 pipeline_stage
- discover
- qualify
- propose
- negotiate
- commit

### 2.4 action_status
- open
- in_progress
- completed
- cancelled

### 2.5 quote_request_status
- pending
- sent
- accepted_by_sales
- failed
- cancelled

## 3. Keys and uniqueness
- lead_number unique per company
- opportunity_number unique per company
- one lead may convert to at most one opportunity
- quote request references one opportunity only

## 4. Canonical invariants
- won opportunity cannot return to open
- converted lead cannot convert again
- quote request allowed only for active opportunity stages
- stage history append-only
