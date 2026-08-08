# ============================================================
# BUSINESS INTELLIGENCE SECURITY AND ACCESS CONTROL
# ============================================================

status: draft-exact-design
module: 60.business-intelligence

## 1. Access scopes
- business_intelligence.read
- business_intelligence.kpi.manage
- business_intelligence.dashboard.publish
- business_intelligence.refresh.execute
- business_intelligence.admin.correct

## 2. Sensitive surfaces
- executive summaries
- cross-domain profitability views
- payroll/HR analytics where permitted
- source-linked drill-down access hints

## 3. Audit requirements
- KPI creation/update logged
- refresh trigger logged
- dashboard publish logged
- broken-link resolution logged
