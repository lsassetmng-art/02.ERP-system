# ============================================================
# APPROVAL WORKFLOW / SOURCE MODULE BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 50.approval
related_modules:
- all ERP source modules
- 51.audit
- 60.business-intelligence
- 12.common-os

purpose:
Define approval workflow truth and exact boundaries with ERP source modules.
Approval supports source workflows but does not own source business records.

canonical_role:
- approval route / approval decision / approval evidence truth

# ============================================================
# 1. CORE APPROVAL OBJECTS
# ============================================================

core_objects:
- approval_policy
- approval_route_definition
- approval_request
- approval_request_source_reference
- approval_step
- approval_actor_assignment
- approval_delegation
- approval_decision
- approval_comment
- approval_escalation
- approval_sla_state
- approval_evidence_package
- approval_outcome_notification

# ============================================================
# 2. APPROVAL POLICY
# ============================================================

object_name:
- approval_policy

meaning:
- rule defining when approval is required and which route is used

required_fields:
- approval_policy_id
- company_id
- policy_code
- policy_name
- source_module
- source_object_type
- action_type
- condition_expression_or_reference
- route_definition_id
- effective_from
- effective_to_or_null
- active_flag
- version_id
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

action_type_examples:
- create
- update
- cancel
- freeze
- release
- close
- reopen
- post
- adjust
- approve_budget
- approve_payroll
- approve_purchase_order
- approve_inventory_adjustment
- approve_audit_remediation

rules:
- approval policy belongs to 50
- source module decides how approved action is applied
- policy version must be retained for historical approval requests

# ============================================================
# 3. APPROVAL REQUEST
# ============================================================

object_name:
- approval_request

meaning:
- canonical approval request for a proposed source module action

required_fields:
- approval_request_id
- company_id
- source_module
- source_object_type
- source_object_id
- source_object_version_id_or_null
- proposed_action_type
- requested_by
- requested_at
- request_reason
- route_definition_id
- approval_policy_id_or_null
- request_status
- source_payload_snapshot_reference_or_null
- source_validation_reference_or_null
- due_at_or_null
- priority_class
- lineage_reference

allowed_request_status:
- draft
- submitted
- in_review
- approved
- rejected
- returned
- escalated
- delegated
- cancelled
- expired
- superseded

rules:
- approval request references source object
- approval request is not source object
- source payload snapshot is evidence only
- approved request does not automatically mutate source object
- source module must check approval freshness before commit

# ============================================================
# 4. SOURCE REFERENCE
# ============================================================

object_name:
- approval_request_source_reference

required_fields:
- source_reference_id
- approval_request_id
- company_id
- source_module
- source_object_type
- source_object_id
- source_object_version_id_or_null
- source_status_at_request
- source_action_requested
- source_snapshot_hash_or_null
- source_snapshot_created_at_or_null
- source_drilldown_reference_or_null

rules:
- source reference must be explicit
- source module remains source owner
- if source object changes materially, approval may need supersession or re-request

# ============================================================
# 5. APPROVAL ROUTE / STEP
# ============================================================

object_name:
- approval_route_definition

required_fields:
- route_definition_id
- company_id
- route_code
- route_name
- route_type
- step_definition_set
- active_flag
- version_id
- effective_from
- effective_to_or_null
- lineage_reference

route_type_examples:
- sequential
- parallel
- any_one
- majority
- amount_based
- role_based
- conditional

object_name:
- approval_step

required_fields:
- approval_step_id
- approval_request_id
- step_number
- step_type
- assigned_actor_role_or_person
- step_status
- required_decision_type
- due_at_or_null
- started_at_or_null
- completed_at_or_null
- decision_reference_or_null
- lineage_reference

allowed_step_status:
- pending
- active
- approved
- rejected
- returned
- skipped
- escalated
- delegated
- expired
- cancelled

rules:
- route and steps belong to approval
- source module does not own approver sequence
- source module may request approval but cannot fabricate approval completion

# ============================================================
# 6. APPROVAL DECISION
# ============================================================

object_name:
- approval_decision

meaning:
- canonical approval decision event

required_fields:
- approval_decision_id
- approval_request_id
- approval_step_id_or_null
- company_id
- decision_type
- decided_by
- decided_at
- decision_comment_or_null
- condition_or_exception_reference_or_null
- decision_status
- lineage_reference

decision_type_examples:
- approve
- reject
- return
- escalate
- delegate
- cancel
- expire
- skip

allowed_decision_status:
- recorded
- superseded_by_route_change
- cancelled_by_request_cancellation

rules:
- approval decision is immutable after recorded
- correction requires successor decision or request supersession
- approve means source module may proceed if source validation still passes
- reject means source module must not perform proposed action
- return means source module must revise or cancel
- decision does not execute source business action

# ============================================================
# 7. DELEGATION / ESCALATION
# ============================================================

object_name:
- approval_delegation

required_fields:
- delegation_id
- company_id
- from_actor
- to_actor
- delegation_scope
- effective_from
- effective_to
- delegation_status
- created_at
- lineage_reference

object_name:
- approval_escalation

required_fields:
- escalation_id
- approval_request_id
- approval_step_id
- escalation_reason
- escalated_from
- escalated_to
- escalated_at
- escalation_status
- lineage_reference

rules:
- delegation/escalation changes approval route responsibility
- delegation/escalation does not change source object
- source commit still belongs to source module

# ============================================================
# 8. APPROVAL OUTCOME TO SOURCE MODULE
# ============================================================

handoff_object_name:
- approval_outcome_notification

meaning:
- controlled notification from approval to source module

required_fields:
- approval_outcome_notification_id
- company_id
- source_module
- source_object_type
- source_object_id
- approval_request_id
- final_decision_type
- final_decision_at
- final_decided_by_or_route_summary
- source_object_version_id_at_request_or_null
- approval_policy_id_or_null
- route_definition_id
- outcome_status
- created_at
- lineage_reference

allowed_outcome_status:
- building
- sent_to_source
- acknowledged_by_source
- rejected_by_source_as_stale
- applied_by_source
- cancelled
- superseded

rules:
- source module must acknowledge outcome
- source module may reject as stale if source object changed materially
- applied_by_source is reported by source module, not self-assumed by approval
- approval does not directly apply source transition

# ============================================================
# 9. SOURCE MODULE ACCEPTANCE OF APPROVAL
# ============================================================

source_acceptance_requires:
- approval_request_id present
- source object matches request
- proposed action matches request
- final_decision_type = approve where approval required
- approval is not expired/cancelled/superseded
- source object version is still valid or revalidation passes
- approval lineage retained in source transition

source_reject_as_stale_when:
- source object version materially changed
- proposed action changed
- approval policy changed and re-approval required
- approval expired
- route was cancelled or superseded
- source validation fails after approval

# ============================================================
# 10. APPROVAL-AUDIT RELATIONSHIP
# ============================================================

audit_relationship:
- 51.audit may audit approval workflow
- audit may create finding about approval control
- audit may inspect approval evidence package
- audit may not change approval decision in place
- remediation may require approval policy or source process correction

# ============================================================
# 11. OUTPUT TO BI / COMMONOS
# ============================================================

BI_consumable_outputs:
- approval request snapshot
- approval decision snapshot
- approval SLA snapshot
- approval overdue snapshot
- approval route performance snapshot

CommonOS_allowed_presentation:
- approval queue
- approval detail
- approval decision form
- approval status badge
- approval stale warning
- approval route progress display

rules:
- BI may visualize approval performance
- CommonOS may present approval UI
- neither BI nor CommonOS owns approval meaning or source business state

# ============================================================
# 12. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- approval directly creating purchase order / invoice / GL journal / stock ledger / payroll run
- source module committing action without required approval reference
- source module fabricating approval result
- approval editing source record fields directly
- approval decision changed in place after recorded
- BI dashboard approving action
- CommonOS queue state treated as approval decision
- audit finding changing approval decision directly

# ============================================================
# 13. DECISION TEST
# ============================================================

decision_test:
- If it is approval route, request, step, actor, delegation, escalation, or decision, 50 owns it.
- If it is the business transaction being approved, source module owns it.
- If it is audit finding about approval, 51 owns finding truth.
- If it is display only, CommonOS/BI may present but not own source meaning.

# ============================================================
# 14. COMPLETION STATE
# ============================================================

completion_state:
- approval workflow exact design fixed
- source module outcome notification fixed
- approval vs source commit separated
- stale approval handling fixed
- BI/CommonOS boundaries fixed

# ============================================================
