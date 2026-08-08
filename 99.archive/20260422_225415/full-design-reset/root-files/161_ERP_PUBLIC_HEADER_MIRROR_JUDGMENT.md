# ============================================================
# ERP PUBLIC HEADER MIRROR JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the formal first-pass mirror judgment
for public header families based on evidence results.

# ============================================================
# 1. MAIN JUDGMENT
# ============================================================

main_judgment:
Public header families are now best judged as:
- view-based read surface
- shared exposure layer
- mirror/projection-side family

They are not currently the strongest candidates
for base write authority.

# ============================================================
# 2. WHY THIS JUDGMENT IS NOW STRONGER
# ============================================================

why_this_judgment_is_now_stronger:
- CREATE VIEW evidence exists for the public header family
- view definitions directly reference domain-side tables
- domain-side tables show stronger operational evidence
- public-side direct-write evidence remains weak in the first pass

# ============================================================
# 3. PER-FAMILY FIRST-PASS JUDGMENT
# ============================================================

per_family_first_pass_judgment:
- public.order_header -> view-based read surface
- public.purchase_order_header -> view-based read surface
- public.billing_header -> view-based read surface
- public.return_header -> view-based read surface
- public.shipping_header -> view-based read surface

# ============================================================
# 4. ROLE INTERPRETATION
# ============================================================

role_interpretation:
The public header family is better interpreted as:
- shared read layer
- projection/read exposure
- mirror-like interface surface

rather than:
- active write-authority family

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Public-side mirror/projection judgment is now materially hardened
by direct CREATE VIEW and FROM sales.* evidence.
