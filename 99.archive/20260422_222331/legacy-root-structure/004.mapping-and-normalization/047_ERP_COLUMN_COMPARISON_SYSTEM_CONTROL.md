# ============================================================
# ERP COLUMN COMPARISON SYSTEM CONTROL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the formal comparison target and review questions
for accounting.system_control vs approval.system_control.

comparison_target:
- accounting.system_control
- approval.system_control

primary_question:
Are these:
- duplicated support tables
- schema-local support tables
- transitional copies
- or semantically different tables sharing a name

required_column_review_points:
- primary key shape
- key/value or config structure
- scope fields
- module discriminator fields
- enabled/flag fields
- created_at / updated_at style
- actor/user updater fields
- company/tenant scoping
- uniqueness rules

comparison_judgment_rules:
- if column shape is nearly identical -> duplicate_candidate likely
- if one table is strict superset of another -> transitional or legacy-copy likely
- if structure differs materially -> schema-local support tables more likely

working_expected_outcome:
system_control is more likely support/config duplication
than canonical business or approval truth.

conclusion:
This family should be reviewed by structural similarity first,
semantic scope second.
