# ============================================================
# ERP AUDIT ARCHITECTURE
# ============================================================

status: canonical
version: 1.0
layer: platform
component: audit

owner: Boss
prepared_by: Zero

# PURPOSE

Provide immutable audit traceability for all ERP operations.

# AUDIT PRINCIPLES

Append only
Immutable records
Traceable actor
Entity level audit

# AUDIT DOMAINS

User operations
System operations
Approval actions
Security incidents

# CORE TABLES

audit.approval_request
audit.approval_log
audit.ng_event

audit.notification_channel
audit.approval_notify_queue
audit.approval_reason_template
audit.slack_interaction_log

# AUDIT REQUIREMENTS

company_id required
operation timestamp required
actor trace required

# DATA POLICY

Audit records must never be deleted.
