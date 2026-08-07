# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V1 NAVIGATION NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains how the frozen authority registry v1
should be navigated inside the ERP freeze-ready flow.

v1_entry_files:
- 230_ERP_FROZEN_AUTHORITY_REGISTRY_V1_OVERVIEW.md
- 231_ERP_FROZEN_AUTHORITY_REGISTRY_V1_RUNTIME_SUPPORT_AND_HISTORY.md
- 232_ERP_FROZEN_AUTHORITY_REGISTRY_V1_HEADERS_AND_PROJECTIONS.md
- 233_ERP_FROZEN_AUTHORITY_REGISTRY_V1_ACCOUNTING_CORE.md
- 234_ERP_FROZEN_AUTHORITY_REGISTRY_V1_DEFERRED_ENTRIES.md
- 235_ERP_FROZEN_AUTHORITY_REGISTRY_V1_SUMMARY.md

role:
The frozen authority registry v1 is the first partial frozen registry layer.
It freezes the stable core while explicitly separating deferred entries.

reading_position:
Read after:
- freeze-ready verification set
- candidate and hold split
- v1 preparation summary

Read before:
- next frozen registry cycle
- deferred-entry re-verification
- later contract freeze updates

conclusion:
Frozen authority registry v1 is the first concrete frozen output layer
after the freeze-ready checkpoint.
