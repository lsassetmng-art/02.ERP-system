# ============================================================
# ERP MANAGEMENT CONTROL SUBDOMAIN JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for the management control subdomain.

current_reading:
- governance.business_rule is the main management-rule anchor
- governance.business_rule_condition and governance.business_rule_action
  are subordinate rule-definition layers
- governance.contract_header is a management/governance-linked contract anchor

operational control side:
- system.operation_log is an operational control trace anchor
- system.runtime_killswitch is an operational intervention anchor
- core.status_history is a cross-cutting status-control history anchor

conclusion:
Management control is currently best modeled
as a combination of governance rule structures and operational control structures.
