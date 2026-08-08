# ============================================================
# ERP ANALYTICS TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1850
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.truth_map
component: analytics-truth-map


# ANALYTICS TRUTH MAP

Analytics core owns:
- derived analytics dataset/model truth
- metric catalog truth
- analytics view snapshot truth
- insight record truth
- scenario snapshot truth

Adjacent modules own:
- business core = operational source truth
- accounting core = posting and close truth
- management core = review / decision / directive truth
- audit core = audit assurance and conclusion truth
- epm = objective / target / scorecard parent truth

