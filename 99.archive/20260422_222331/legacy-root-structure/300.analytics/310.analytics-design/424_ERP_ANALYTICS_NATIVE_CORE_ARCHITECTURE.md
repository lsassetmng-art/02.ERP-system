# ============================================================
# ERP ANALYTICS NATIVE CORE ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for the analytics native core.

main_objects:
- analytics.fact_metric
- analytics.audit_alert_ai_judgement
- analytics.ai_job

role_split:
- analytics.fact_metric:
  - metric/fact analytics anchor
  - native analytics measurement layer

- analytics.audit_alert_ai_judgement:
  - alert/judgement analytics anchor
  - analytical interpretation layer

- analytics.ai_job:
  - analytics-driven job/control bridge
  - analytical decision-to-action bridge layer

main_rule:
The analytics native core should be modeled
as fact/metric, judgement, and analytics-driven bridge architecture,
not as ordinary read-only exposure.

conclusion:
Native analytics core is the clearest analytics-owned subdomain
inside ERP analytics architecture.
