# ============================================================
# CASH MANAGEMENT MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 34.cash-management

Entities:
- cash_bank_account_position
- cash_forecast_snapshot
- cash_transfer_plan
- cash_payment_execution
- cash_bank_reconciliation_reference

Invariant:
- cash position snapshots remain traceable to bank and accounting references
