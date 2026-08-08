# ============================================================
# ERP MAINTENANCE MANAGEMENT REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2762
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management.request_response.contracts
component: maintenance-management-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

maintenance_asset_reference write:
- linked_asset_registry_reference_code
- equipment_reference_code
- work_center_reference_code
- asset_class_code
- maintenance_criticality_code
- install_location_reference_code
- service_start_date
- service_end_date

preventive_maintenance_plan_case write:
- linked_maintenance_asset_reference_id
- maintenance_plan_type_code
- maintenance_frequency_code
- next_due_at
- last_completed_at
- required_skill_code
- estimated_duration_hours
- plan_summary_text

maintenance_work_order_case write:
- linked_preventive_maintenance_plan_case_id
- linked_maintenance_asset_reference_id
- work_order_type_code
- priority_code
- scheduled_start_at
- scheduled_end_at
- assigned_team_reference_code
- spare_part_requirement_summary_text

maintenance_execution_case write:
- linked_maintenance_work_order_case_id
- execution_start_at
- execution_end_at
- labor_hours_spent
- spare_part_issue_summary_text
- maintenance_result_code
- execution_summary_text

maintenance_downtime_event_case write:
- linked_maintenance_asset_reference_id
- linked_maintenance_execution_case_id
- linked_work_center_reference_code
- downtime_reason_code
- downtime_start_at
- downtime_end_at
- downtime_duration_minutes
- downtime_summary_text

