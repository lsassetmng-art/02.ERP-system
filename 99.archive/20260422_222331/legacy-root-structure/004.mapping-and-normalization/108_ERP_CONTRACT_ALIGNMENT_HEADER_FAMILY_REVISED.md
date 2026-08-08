# ============================================================
# ERP CONTRACT ALIGNMENT HEADER FAMILY REVISED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides revised contract-to-real-table alignment
for document-header-related contracts after provisional authority decisions.

# ============================================================
# 1. SALES ORDER INTAKE
# ============================================================

contract:
- 023_ERP_EXACT_PAYLOAD_INTAKE_SALES_ORDER.md

semantic_owner:
- 100.business / 110.sales

provisional_direct_write_table:
- sales.order_header

provisional_mirror_or_transitional_table:
- public.order_header

alignment_notes:
- sales.order_header is the current write-authority candidate
- public.order_header is provisionally treated as mirror/transitional
- exact sync/write topology still needs runtime confirmation

# ============================================================
# 2. PURCHASE REQUEST / PURCHASE ORDER SIDE
# ============================================================

contracts:
- 022_ERP_EXACT_PAYLOAD_INTAKE_PURCHASE_REQUEST.md
- purchase-order-adjacent document-facing contracts later

semantic_owner:
- 100.business / 120.purchase

provisional_direct_write_table:
- purchase.purchase_order_header

provisional_mirror_or_transitional_table:
- public.purchase_order_header

alignment_notes:
- purchase.purchase_order_header is the current write-authority candidate
- public.purchase_order_header is provisionally treated as mirror/transitional

# ============================================================
# 3. BILLING / RETURN / SHIPPING SIDE
# ============================================================

contracts:
- billing-adjacent queries and future action/intake contracts
- return/shipping document-facing queries

provisional_direct_write_tables:
- sales.billing_header
- sales.return_header
- sales.shipping_header

provisional_mirror_or_transitional_tables:
- public.billing_header
- public.return_header
- public.shipping_header

alignment_notes:
- domain-side extension fields strengthen domain-side write authority for billing and return
- shipping pair remains structurally identical, but domain-side write authority is still provisionally preferred

# ============================================================
# 4. DOCUMENT LIST / DETAIL / HISTORY CONTRACTS
# ============================================================

contracts:
- 038_ERP_EXACT_QUERY_DOCUMENTS_LIST.md
- 039_ERP_EXACT_QUERY_DOCUMENT_DETAIL.md
- 040_ERP_EXACT_QUERY_DOCUMENT_HISTORY.md

semantic_owner:
- mixed document-facing read surface

provisional_read_targets:
- domain-side header truth tables
- public header mirror/transitional tables where shared reads exist
- history/support tables such as status_history, document_sequence, document_archive, document_send_history

alignment_notes:
- generic document contracts likely resolve through composed read logic
- not through one universal document master table

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Header-family contract alignment is now revised to prefer
domain-side write authority and public-side mirror/transitional interpretation.
