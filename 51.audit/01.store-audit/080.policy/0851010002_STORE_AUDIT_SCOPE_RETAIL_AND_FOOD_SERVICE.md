# ============================================================
# STORE AUDIT SCOPE RETAIL AND FOOD SERVICE
# ============================================================

status: draft-exact-design
module: 51.audit / 01.store-audit

scope:
- retail store audit
- food service / restaurant store audit
- store operation checklist review
- register and closing operation review
- local store compliance and operating rule review

boundary:
- quality inspection remains in 17.quality
- inventory truth remains outside store-audit canon
- store audit owns inspection result / finding / remediation truth for store operations
