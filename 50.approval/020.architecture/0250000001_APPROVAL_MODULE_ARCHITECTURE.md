# ============================================================
# APPROVAL MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 50.approval

## 1. Logical components
1. Approval Request Service
2. Route Resolution Service
3. Approver Decision Service
4. Delegation / Escalation Service
5. Approval Result Projection Service

## 2. Main aggregates
- approval_request
- approval_route
- approval_step
- approval_decision
- approval_delegation
- approval_result

## 3. Inbound dependencies
From 52.master-data:
- approver identity reference
- org/role reference
- approval policy reference candidates if maintained as master-like rules

From source modules:
- approval-required request payload
- business document summary for display only

## 4. Outbound surfaces
To all gated modules:
- approval result payload
- current approval status projection

To 51.audit:
- approval evidence / route / decision reference

## 5. Rule
Approval never directly changes source business canon.
Source modules consume approval result and apply their own status changes.
