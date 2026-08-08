# ============================================================
# ERP V3 RULE ANALYTICS VS MANAGEMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first draft rule
for analytics versus management boundary handling.

stable_rule_statement:
Management owns supervision, authorization,
intervention, role control, and oversight responsibility.
Analytics owns measurement, trend, summary,
judgement support, and insight-oriented derived interpretation.
Analytical outputs may support management,
but support does not transfer management ownership.

implications:
- management control objects remain management-owned
- analytics views near management remain analytical support layers
- operational analytical views must not be confused
  with direct management control truth
- intervention authority remains management-side unless explicitly redefined

example_direction:
- role/permission/control/intervention layers remain management-owned
- analytical summaries over those layers remain analytics or boundary surfaces
- support for decisions does not equal ownership of decisions

conclusion:
Analytics and management must be separated by
oversight/intervention responsibility versus derived insight support.
