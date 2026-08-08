# ============================================================
# ERP MANAGEMENT GOVERNANCE CONTROL ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for the governance-control subdomain.

main_objects:
- governance.business_rule
- governance.business_rule_condition
- governance.business_rule_action
- governance.contract_header

role_split:
- governance.business_rule:
  - governance-control anchor
  - rule ownership and management control anchor

- governance.business_rule_condition:
  - subordinate rule-condition layer

- governance.business_rule_action:
  - subordinate rule-action layer

- governance.contract_header:
  - governance-linked contract control anchor

main_rule:
Governance control should be modeled
as rule-definition and contract-control architecture,
not as raw business execution truth.

conclusion:
Governance-control is the clearest policy-and-rule management subdomain
inside ERP management architecture.
