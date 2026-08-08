# ============================================================
# ERP V3 BUSINESS TO AUDIT LINKED OBJECT MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-504
owner: Boss
prepared_by: Zero
last_updated: 2026-04-14
scope: erp.v3.boundary_refinement.business_to_audit.linked_object_matrix
component: business-to-audit-linked-object-matrix


# ABSTRACT

Defines representative linked-object patterns for
the business_to_audit boundary family.

This document deepens the boundary by showing
what business objects remain source truth,
what audit objects exist as historical explanation,
and how mismatch and reconciliation must be handled.


# PRINCIPLE

Business owns operational truth for business objects.

Audit owns traceable historical explanation of
what was done, when, by whom, under which
declared or effective conditions.

Audit must not replace business source truth.

Business must not erase the need for audit evidence.


# PRIMARY RULE

Business source objects remain primary operational
truth.

Audit linked objects exist to explain, verify,
trace, and preserve the execution path.


# BOUNDARY ENTRY 1

boundary_id: ERP-BR-B2A-001
boundary_name: business event to audit evidence alignment

Representative route:
sales_order -> approval/result -> invoice issuance -> audit trace

Business source objects:
- sales_order
- sales_order_line
- pricing_snapshot
- invoice
- invoice_line

Audit linked objects:
- audit_event for order approval
- audit_event for invoice issuance
- audit_evidence reference to rendered document snapshot
- actor / timestamp / action context

Primary truth owner:
- business

Audit role:
- historical explanation and evidence trace

Mismatch signals:
- invoice exists but no audit issuance trace
- audit issuance trace exists without business invoice
- approval path inconsistent with recorded issuer

Expected reconciliation:
- detect missing trace
- attach compensating evidence if business truth is valid
- escalate if invoice execution path cannot be explained


# BOUNDARY ENTRY 2

boundary_id: ERP-BR-B2A-002
boundary_name: business exception to audit escalation alignment

Representative route:
inventory adjustment -> exception reason -> audit escalation trace

Business source objects:
- inventory_adjustment
- stock_count_session
- warehouse_record
- adjustment_reason_code

Audit linked objects:
- audit_event for manual adjustment
- audit_evidence reference to count sheet or override note
- escalation or review note when threshold exceeded

Primary truth owner:
- business

Audit role:
- explain why normal flow was bypassed
- preserve accountability for exception execution

Mismatch signals:
- high-impact adjustment without audit escalation trace
- audit escalation exists but cannot resolve to adjustment object
- adjustment reason too generic for impact level

Expected reconciliation:
- require linked evidence set
- classify whether mismatch is clerical or control failure
- preserve unresolved exception state if explanation is incomplete


# BOUNDARY ENTRY 3

boundary_id: ERP-BR-B2A-003
boundary_name: payment settlement to audit settlement evidence

Representative route:
payment settlement -> bank reference -> audit settlement trace

Business source objects:
- receivable
- payable
- settlement_record
- payment_reference

Audit linked objects:
- audit_event for settlement completion
- audit_evidence reference to bank statement token or settlement proof
- actor / channel / time context

Primary truth owner:
- business for settlement state

Audit role:
- verify traceability of settlement execution path

Mismatch signals:
- settled flag without explainable settlement trace
- audit settlement trace without matching payable/receivable closure
- settlement amount mismatch between business state and evidence context

Expected reconciliation:
- run settlement matching
- preserve amount mismatch as open discrepancy
- prohibit silent overwrite


# BOUNDARY ENTRY 4

boundary_id: ERP-BR-B2A-004
boundary_name: return refund flow to audit exception explanation

Representative route:
return request -> refund approval -> refund execution -> audit exception trace

Business source objects:
- return_request
- refund_decision
- refund_execution
- customer_balance_effect

Audit linked objects:
- audit_event for approval
- audit_event for execution
- audit_evidence reference to refund basis and approver context
- exception note if policy route was bypassed

Primary truth owner:
- business

Audit role:
- preserve why the refund happened and whether route was compliant

Mismatch signals:
- refund executed without approval trace where approval is required
- approval trace references different amount or subject
- policy exception exists but evidence is incomplete

Expected reconciliation:
- compare refund object, approval object, and evidence set
- mark unresolved if amount/authority chain is inconsistent


# BOUNDARY ENTRY 5

boundary_id: ERP-BR-B2A-005
boundary_name: manufacturing completion to audit production explanation

Representative route:
production completion -> consumption/result posting -> audit trace

Business source objects:
- work_order
- material_consumption
- production_result
- scrap_or_loss_record

Audit linked objects:
- audit_event for completion confirmation
- audit_evidence reference to operator or terminal context
- exception trace for abnormal scrap or override

Primary truth owner:
- business

Audit role:
- explain execution path and exception context

Mismatch signals:
- completed production result without completion trace
- abnormal scrap without exception evidence
- timing inconsistency between result and trace

Expected reconciliation:
- compare completion record, actor context, and exception evidence
- preserve discrepancy for review when narrative cannot be reconstructed


# REQUIRED LINKED OBJECT MINIMUM

For a promoted business_to_audit rule,
the minimum linked-object expectation is:

- one business source object set
- one audit event or equivalent trace object
- one actor / time context
- one evidence reference when exception or document-critical flow exists


# CONSTRAINTS

Audit-linked objects must never redefine business truth.

Business source objects must remain authoritative for
current operational state.

Where evidence is incomplete, preserve an exception or
reconciliation-needed state rather than silently passing.

