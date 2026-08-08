# ============================================================
# DEMAND FORECASTING MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting

## 1. Canonical entities

### 1.1 demand_forecast_version
- demand_forecast_version_id
- company_id
- forecast_version_code
- forecast_scope
- forecast_period_from
- forecast_period_to
- baseline_source_type
- version_status
- frozen_at nullable
- sent_to_sop_at nullable
- created_by
- created_at
- updated_by
- updated_at

### 1.2 demand_forecast_line
- demand_forecast_line_id
- demand_forecast_version_id
- item_id
- store_id nullable
- region_id nullable
- channel_id nullable
- period_id
- baseline_quantity
- adjusted_quantity
- forecast_confidence
- forecast_note
- demand_signal_summary

### 1.3 demand_forecast_adjustment
- demand_forecast_adjustment_id
- demand_forecast_line_id
- adjustment_type
- adjustment_reason_code
- adjustment_quantity
- adjustment_note
- adjusted_by
- adjusted_at

### 1.4 demand_forecast_assumption
- demand_forecast_assumption_id
- demand_forecast_version_id
- assumption_type
- assumption_title
- assumption_detail
- effective_period_from
- effective_period_to

### 1.5 demand_promotion_impact
- demand_promotion_impact_id
- demand_forecast_version_id
- promotion_reference_id
- item_id
- store_id nullable
- channel_id nullable
- expected_uplift_quantity
- impact_note

### 1.6 demand_new_product_forecast
- demand_new_product_forecast_id
- demand_forecast_version_id
- item_id
- launch_period_id
- launch_stage
- expected_quantity
- confidence_level
- launch_note

### 1.7 demand_sop_candidate
- demand_sop_candidate_id
- demand_forecast_version_id
- candidate_status
- sent_at nullable
- payload_version
- payload_hash
- last_error_code nullable
- last_error_message nullable

## 2. Status canon

### 2.1 version_status
- baseline
- adjusted
- review_candidate
- frozen_candidate
- sent_to_sop
- superseded
- archived

### 2.2 candidate_status
- pending
- sent
- accepted_by_sop
- failed
- cancelled

## 3. Keys and uniqueness
- forecast_version_code unique per company
- one forecast line per version/item/scope/period combination
- frozen candidate version is immutable except controlled supersession

## 4. Canonical invariants
- frozen candidate cannot be casually edited
- every manual override requires traceable adjustment record
- baseline_quantity and adjusted_quantity must remain historically reproducible
- S&OP candidate payload must be idempotent by payload_hash
