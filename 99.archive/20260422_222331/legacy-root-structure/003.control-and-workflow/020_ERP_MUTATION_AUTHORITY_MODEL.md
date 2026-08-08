# ============================================================
# ERP MUTATION AUTHORITY MODEL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines who is allowed to mutate what in ERP, at the semantic module level.

goals:
- define mutation authority by module and concept
- prevent unauthorized cross-module mutation
- support API design, state transitions, and table ownership

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Only the owning module of a semantic source-of-truth
may hold formal mutation authority over that truth.

mutation_authority_is_not_defined_by:
- UI screen location
- current service convenience
- dump history
- cache ownership

mutation_authority_is_defined_by:
- source-of-truth ownership
- semantic accountability
- lifecycle authority
- control authority where applicable

# ============================================================
# 2. AUTHORITY BY LAYER
# ============================================================

platform_authority:
- shared primitives
- workflow support state
- event infrastructure
- integration runtime support
- audit evidence structures

business_authority:
- transactional truth
- document lifecycle truth
- accounting truth
- inventory truth
- finance transaction truth

management_authority:
- approval truth
- governance/control truth
- exception handling truth
- reporting truth

analytics_authority:
- KPI/BI/dashboard/forecast analytical outputs only

# ============================================================
# 3. AUTHORITY EXAMPLES
# ============================================================

authority_examples:

  document_lifecycle_state:
    owner: business/foundation boundary
    allowed_mutators:
    - business progression actions
    - controlled workflow under business authority

  approval_status:
    owner: management/approval
    allowed_mutators:
    - approve
    - reject
    - return
    - approval cancellation controls

  governance_review_state:
    owner: management/governance
    allowed_mutators:
    - governance accept/reject/escalate/withdraw actions

  execution_status:
    owner: platform runtime-related ownership
    allowed_mutators:
    - runtime actions
    - retry controls
    - execution engine

  journal_status:
    owner: business/accounting
    allowed_mutators:
    - accounting posting/reversal controls

  settlement_status:
    owner: business/accounting
    allowed_mutators:
    - settlement creation/reversal controls

  period_status:
    owner: business/accounting
    governance_checks:
    - high-risk controls may gate mutation
    allowed_mutators:
    - authorized accounting close/reopen actions only

# ============================================================
# 4. GATED AUTHORITY RULE
# ============================================================

gated_authority_rule:
An owning module may still require approval or governance gates
before exercising its mutation authority.

examples:
- accounting owns period_status but governance may gate reopen/close
- business owns document lifecycle but approval may gate finalize progression
- runtime owns execution status but governance may gate high-risk retry

rule:
Gating does not transfer ownership.
Gating constrains exercise of authority.

# ============================================================
# 5. FORBIDDEN MUTATION PATTERNS
# ============================================================

forbidden_patterns:
- analytics mutating business source-of-truth directly
- dashboard cache mutating approval status
- approval module mutating accounting journal_status directly
- governance request object directly mutating business cancelled/open without proper accepted execution flow
- interface registry mutating business truth directly

# ============================================================
# 6. TABLE CONSEQUENCES
# ============================================================

table_rules:
- table owner and mutation authority should normally align
- if mutation is gated, owner still remains owner
- support/cache/projection tables must not gain hidden mutation authority over source-of-truth tables

# ============================================================
# 7. API CONSEQUENCES
# ============================================================

api_rules:
- action endpoints must be aligned with mutation authority
- queries must never imply mutation authority
- approval/governance endpoints must not silently mutate foreign truth beyond declared scope
- resulting state mutations must be declared per owning module

# ============================================================
# 8. VALIDATION RULES
# ============================================================

validation_rules:
- every stateful concept must have one owning mutation authority
- every high-risk mutation should declare gates
- non-owning mutations are invalid unless through formal owner-mediated mechanism
- exact contracts should identify mutation owner clearly

# ============================================================
# 9. CONCLUSION
# ============================================================

conclusion:
ERP mutation authority must follow semantic ownership.

Key rules:
- owner mutates
- non-owner does not directly mutate
- approval/governance may gate, but do not automatically own foreign truth
- analytics never mutates transactional truth

This document becomes the formal basis for:
- authorization-aware mutation design
- state transition enforcement
- action contract ownership
