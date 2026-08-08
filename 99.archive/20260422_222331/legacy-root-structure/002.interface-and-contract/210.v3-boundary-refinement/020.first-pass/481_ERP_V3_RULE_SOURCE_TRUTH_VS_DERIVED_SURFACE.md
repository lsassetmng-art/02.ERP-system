# ============================================================
# ERP V3 RULE SOURCE TRUTH VS DERIVED SURFACE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first draft rule
for source truth versus derived surface.

stable_rule_statement:
A source-truth object is the canonical ownership layer
for a business, audit, management, or analytics-native fact.
A derived surface may expose, summarize, trend, filter,
or reformat that truth, but it must not replace
the source-truth ownership role.

implications:
- derived views must not be treated as canonical ownership anchors
- summaries and trend views must be recognized as downstream surfaces
- exposure convenience does not equal truth ownership
- root navigation and later matrices must preserve this distinction

example_direction:
- source tables remain truth anchors
- public or system views built from them remain derived surfaces
- derived surfaces may be useful, but not promoted as original truth

conclusion:
Source truth and derived surface must remain explicitly separated
throughout ERP design reasoning.
