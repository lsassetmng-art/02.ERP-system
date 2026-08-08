# ============================================================
# ERP OPERATOR KNOWLEDGE BASE PLAYBOOK LIBRARY SAFE AUTOMATION PROFILE OWNERSHIP MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2968
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.operator_knowledge_base_playbook_library_safe_automation_profile.ownership_map
component: operator-knowledge-base-playbook-library-safe-automation-profile-ownership-map


# OWNERSHIP MAP

Runbook / automation boundary owns:
- runbook activation, human gate, execution session, and override truth

Knowledge base / playbook library / safe automation profile owns:
- knowledge article interpretation
- playbook recommendation interpretation
- safe automation eligibility interpretation
- safety constraint interpretation
- profile revision interpretation

Management owns:
- higher-order policy and approval truth

