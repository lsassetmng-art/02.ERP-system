# ============================================================
# COSTING ACCOUNTING / CASH BOUNDARY REINFORCEMENT EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 18.costing
target_module:
- 30.accounting

purpose:
Reinforce that costing sends posting basis to accounting but does not own
cash execution and does not post GL journals directly.

canonical_role:
- cost calculation / cost rollup / variance truth

# ============================================================
# 1. ACCOUNTING HANDOFFS
# ============================================================

handoff_objects:
- costing_to_accounting_production_actual_cost_posting_basis
- costing_to_accounting_production_variance_posting_basis
- costing_to_accounting_scrap_rework_quality_cost_posting_basis
- costing_to_accounting_standard_cost_activation_basis
- costing_to_accounting_cost_correction_basis

rules:
- all handoffs are posting basis only
- 30.accounting owns journal/posting
- 18.costing owns cost amount calculation
- 34.cash-management is not normally direct target of costing

# ============================================================
# 2. STANDARD COST ACTIVATION BASIS
# ============================================================

handoff_object_name:
- costing_to_accounting_standard_cost_activation_basis

required_fields:
- standard_cost_activation_basis_id
- company_id
- source_module
- target_module
- standard_cost_version_id
- item_id
- plant_id_or_costing_area_id
- effective_from
- currency_code
- standard_cost_total
- activation_reason
- posting_or_accounting_effect_required_flag
- posting_basis_status
- created_at
- lineage_reference

allowed_posting_basis_status:
- building
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- cancelled
- superseded

# ============================================================
# 3. COST CORRECTION BASIS
# ============================================================

handoff_object_name:
- costing_to_accounting_cost_correction_basis

required_fields:
- cost_correction_basis_id
- company_id
- source_module
- target_module
- corrected_cost_object_type
- corrected_cost_object_id
- original_cost_reference
- corrected_cost_reference
- correction_reason
- correction_amount_or_delta
- currency_code
- affected_period
- posting_basis_status
- created_at
- lineage_reference

rules:
- cost correction belongs to 18
- accounting correction belongs to 30
- source production/inventory/quality truth is not changed by costing correction unless source module corrects itself

# ============================================================
# 4. CASH BOUNDARY
# ============================================================

cash_boundary:
- Costing does not execute cash payment.
- Costing does not receive bank statements.
- Costing does not reconcile bank transactions.
- If supplier recovery, customer charge, or cash settlement is needed, the route must go through purchase, billing, accounting, or cash management as appropriate.

# ============================================================
# 5. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- cost rollup treated as GL journal
- cost variance treated as bank payment
- costing directly issuing supplier recovery payment
- costing directly reconciling cash
- accounting correction silently changing cost rollup
- BI dashboard changing cost correction basis

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- costing to accounting reinforcement fixed
- costing cash non-ownership fixed
- standard cost activation and correction basis fixed

# ============================================================
