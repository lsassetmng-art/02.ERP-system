# ============================================================
# ERP CANONICAL APPROVAL ROUTE MODEL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical approval route model of ERP.

goals:
- define approval route, lane, and actor resolution
- separate approval route from workflow stage
- standardize approval progression rules
- support approval table and API design

# ============================================================
# 1. APPROVAL ROUTE DEFINITION
# ============================================================

approval_route_definition:
Approval route is the formal structure that determines
who may approve, reject, or return an approval item,
in what order, and under what rules.

approval_route_is_not:
- business workflow stage
- permission-only baseline
- governance policy itself

# ============================================================
# 2. CORE COMPONENTS
# ============================================================

canonical_components:
- approval_request
- approval_route
- approval_lane
- approval_actor_resolution
- approval_action
- delegation_rule
- approval_completion_rule

# ============================================================
# 3. ROUTE RULES
# ============================================================

route_rules:
- one approval_request may bind to one active route version
- one route contains one or more lanes
- each lane resolves one or more actors
- progression across lanes follows explicit route rules
- self-approval prohibition may apply
- delegation may alter actor resolution but not route semantics

# ============================================================
# 4. LANE RULES
# ============================================================

lane_rules:
- a lane represents one approval checkpoint
- lane may require single approver or multi-approver logic
- lane completion rules must be explicit
- lane ordering must be explicit
- skipped lanes must be explainable by route logic

# ============================================================
# 5. ACTOR RESOLUTION RULE
# ============================================================

actor_resolution_rule:
Actor resolution should be explicit and reviewable.

possible_resolution_sources:
- direct user assignment
- role-based assignment
- org position-based assignment
- delegated assignment
- fallback assignment under explicit rule

# ============================================================
# 6. ACTION RULES
# ============================================================

canonical_actions:
- approve
- reject
- return

rules:
- approve moves approval forward or completes it
- reject ends the approval path in rejected meaning
- return sends item back for correction/rework

# ============================================================
# 7. ROUTE VS PERMISSION RULE
# ============================================================

route_vs_permission_rule:
Permission defines whether someone is allowed in principle.
Route defines whether that actor is the correct approver in this specific approval instance.

# ============================================================
# 8. ROUTE VS WORKFLOW RULE
# ============================================================

route_vs_workflow_rule:
Workflow may call approval gate stages,
but route/lane truth belongs to approval.

# ============================================================
# 9. ROUTE VS GOVERNANCE RULE
# ============================================================

route_vs_governance_rule:
Approval route handles approval decision flow.
Governance handles policy/exception control.
They may interact but are not the same structure.

# ============================================================
# 10. CANONICAL TABLE PATTERNS
# ============================================================

canonical_table_patterns:
- approval_request
- approval_route
- approval_lane
- approval_actor_resolution
- approval_action
- delegation_rule

# ============================================================
# 11. STATE CONSEQUENCES
# ============================================================

approval_state_consequences:
- under_approval
- approved
- rejected
- returned
- cancelled

note:
Approval state is owned by approval, not by workflow.

# ============================================================
# 12. VALIDATION RULES
# ============================================================

validation_rules:
- every approval request must have route semantics
- route and lane progression must be explicit
- self-approval prohibition must be configurable where needed
- delegation must be recorded, not hidden

# ============================================================
# 13. CONCLUSION
# ============================================================

conclusion:
ERP approval route is the formal structure for approval progression.

This document becomes the formal basis for:
- approval tables
- approval APIs
- route/lane design
- delegation and approver resolution design
