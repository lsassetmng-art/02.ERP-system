# ============================================================
# ERP V3 RULE ANALYTICS VS BUSINESS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first draft rule
for analytics versus business boundary handling.

stable_rule_statement:
Business owns transaction truth, document-chain truth,
execution truth, and business-state truth.
Analytics owns derived measurement, judgement,
trend, summary, and insight-oriented interpretation layers
that are produced from business and other source domains.

implications:
- business truth must not be reclassified as analytics ownership
- analytical outputs must not replace business transaction authority
- business-facing read surfaces with analytical usability
  must still be checked for true ownership role
- analytical convenience does not override business truth

example_direction:
- sales, purchase, inventory, and manufacturing anchors remain business-owned
- analytics fact, judgement, and insight layers remain analytics-owned
- public read surfaces near business remain boundary cases, not automatic analytics truth

conclusion:
Analytics and business must be separated by
transaction truth versus derived insight responsibility.
