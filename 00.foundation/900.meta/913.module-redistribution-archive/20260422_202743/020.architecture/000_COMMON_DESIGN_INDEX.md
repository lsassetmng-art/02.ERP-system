# ============================================================
# COMMON DESIGN INDEX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

folders:
- 001.core-principles
- 002.interface-and-contract
- 003.control-and-workflow
- 004.mapping-and-normalization

root_files:
- 000_COMMON_DESIGN_INDEX.md
- 000_COMMON_DESIGN_OVERVIEW.md
- 124_ERP_DEEP_REVIEW_SET_INDEX.md
- 125_ERP_DEEP_REVIEW_SET_OVERVIEW.md

folder_contents:

  001.core-principles:
    purpose:
    - ERP-wide architectural and semantic principles
    major_files:
    - 000_CORE_PRINCIPLES_INDEX.md
    - 000_CORE_PRINCIPLES_OVERVIEW.md
    - 000_ERP_IDEAL_LAYER_ARCHITECTURE.md
    - 001_ERP_LAYER_RESPONSIBILITY_MAP.md
    - 002_ERP_MODULE_RESPONSIBILITY_MAP.md
    - 003_ERP_TABLE_OWNERSHIP_PRINCIPLE.md
    - 004_ERP_STATE_EVENT_ACTION_REQUEST_OWNERSHIP.md
    - 007_ERP_CANONICAL_STATE_MODEL.md
    - 008_ERP_CANONICAL_EVENT_MODEL.md
    - 009_ERP_CANONICAL_REQUEST_MODEL.md
    - 010_ERP_CANONICAL_ACTION_MODEL.md
    - 011_ERP_REQUEST_STATUS_MODEL.md
    - 012_ERP_GLOBAL_AND_MULTI_DEVICE_PREREQUISITE.md
    - 013_ERP_MULTI_CURRENCY_PRINCIPLE.md
    - 014_ERP_MULTI_LANGUAGE_PRINCIPLE.md

  002.interface-and-contract:
    purpose:
    - ERP interface placement and exact contract standards
    major_files:
    - 000_INTERFACE_AND_CONTRACT_INDEX.md
    - 000_INTERFACE_AND_CONTRACT_OVERVIEW.md
    - shared standards for payload / response / error / acceptance
    - intake exact payload contracts
    - approval and accounting action exact contracts
    - query exact response contracts
    - multi-device interface principle
    - JSON example sets

  003.control-and-workflow:
    purpose:
    - workflow, control, approval, governance, mutation, and state transition rules
    major_files:
    - 000_CONTROL_AND_WORKFLOW_INDEX.md
    - 000_CONTROL_AND_WORKFLOW_OVERVIEW.md
    - action result / action-event / action-state rules
    - mutation authority
    - event registry / publication
    - workflow / approval / governance / accounting closure control
    - canonical state transition matrix

  004.mapping-and-normalization:
    purpose:
    - mapping canonical design to tables, dumps, contracts, and real-table reconciliation
    major_files:
    - 000_MAPPING_AND_NORMALIZATION_INDEX.md
    - 000_MAPPING_AND_NORMALIZATION_OVERVIEW.md
    - module-to-table mapping
    - request-to-document mapping
    - canonical table classification
    - dump-to-canonical mapping
    - contract-to-table linkage
    - deep real-schema / real-table review
    - duplicate / transitional / mirror review
    - runtime and header confirmation review

purpose:
Provides the top-level entry point for the common ERP design documents
that are shared across the whole ERP system.

role:
This index is the root navigation document for ERP common design principles,
contract standards, workflow/control standards, mapping/normalization standards,
and deep real-schema reconciliation work.
