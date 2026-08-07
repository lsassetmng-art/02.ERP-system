# ============================================================
# ERP HEADER EVIDENCE ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the first actual header evidence findings
from evidence harvesting outputs.

review_basis:
- .tmp/erp-evidence-from-catalog-and-dumps/502_header_evidence.txt

# ============================================================
# 1. MAIN FINDINGS
# ============================================================

main_findings:
- sales-side and purchase-side header families show strong direct table evidence
- sales/purchase header tables show RLS and company-scoped policies
- sales-side headers show domain FK relationships
- public-side header names appear much less frequently in current harvested evidence

header_quick_counts:
- public.order_header : 26
- sales.order_header : 725
- public.purchase_order_header : 26
- purchase.purchase_order_header : 455
- public.billing_header : 26
- sales.billing_header : 475
- public.return_header : 26
- sales.return_header : 435
- public.shipping_header : 26
- sales.shipping_header : 495

# ============================================================
# 2. STRONGEST CURRENT INTERPRETATION
# ============================================================

sales.order_header:
  working_role:
  - write-authority candidate
  evidence_strength:
  - high
  reasons:
  - much stronger evidence frequency
  - RLS present
  - company policies present
  - domain FK relations present

purchase.purchase_order_header:
  working_role:
  - write-authority candidate
  evidence_strength:
  - high
  reasons:
  - much stronger evidence frequency
  - RLS present
  - company policies present

sales.billing_header:
  working_role:
  - write-authority candidate
  evidence_strength:
  - high
  reasons:
  - strong evidence frequency
  - RLS present
  - company policies present

sales.return_header:
  working_role:
  - write-authority candidate
  evidence_strength:
  - high
  reasons:
  - strong evidence frequency
  - RLS present
  - company policies present
  - FK relations present

sales.shipping_header:
  working_role:
  - write-authority candidate
  evidence_strength:
  - high
  reasons:
  - strong evidence frequency
  - RLS present
  - company policies present
  - FK relation to sales.order_header present

public.*_header family:
  working_role:
  - mirror / projection / transitional candidate
  evidence_strength:
  - medium_to_high
  reasons:
  - very low evidence frequency relative to domain-side tables
  - current harvested evidence strongly favors domain-side operational presence

# ============================================================
# 3. CURRENT FAMILY JUDGMENT
# ============================================================

current_family_judgment:
The first evidence pass strongly reinforces:
- domain-side header tables as write-authority candidates
- public-side header tables as mirror/projection/transitional candidates

# ============================================================
# 4. REMAINING OPEN QUESTION
# ============================================================

remaining_open_question:
The first evidence pass still does not prove whether public-side tables are:
- pure mirrors
- transitional duplicates
- views/projections
- or still active parallel write targets

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Header evidence now materially hardens the provisional decision
toward domain-side write authority and public-side mirror/transitional interpretation.
