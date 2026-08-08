# ============================================================
# CASH MANAGEMENT INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 34.cash-management

Cash forecast input example:
{
  "source_module": "30.accounting",
  "source_reference_id": "uuid",
  "due_date": "2026-05-31",
  "amount": 132000,
  "currency_code": "JPY"
}
