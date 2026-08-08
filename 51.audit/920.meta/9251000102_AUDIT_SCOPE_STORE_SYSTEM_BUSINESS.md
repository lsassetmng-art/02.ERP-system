# ============================================================
# AUDIT SCOPE STORE SYSTEM BUSINESS
# ============================================================

status: generated
module: 51.audit
owner: Boss
prepared_by: Zero

scope_split:
  store_audit:
    includes:
      - retail store inspection
      - food service / restaurant store inspection
      - store operation audit
      - cash register operation audit
      - closing procedure review
      - hygiene / operation checklist review where treated as operational audit

  system_audit:
    includes:
      - access control audit
      - operation log audit
      - backup / restore operation review
      - change management audit
      - IT general control review
      - security setting review

  business_audit:
    includes:
      - workflow compliance review
      - approval operation audit
      - posting / document process audit
      - inventory operation audit
      - purchasing / sales / closing procedure audit

boundary_note:
- product quality inspection belongs to 17.quality
- stock quantity truth belongs to 12.inventory and 13.warehouse
- audit finding / remediation / closure belongs to 51.audit
