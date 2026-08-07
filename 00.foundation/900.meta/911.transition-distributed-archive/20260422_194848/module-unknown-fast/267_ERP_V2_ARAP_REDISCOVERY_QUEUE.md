# ============================================================
# ERP V2 ARAP REDISCOVERY QUEUE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rediscovery queue for AR/AP after exact-name gap results.

rediscovery_targets:
- receivable preview/read objects under alternative names
- payable preview/read objects under alternative names
- accrual/open-amount/aging style objects
- feeder tables behind AR/AP read surfaces
- journal-derived vs ledger-native AR/AP candidates

rediscovery_keywords:
- accrual
- receivable
- payable
- aging
- open_amount
- outstanding
- balance
- invoice_balance
- vendor_balance
- customer_balance

current_position:
AR/AP is not blocked by lack of evidence overall.
It is blocked by exact-name instability.

conclusion:
AR/AP should move into semantic rediscovery immediately,
not remain in exact-name lock.
