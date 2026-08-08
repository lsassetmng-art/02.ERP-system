# ============================================================
# ERP V3 BOUNDARY RULE REGISTRY FIRST ENTRIES
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first registry-ready entries
for v3 boundary rules.

first_entries:

  - boundary_id: BR-001
    boundary_family: truth_type_boundaries
    domain_pair: cross-pair
    truth_type_pair: source_truth_vs_derived_surface
    surface_type_pair: source_truth_vs_derived_surface
    stable_rule_statement: >
      A source-truth object remains the canonical ownership layer,
      while a derived surface may expose or summarize it
      without replacing that ownership role.
    linked_objects:
      - sales.order_header
      - purchase.purchase_invoice
      - audit.approval_request
      - public.v_ng_daily_trend
      - public.v_ng_reason_stats
    authority_effect:
      - preserve source ownership
      - prevent derived-surface promotion by convenience only
    maturity: first-pass
    review_status: drafted

  - boundary_id: BR-002
    boundary_family: truth_type_boundaries
    domain_pair: cross-pair
    truth_type_pair: native_core_vs_boundary_surface
    surface_type_pair: native_core_vs_boundary_surface
    stable_rule_statement: >
      A native-core object remains domain-owned structural core,
      while a boundary surface exists at the edge for exposure,
      translation, or bridge use.
    linked_objects:
      - analytics.fact_metric
      - analytics.audit_alert_ai_judgement
      - public.v_ng_event_list
      - public.v_finance_payment_allocation
      - system.v_operation_log_audit
    authority_effect:
      - preserve core ownership
      - keep edge layers from being misread as core
    maturity: first-pass
    review_status: drafted

  - boundary_id: BR-003
    boundary_family: domain_pair_boundaries
    domain_pair: analytics_to_business
    truth_type_pair: transaction_truth_vs_derived_insight
    surface_type_pair: business_anchor_vs_analytics_surface
    stable_rule_statement: >
      Business owns transaction and execution truth,
      while analytics owns derived measurement, trend,
      judgement, and summary responsibility.
    linked_objects:
      - sales.order_header
      - sales.billing_header
      - purchase.purchase_invoice
      - manufacturing.yield_metric
      - analytics.fact_metric
    authority_effect:
      - keep transaction authority on business side
      - keep derived insight ownership on analytics side
    maturity: first-pass
    review_status: drafted

  - boundary_id: BR-004
    boundary_family: domain_pair_boundaries
    domain_pair: analytics_to_management
    truth_type_pair: oversight_control_vs_derived_insight_support
    surface_type_pair: management_anchor_vs_analytics_support_surface
    stable_rule_statement: >
      Management owns supervision, authorization, intervention,
      and oversight responsibility, while analytics owns derived
      insight support that may assist but not replace management control.
    linked_objects:
      - system.role_def
      - system.runtime_killswitch
      - core.company_permission
      - system.operation_log
      - system.v_operation_log_audit
    authority_effect:
      - preserve management intervention ownership
      - keep analytical support distinct from control truth
    maturity: first-pass
    review_status: drafted

conclusion:
The first registry entries are sufficient
to establish the registry as a real operating artifact.
