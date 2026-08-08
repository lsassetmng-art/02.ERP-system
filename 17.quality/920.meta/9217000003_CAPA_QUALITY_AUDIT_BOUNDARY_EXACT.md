# ============================================================
# CAPA / QUALITY / AUDIT BOUNDARY EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 17.quality
track: Track F
related_modules:
- 51.audit
- 10.purchase
- 11.procurement
- 15.manufacturing
- 12.inventory
- 30.accounting
- 60.business-intelligence

purpose:
Define CAPA lifecycle and its boundary with quality nonconformance,
supplier corrective action, manufacturing corrective action, and audit
remediation tracking.

canonical_role:
- quality-side CAPA truth when CAPA originates from quality/nonconformance

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
- quality_CAPA_case
- CAPA_root_cause_analysis
- CAPA_corrective_action
- CAPA_preventive_action
- CAPA_effectiveness_check
- CAPA_to_audit_remediation_reference
- audit_to_CAPA_request
- CAPA_closure_package

# ============================================================
# 2. CAPA CASE
# ============================================================

object_name:
- quality_CAPA_case

required_fields:
- CAPA_case_id
- company_id
- source_nonconformance_id_or_null
- source_quality_disposition_id_or_null
- source_audit_finding_id_or_null
- CAPA_type
- CAPA_severity
- CAPA_summary
- CAPA_status
- owner_department_or_role
- opened_at
- due_date_or_null
- closed_at_or_null
- lineage_reference

CAPA_type_examples:
- corrective_action
- preventive_action
- supplier_CAPA
- manufacturing_CAPA
- process_CAPA
- audit_requested_CAPA
- customer_complaint_CAPA

allowed_CAPA_status:
- draft
- open
- investigation
- root_cause_pending
- action_planning
- action_in_progress
- effectiveness_check_pending
- closure_review
- closed
- reopened
- cancelled
- superseded

rules:
- CAPA case belongs to 17.quality when quality-owned
- audit finding belongs to 51.audit
- supplier claim belongs to 10.purchase
- supplier evaluation belongs to 11.procurement
- manufacturing execution correction belongs to 15.manufacturing

# ============================================================
# 3. ROOT CAUSE ANALYSIS
# ============================================================

object_name:
- CAPA_root_cause_analysis

required_fields:
- root_cause_analysis_id
- CAPA_case_id
- analysis_method
- root_cause_summary
- contributing_factor_set_or_null
- evidence_reference_set
- analysis_status
- analyzed_by
- analyzed_at_or_null
- lineage_reference

analysis_method_examples:
- five_whys
- fishbone
- fault_tree
- process_review
- supplier_analysis
- audit_analysis
- manual_review

rules:
- root cause analysis belongs to CAPA workflow
- evidence may reference audit/quality/manufacturing/purchase records
- source records are not overwritten by analysis

# ============================================================
# 4. CORRECTIVE / PREVENTIVE ACTION
# ============================================================

object_name:
- CAPA_corrective_action

required_fields:
- corrective_action_id
- CAPA_case_id
- action_owner_module_or_role
- action_description
- target_source_object_reference_or_null
- due_date
- action_status
- completion_evidence_reference_or_null
- completed_at_or_null
- lineage_reference

object_name:
- CAPA_preventive_action

required_fields:
- preventive_action_id
- CAPA_case_id
- action_owner_module_or_role
- action_description
- target_policy_or_process_reference_or_null
- due_date
- action_status
- completion_evidence_reference_or_null
- completed_at_or_null
- lineage_reference

allowed_action_status:
- planned
- assigned
- in_progress
- completed
- rejected
- overdue
- cancelled
- superseded

rules:
- CAPA action tracks quality-side action plan
- target module owns actual source correction/execution
- action completion evidence does not automatically close audit finding

# ============================================================
# 5. EFFECTIVENESS CHECK
# ============================================================

object_name:
- CAPA_effectiveness_check

required_fields:
- effectiveness_check_id
- CAPA_case_id
- check_method
- check_result
- check_summary
- checked_at
- checked_by
- evidence_reference_set_or_null
- next_action_required_flag
- lineage_reference

check_result_examples:
- effective
- partially_effective
- ineffective
- inconclusive
- not_due

rules:
- effectiveness check belongs to CAPA
- ineffective result may reopen CAPA or create successor action
- audit closure remains 51.audit workflow

# ============================================================
# 6. AUDIT BOUNDARY
# ============================================================

handoff_object_name:
- audit_to_CAPA_request

required_fields:
- audit_CAPA_request_id
- company_id
- source_module
- target_module
- audit_finding_id
- remediation_action_id_or_null
- requested_CAPA_type
- request_summary
- request_status
- created_at
- lineage_reference

rules:
- source_module must be 51.audit
- target_module must be 17.quality
- request is not CAPA case until accepted by quality
- audit owns finding/remediation lifecycle

handoff_object_name:
- CAPA_to_audit_remediation_reference

required_fields:
- CAPA_audit_reference_id
- company_id
- source_module
- target_module
- CAPA_case_id
- audit_finding_id_or_null
- remediation_action_id_or_null
- CAPA_status
- effectiveness_check_result_or_null
- reference_status
- created_at
- lineage_reference

rules:
- target_module must be 51.audit
- audit may use CAPA status as evidence
- audit closure remains audit-owned
- CAPA closure remains quality-owned

# ============================================================
# 7. SUPPLIER / MANUFACTURING BOUNDARY
# ============================================================

supplier_boundary:
- Supplier CAPA may reference supplier claim or supplier corrective action.
- 10.purchase owns supplier claim.
- 11.procurement owns supplier qualification/evaluation impact.
- 17.quality owns quality CAPA case.

manufacturing_boundary:
- Manufacturing CAPA may request process correction or rework prevention.
- 15.manufacturing owns production execution correction.
- 17.quality owns CAPA case and effectiveness check.

inventory_accounting_boundary:
- Inventory effect belongs to 12.inventory.
- Accounting financial impact belongs to 30.accounting.
- CAPA does not post journal or stock ledger.

# ============================================================
# 8. CLOSURE PACKAGE
# ============================================================

object_name:
- CAPA_closure_package

required_fields:
- CAPA_closure_package_id
- CAPA_case_id
- root_cause_reference
- corrective_action_reference_set
- preventive_action_reference_set_or_null
- effectiveness_check_reference
- closure_decision
- closure_status
- closed_at_or_null
- approved_by_or_null
- lineage_reference

closure_decision_examples:
- close_effective
- close_with_monitoring
- reopen_required
- transfer_to_audit_followup
- cancel_invalid

rules:
- CAPA closure belongs to 17.quality
- audit finding closure belongs to 51.audit
- CAPA closure may notify audit but does not close audit automatically

# ============================================================
# 9. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- audit finding directly closing CAPA
- CAPA closure directly closing audit finding
- CAPA action directly changing stock ledger
- CAPA action directly posting accounting journal
- supplier CAPA directly changing supplier score without procurement workflow
- manufacturing CAPA directly rewriting production actual history
- BI dashboard closing CAPA

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- CAPA lifecycle exact design fixed
- quality/audit remediation boundary fixed
- supplier/manufacturing CAPA boundary fixed
- closure and effectiveness rules fixed

# ============================================================
