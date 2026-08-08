# ============================================================
# ERP APPROVAL ENGINE ARCHITECTURE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
document_id: ERP-CORE-081

owner: Boss
prepared_by: Zero
last_updated: 2026-03-10

scope: erp.core.approval
component: approval-engine


# ABSTRACT

Defines ERP approval engine.


# STRUCTURE

approval_flow_def
↓
approval_step_def
↓
approval_request


# IMPLEMENTATION

Tables

system.approval_flow_def  
system.approval_step_def  
system.approval_request  


# CONSTRAINTS

Execution must not bypass approval.
