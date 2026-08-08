# ============================================================
# ERP V3 AUDIT-FACING BOUNDARY REGISTRY EXTENSION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides registry-ready extension entries
for audit-facing boundary rules.

extension_entries:

  - boundary_id: BR-005
    boundary_family: domain_pair_boundaries
    domain_pair: business_to_audit
    truth_type_pair: operational_occurrence_vs_evidence_review
    surface_type_pair: business_anchor_vs_audit_evidence_surface
    stable_rule_statement: >
      Business owns transaction and execution truth,
      while audit owns evidence interpretation,
      review traceability, and audit-event recording.
    linked_objects:
      - sales.order_header
      - sales.billing_header
      - purchase.purchase_invoice
      - audit.approval_request
      - audit.audit_event
    authority_effect:
      - preserve business execution ownership
      - preserve audit evidence ownership
    maturity: first-pass
    review_status: drafted

  - boundary_id: BR-006
    boundary_family: domain_pair_boundaries
    domain_pair: management_to_audit
    truth_type_pair: oversight_intervention_vs_evidence_review
    surface_type_pair: management_anchor_vs_audit_evidence_surface
    stable_rule_statement: >
      Management owns supervision, authorization,
      and intervention responsibility,
      while audit owns evidence retention,
      review traceability, and audit-side interpretation.
    linked_objects:
      - system.role_def
      - system.runtime_killswitch
      - core.company_permission
      - audit.approval_log
      - audit.ng_event
    authority_effect:
      - preserve management intervention ownership
      - preserve audit review ownership
    maturity: first-pass
    review_status: drafted

  - boundary_id: BR-007
    boundary_family: truth_type_boundaries
    domain_pair: cross-pair
    truth_type_pair: control_truth_vs_audit_truth
    surface_type_pair: control_anchor_vs_audit_evidence_anchor
    stable_rule_statement: >
      Control truth governs supervision and routing behavior,
      while audit truth preserves reviewable evidence
      about decisions, outcomes, and exceptions.
    linked_objects:
      - system.runtime_killswitch
      - system.role_screen_permission
      - audit.approval_request
      - audit.approval_log
      - audit.exec_audit_event
    authority_effect:
      - prevent control/audit role collapse
      - keep live control distinct from retrospective evidence
    maturity: first-pass
    review_status: drafted

conclusion:
The registry now has enough extension entries
to represent the second-wave audit-facing boundary set.
