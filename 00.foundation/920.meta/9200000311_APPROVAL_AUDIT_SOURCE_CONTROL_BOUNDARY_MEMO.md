# ============================================================
# ERP APPROVAL / AUDIT / SOURCE MODULE CONTROL BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 50.approval
- 51.audit
- all ERP source modules
- 60.business-intelligence
- 12.common-os

purpose:
Fix the cross-module boundary for approval, audit, internal control,
remediation, and source business modules so that approval and audit evidence
support business workflows without absorbing source business canon.

# ============================================================
# 1. CANONICAL PRINCIPLE
# ============================================================

core_principle:
- Source modules own business truth.
- 50.approval owns approval workflow truth.
- 51.audit owns audit finding / audit evidence / audit closure truth.
- 51.audit/06.remediation-tracking owns corrective action lifecycle truth.
- 60.business-intelligence owns analytical projection truth only.
- CommonOS owns shared presentation only.

meaning:
- Approval can permit, reject, return, or evidence a business action.
- Approval does not by itself become the business action.
- Audit can identify findings and require remediation.
- Audit does not directly mutate source business records.
- Remediation can track correction lifecycle.
- Actual correction must occur in the source module workflow.

# ============================================================
# 2. MODULE POSITIONS
# ============================================================

## 2.1 50.approval
canonical_role:
- approval route / approval decision / approval evidence truth

owns_truth:
- approval request
- approval route
- approver assignment
- approval step
- approval delegation
- approval decision
- approval comment
- rejection / return / escalation decision
- approval evidence package
- approval SLA / overdue state
- approval policy execution result

does_not_own:
- source business record
- source transaction finalization
- accounting journal
- payroll run
- purchase order
- sales order
- inventory ledger
- audit finding
- remediation action lifecycle
- BI dashboard projection

## 2.2 51.audit
canonical_role:
- audit plan / audit evidence / finding / closure truth

owns_truth:
- audit plan
- audit program
- audit scope
- audit procedure
- audit evidence
- audit finding
- audit severity
- audit recommendation
- audit closure decision
- audit report
- remediation tracking lifecycle where under 06.remediation-tracking

does_not_own:
- source business transaction truth
- approval workflow decision truth
- accounting journal correction truth
- inventory adjustment truth
- payroll correction truth
- purchase/order/billing correction truth
- BI dashboard projection truth

## 2.3 Source modules
canonical_role:
- business canon / transaction / master / close / execution truth

owns_truth_examples:
- 01.sales owns sales quote truth
- 04.order-management owns sales order truth
- 05.billing owns invoice truth
- 10.purchase owns purchase order truth
- 12.inventory owns stock ledger truth
- 13.warehouse owns warehouse operation truth
- 14.logistics owns delivery truth
- 30.accounting owns GL journal and statutory close truth
- 31.management-accounting owns managerial close truth
- 40.human-resources owns HR master truth
- 41.labor-management owns attendance / shift truth
- 42.payroll owns payroll calculation truth

relationship:
- source modules may require approval before commit/freeze/release
- source modules may receive audit findings/remediation requests
- source modules perform actual business correction through their own workflow

## 2.4 60.business-intelligence
canonical_role:
- analytical projection truth only

relationship:
- BI may show approval status, audit findings, remediation status, and source metrics
- BI may not approve, audit-close, or mutate source records

## 2.5 CommonOS
canonical_role:
- shared UI / shell / queue presentation / dense variant presentation

relationship:
- CommonOS may render approval queues, audit queues, remediation queues, and source correction queues
- CommonOS does not own approval meaning, audit meaning, or source business canon

# ============================================================
# 3. CANONICAL CROSS-FLOW
# ============================================================

approval_flow:
- source module creates approval request
- -> 50.approval executes route / decision
- -> source module receives decision
- -> source module commits / rejects / returns / freezes / releases according to source workflow

audit_flow:
- 51.audit plans audit / collects evidence
- -> 51.audit records finding
- -> 51.audit or 51.audit/06.remediation-tracking opens corrective action lifecycle
- -> source module performs correction if required
- -> 51.audit reviews evidence and closes / reopens finding or remediation

BI_flow:
- source modules / approval / audit
- -> BI dataset snapshot
- -> dashboard / executive summary
- -> drill-down back to source modules

rules:
- 50 is not a source transaction owner
- 51 is not a source transaction owner
- 60 is not a source transaction owner
- source module retains final business-state authority

# ============================================================
# 4. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| approval route definition | 50.approval | approval workflow truth |
| approval request | 50.approval | request/route evidence |
| approval decision | 50.approval | approve/reject/return/delegate/escalate |
| source record draft | source module | business draft truth |
| source record commit/freeze/release | source module | business state transition truth |
| audit plan | 51.audit | audit planning truth |
| audit evidence | 51.audit | audit evidence truth |
| audit finding | 51.audit | original finding truth |
| corrective action lifecycle | 51.audit/06.remediation-tracking | remediation lifecycle truth |
| actual business correction | source module | correction execution truth |
| audit closure | 51.audit | finding/remediation closure review |
| dashboard | 60.business-intelligence | analytical projection |
| approval/audit queue UI | CommonOS allowed | presentation only |

# ============================================================
# 5. APPROVAL BOUNDARY RULES
# ============================================================

approval_boundary_rules:
- Approval result may authorize a source module transition.
- Source module must still perform the transition.
- Approval does not directly create accounting journal, purchase order, invoice, stock ledger, payroll run, or close package.
- Approval request must reference source object and proposed action.
- Approval decision must be preserved even if source module later cancels or supersedes the source object.
- Re-approval may be required when source object materially changes.

approval_decision_effects:
- approved = source module may proceed if source validation still passes
- rejected = source module must not proceed with that proposed action
- returned = source module must revise or cancel
- escalated = approval route changes but source truth remains unchanged
- delegated = approver responsibility changes but source truth remains unchanged

# ============================================================
# 6. AUDIT BOUNDARY RULES
# ============================================================

audit_boundary_rules:
- Audit may inspect source modules.
- Audit may record findings.
- Audit may require remediation.
- Audit may review remediation evidence.
- Audit may close or reopen findings.
- Audit may not directly edit source business canon.
- Audit may not bypass source module correction workflow.

finding_rules:
- original finding truth belongs to 51.audit
- finding severity and recommendation belong to 51.audit
- source module response belongs to source module or remediation workflow depending on object
- closure decision belongs to 51.audit

remediation_rules:
- remediation-tracking owns corrective action lifecycle
- remediation-tracking does not own original finding truth
- remediation-tracking does not directly execute source business correction
- source module executes actual correction
- closure requires evidence reference and audit review where required

# ============================================================
# 7. SOURCE MODULE RESPONSIBILITY
# ============================================================

source_module_responsibility:
- validate proposed action
- submit approval request when required
- apply approved action if still valid
- reject stale approval if source data changed materially
- execute correction requested by remediation
- preserve lineage from approval/audit/remediation
- notify approval/audit/remediation of outcome

source_module_must_not:
- fabricate approval decision
- hide required approval
- mark audit finding closed without audit closure workflow
- apply remediation without source correction evidence when required
- treat dashboard projection as approval/audit source truth

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- approval decision directly creating source transaction without source module commit
- approval record treated as business record itself
- audit finding directly changing source module record
- remediation action directly changing stock ledger / GL / payroll / invoice / PO without source workflow
- BI dashboard approving source action
- CommonOS queue state treated as business status
- source module committing action without required approval reference
- source module closing audit finding by itself
- approval route changing audit finding severity
- audit finding changing approval decision in place
- remediation-tracking owning original finding truth
- audit closure treated as accounting close / payroll close / inventory close

# ============================================================
# 9. DECISION TEST
# ============================================================

decision_tests:
- If it answers "who approved, rejected, returned, delegated, or escalated?" -> 50.approval
- If it answers "what finding was identified and what evidence supports it?" -> 51.audit
- If it answers "what corrective action lifecycle is open / due / closed?" -> 51.audit/06.remediation-tracking
- If it answers "what business record changed?" -> source module
- If it answers "how is it visualized?" -> 60.business-intelligence
- If it answers "how is the queue presented?" -> CommonOS presentation

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- approval / audit / source module boundary fixed
- approval decision vs source commit separated
- audit finding vs source correction separated
- remediation lifecycle vs original finding separated
- BI and CommonOS projection/presentation boundaries preserved

# ============================================================
