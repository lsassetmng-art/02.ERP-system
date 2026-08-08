# ============================================================
# AUDIT FINDING / REMEDIATION / SOURCE MODULE BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 51.audit
related_modules:
- 50.approval
- all ERP source modules
- 60.business-intelligence
- 12.common-os

purpose:
Define audit finding, audit evidence, remediation tracking, and source module
correction boundaries so audit can govern without mutating source business canon.

canonical_role:
- audit plan / evidence / finding / closure truth
- remediation lifecycle truth under remediation-tracking submodule

audit_submodules:
- 01.store-audit
- 02.system-audit
- 03.business-audit
- 04.internal-control
- 05.compliance-audit
- 06.remediation-tracking

# ============================================================
# 1. CORE AUDIT OBJECTS
# ============================================================

core_objects:
- audit_plan
- audit_scope
- audit_program
- audit_procedure
- audit_evidence
- audit_workpaper
- audit_finding
- audit_recommendation
- audit_management_response
- audit_remediation_action
- audit_remediation_followup
- audit_closure_review
- audit_report
- audit_reopen_event

# ============================================================
# 2. AUDIT PLAN / SCOPE
# ============================================================

object_name:
- audit_plan

required_fields:
- audit_plan_id
- company_id
- audit_type
- audit_name
- target_module_set
- target_scope_summary
- audit_period_start
- audit_period_end
- planned_start_at
- planned_end_at
- audit_status
- audit_owner
- approval_reference_or_null
- lineage_reference

audit_type_examples:
- store_audit
- system_audit
- business_audit
- internal_control
- compliance_audit
- special_audit
- followup_audit

allowed_audit_status:
- draft
- approved
- scheduled
- in_progress
- evidence_review
- reporting
- closed
- cancelled
- superseded

rules:
- audit plan belongs to 51
- audit approval may use 50 if required
- audit plan does not alter source business records

object_name:
- audit_scope

required_fields:
- audit_scope_id
- audit_plan_id
- company_id
- source_module
- source_object_type_or_process
- scope_criteria
- period_start
- period_end
- scope_status
- lineage_reference

rules:
- scope identifies target, not ownership transfer
- source module remains owner of audited record/process

# ============================================================
# 3. AUDIT EVIDENCE
# ============================================================

object_name:
- audit_evidence

meaning:
- canonical evidence collected for audit purpose

required_fields:
- audit_evidence_id
- company_id
- audit_plan_id
- source_module
- source_object_type
- source_object_id_or_query_reference
- source_version_id_or_null
- evidence_type
- evidence_collected_at
- collected_by
- evidence_reference
- evidence_hash_or_null
- evidence_summary
- evidence_status
- lineage_reference

evidence_type_examples:
- source_snapshot
- document
- screenshot
- transaction_sample
- log_extract
- approval_trace
- interview_note
- inspection_observation
- system_configuration_snapshot
- control_test_result

allowed_evidence_status:
- collected
- reviewed
- rejected
- superseded
- archived

rules:
- evidence is audit truth
- evidence references source module objects
- evidence does not become source business record
- source corrections must not overwrite historical audit evidence

# ============================================================
# 4. AUDIT FINDING
# ============================================================

object_name:
- audit_finding

meaning:
- canonical audit issue/finding identified by audit process

required_fields:
- audit_finding_id
- company_id
- audit_plan_id
- audit_type
- source_module
- source_object_type_or_process
- source_object_id_or_reference_or_null
- finding_title
- finding_summary
- finding_category
- severity
- root_cause_summary_or_null
- risk_summary
- recommendation_summary
- evidence_reference_set
- finding_status
- identified_at
- identified_by
- management_response_reference_or_null
- remediation_required_flag
- remediation_action_reference_set_or_null
- closure_review_reference_or_null
- lineage_reference

finding_category_examples:
- policy_violation
- control_design_deficiency
- control_operation_deficiency
- process_exception
- data_quality_issue
- authorization_issue
- segregation_of_duties_issue
- compliance_gap
- inventory_discrepancy
- store_operation_issue
- system_access_issue
- security_issue

allowed_severity:
- informational
- low
- medium
- high
- critical

allowed_finding_status:
- draft
- issued
- management_response_pending
- remediation_required
- remediation_in_progress
- ready_for_closure_review
- closed
- reopened
- cancelled
- superseded

rules:
- original finding truth belongs to 51.audit
- source module may respond but may not erase finding
- remediation-tracking may track corrective action but does not own original finding truth
- closure belongs to audit review
- finding does not directly mutate source module record

# ============================================================
# 5. MANAGEMENT RESPONSE
# ============================================================

object_name:
- audit_management_response

required_fields:
- management_response_id
- company_id
- audit_finding_id
- responding_source_module_or_owner
- response_type
- response_summary
- accepted_flag
- disagreement_reason_or_null
- planned_action_summary_or_null
- response_status
- responded_at
- responded_by
- lineage_reference

response_type_examples:
- agree
- agree_with_condition
- disagree
- accept_risk
- remediation_planned
- already_corrected

allowed_response_status:
- draft
- submitted
- accepted_by_audit
- returned_by_audit
- superseded
- cancelled

rules:
- management response is linked to finding
- response does not close finding by itself
- accepted risk may require approval depending on policy
- actual source correction must happen in source module

# ============================================================
# 6. REMEDIATION ACTION
# ============================================================

object_name:
- audit_remediation_action

meaning:
- corrective action lifecycle record, normally under 51.audit/06.remediation-tracking

required_fields:
- remediation_action_id
- company_id
- audit_finding_id
- source_module
- source_object_type_or_process
- corrective_action_summary
- action_owner
- due_date
- priority_class
- remediation_status
- source_correction_required_flag
- source_correction_reference_or_null
- approval_reference_or_null
- evidence_reference_set_or_null
- created_at
- created_by
- lineage_reference

allowed_remediation_status:
- draft
- assigned
- in_progress
- waiting_source_correction
- source_corrected
- evidence_submitted
- followup_review
- closed
- overdue
- reopened
- cancelled
- superseded

rules:
- remediation action owns corrective lifecycle
- remediation action does not own original finding truth
- remediation action does not directly mutate source module truth
- source_correction_reference must point to actual source module correction when required
- closure requires audit follow-up or closure review where policy requires

# ============================================================
# 7. SOURCE MODULE CORRECTION REQUEST
# ============================================================

handoff_object_name:
- audit_to_source_correction_request

meaning:
- controlled request from audit/remediation to source module to perform correction

required_fields:
- correction_request_id
- company_id
- source_module
- target_source_module
- audit_finding_id
- remediation_action_id_or_null
- source_object_type_or_process
- source_object_id_or_reference_or_null
- requested_correction_type
- requested_correction_summary
- correction_due_date
- priority_class
- request_status
- created_at
- created_by
- lineage_reference

requested_correction_type_examples:
- master_data_correction
- transaction_correction
- access_control_correction
- approval_policy_correction
- process_control_correction
- inventory_adjustment_review
- accounting_adjustment_review
- payroll_recalculation_review
- document_correction
- training_or_procedure_update

allowed_request_status:
- building
- sent_to_source
- accepted_by_source
- rejected_by_source
- source_correction_in_progress
- source_corrected
- evidence_returned
- cancelled
- superseded

rules:
- source module may accept or reject correction request with reason
- source module performs actual correction through source workflow
- audit/remediation records reference to source correction result
- correction request is not the correction itself

# ============================================================
# 8. SOURCE MODULE RESPONSE TO AUDIT
# ============================================================

source_response_object_name:
- source_to_audit_correction_result

required_fields:
- correction_result_id
- company_id
- source_module
- audit_finding_id
- remediation_action_id_or_null
- correction_request_id_or_null
- source_correction_object_type
- source_correction_object_id
- source_correction_version_id_or_null
- correction_status
- correction_completed_at_or_null
- corrected_by_or_system_actor
- evidence_reference_set
- source_note_or_null
- lineage_reference

allowed_correction_status:
- accepted
- rejected
- corrected
- partially_corrected
- no_action_taken
- risk_accepted
- superseded
- cancelled

rules:
- source result references actual source workflow result
- audit reviews evidence before closure
- source result does not close audit finding automatically

# ============================================================
# 9. CLOSURE REVIEW / REOPEN
# ============================================================

object_name:
- audit_closure_review

required_fields:
- closure_review_id
- company_id
- audit_finding_id
- remediation_action_id_or_null
- reviewed_evidence_reference_set
- closure_decision
- closure_reason
- reviewed_at
- reviewed_by
- followup_required_flag
- lineage_reference

closure_decision_examples:
- close
- return_for_more_evidence
- reopen
- accept_risk_close
- partial_close

rules:
- closure decision belongs to 51.audit
- closure does not rewrite source business record
- closure does not delete finding history
- reopened finding/action must preserve lineage

object_name:
- audit_reopen_event

required_fields:
- audit_reopen_event_id
- company_id
- audit_finding_id
- remediation_action_id_or_null
- reopen_reason
- reopened_at
- reopened_by
- previous_closure_review_id_or_null
- lineage_reference

# ============================================================
# 10. AUDIT TYPES AND SOURCE BOUNDARY
# ============================================================

store_audit_boundary:
- store audit may inspect retail / restaurant / store operations
- findings belong to 51.audit/01.store-audit
- source corrections occur in relevant source modules

system_audit_boundary:
- system audit may inspect access, logs, backup/restore, change management, ITGC
- findings belong to 51.audit/02.system-audit
- system/source owner performs actual correction

business_audit_boundary:
- business audit may inspect workflow, approvals, transaction handling, procedure
- findings belong to 51.audit/03.business-audit
- process/source modules perform correction

internal_control_boundary:
- internal control evaluates control design/operation/key controls/deficiencies
- findings/control evaluations belong to 51.audit/04.internal-control
- source modules and approval policies are corrected through their own workflows

compliance_boundary:
- compliance audit evaluates law/regulation/internal rule/labor/privacy/security compliance
- findings belong to 51.audit/05.compliance-audit
- source modules perform correction

remediation_tracking_boundary:
- 51.audit/06.remediation-tracking owns corrective action lifecycle
- it does not own original finding truth
- it does not directly modify source business canon

# ============================================================
# 11. OUTPUT TO APPROVAL / BI / COMMONOS
# ============================================================

approval_relationship:
- remediation action may require approval
- accepted risk response may require approval
- audit plan or report may require approval
- 50 owns approval decision if used
- audit owns finding/closure truth

BI_consumable_outputs:
- audit plan snapshot
- audit evidence summary snapshot
- finding status snapshot
- remediation status snapshot
- overdue remediation snapshot
- closure status snapshot
- control deficiency trend snapshot

CommonOS_allowed_presentation:
- audit queue
- finding detail
- remediation task list
- closure review queue
- audit dashboard shell
- evidence upload presentation

rules:
- BI visualizes only
- CommonOS presents only
- source mutation remains source module workflow

# ============================================================
# 12. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- audit finding directly editing source transaction
- remediation action directly posting accounting adjustment
- remediation action directly changing inventory ledger
- remediation action directly recalculating payroll
- source module deleting or rewriting original audit finding
- source module closing finding without audit closure review
- remediation-tracking taking ownership of original finding truth
- approval decision replacing audit closure review
- BI dashboard closing remediation action
- CommonOS queue status treated as audit finding status source
- evidence snapshot treated as current source truth after source correction
- audit closure treated as source correction

# ============================================================
# 13. DECISION TEST
# ============================================================

decision_test:
- If it is audit evidence / finding / severity / recommendation / closure, 51 owns it.
- If it is corrective action lifecycle, 51.audit/06.remediation-tracking owns it.
- If it is actual source business correction, source module owns it.
- If it is approval of a remediation or accepted risk, 50 owns approval decision.
- If it is dashboard projection, 60 owns projection only.
- If it is queue presentation, CommonOS owns presentation only.

# ============================================================
# 14. COMPLETION STATE
# ============================================================

completion_state:
- audit finding exact design fixed
- remediation lifecycle exact design fixed
- source correction request/result boundary fixed
- closure/reopen ownership fixed
- approval/BI/CommonOS boundaries fixed

# ============================================================
