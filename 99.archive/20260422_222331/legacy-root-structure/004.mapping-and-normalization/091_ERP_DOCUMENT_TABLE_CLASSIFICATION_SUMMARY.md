# ============================================================
# ERP DOCUMENT TABLE CLASSIFICATION SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current first-pass classification
for document-family real tables.

# ============================================================
# 1. MAIN RESULT
# ============================================================

main_result:
The document-family currently looks like:
- domain-specific header truth
- shared support/history/sequence families
- separate approval_request-like mixed request/control families

# ============================================================
# 2. MOST IMPORTANT FINDINGS
# ============================================================

most_important_findings:
- there is no confirmed single universal document master table yet
- domain header tables are the strongest document truth candidates
- sequence/history/file/send tables are mostly support/history
- approval_request-like tables are not general document header truth

# ============================================================
# 3. MAIN UNRESOLVED ISSUE
# ============================================================

main_unresolved_issue:
public.*_header and domain-schema *._header pairs
need duplication/transitional/view-vs-table review.

# ============================================================
# 4. NEXT BEST FOLLOW-UP
# ============================================================

next_best_follow_up:
- compare public.order_header vs sales.order_header
- compare public.purchase_order_header vs purchase.purchase_order_header
- compare public.billing_header vs sales.billing_header
- compare public.return_header vs sales.return_header
- compare public.shipping_header vs sales.shipping_header
- compare core/public document_sequence and status_history pairs

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Document-family classification is now structured enough
to move into direct pairwise comparison of public-vs-domain header families.
