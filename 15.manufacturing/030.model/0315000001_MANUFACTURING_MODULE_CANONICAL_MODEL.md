# ============================================================
# MANUFACTURING MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 15.manufacturing

## 1. Canonical entities
- mfg_production_order
- mfg_operation
- mfg_material_issue_request
- mfg_output_declaration
- mfg_scrap_event
- mfg_completion_record

## 2. Key fields
mfg_production_order:
- mfg_production_order_id
- production_order_number
- item_id
- plan_reference_id
- mfg_status
- planned_quantity
- completed_quantity
- scrapped_quantity
- released_at
- completed_at

mfg_operation:
- mfg_operation_id
- mfg_production_order_id
- operation_no
- work_center_id
- operation_status
- setup_time_actual
- run_time_actual
- completed_quantity

## 3. Status canon
- planned
- released
- in_progress
- partially_completed
- completed
- on_hold
- cancelled
- closed

## 4. Invariants
- completed + scrapped must not exceed planned quantity unless authorized overrun exists
- released production order must reference a valid plan/schedule source
- completion remains auditable and append-oriented
