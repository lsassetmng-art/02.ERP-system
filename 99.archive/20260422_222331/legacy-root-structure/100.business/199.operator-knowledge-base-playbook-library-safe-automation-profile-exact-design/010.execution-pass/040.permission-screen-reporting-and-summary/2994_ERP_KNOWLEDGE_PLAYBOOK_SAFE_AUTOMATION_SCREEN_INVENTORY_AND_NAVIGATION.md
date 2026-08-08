# ============================================================
# ERP KNOWLEDGE PLAYBOOK SAFE AUTOMATION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2994
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.knowledge_playbook_safe_automation.screen_inventory_and_navigation
component: knowledge-playbook-safe-automation-screen-inventory-and-navigation


# PRIMARY SCREENS

- operator_knowledge_article_viewer_screen
- playbook_library_viewer_screen
- safe_automation_profile_viewer_screen
- playbook_recommendation_queue_screen
- automation_safety_constraint_viewer_screen
- knowledge_playbook_safe_automation_permission_denied_screen

# PRIMARY ENTRY FLOW

knowledge automation entry
-> knowledge / playbook
-> recommendation / profile
-> constraint / audit

