# ============================================================
# COMMON DESIGN SET NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines how users and future design documents should navigate
the ERP common design set.

goals:
- define entry order
- define reading order by task type
- reduce navigation confusion
- make the common design set usable as a practical reference

# ============================================================
# 1. ENTRY POINTS
# ============================================================

primary_entry_points:
- 000_COMMON_DESIGN_INDEX.md
- 000_COMMON_DESIGN_OVERVIEW.md

secondary_entry_points:
- 001.core-principles/000_CORE_PRINCIPLES_INDEX.md
- 002.interface-and-contract/000_INTERFACE_AND_CONTRACT_INDEX.md
- 003.control-and-workflow/000_CONTROL_AND_WORKFLOW_INDEX.md
- 004.mapping-and-normalization/000_MAPPING_AND_NORMALIZATION_INDEX.md

# ============================================================
# 2. DEFAULT READING ORDER
# ============================================================

default_reading_order:
1. 000_COMMON_DESIGN_OVERVIEW.md
2. 001.core-principles/000_CORE_PRINCIPLES_OVERVIEW.md
3. 001.core-principles key canonical models
4. 002.interface-and-contract overview and standards
5. 003.control-and-workflow overview and standards
6. 004.mapping-and-normalization overview and standards

# ============================================================
# 3. TASK-BASED READING ORDER
# ============================================================

## 3.1 If designing a new API contract

read_in_order:
- 000_COMMON_DESIGN_OVERVIEW.md
- 001.core-principles/004_ERP_STATE_EVENT_ACTION_REQUEST_OWNERSHIP.md
- 002.interface-and-contract/005_ERP_INTERFACE_CONTRACT_PLACEMENT_RULE.md
- 002.interface-and-contract/014_ERP_EXACT_PAYLOAD_NAMING_STANDARD.md
- 002.interface-and-contract/015_ERP_EXACT_RESPONSE_FIELD_STANDARD.md
- 004.mapping-and-normalization/017_ERP_CONTRACT_TO_OWNING_TABLE_MATRIX.md

## 3.2 If reviewing table ownership

read_in_order:
- 000_COMMON_DESIGN_OVERVIEW.md
- 001.core-principles/003_ERP_TABLE_OWNERSHIP_PRINCIPLE.md
- 004.mapping-and-normalization/006_ERP_MODULE_TO_TABLE_MAPPING.md
- 004.mapping-and-normalization/014_ERP_CANONICAL_TABLE_CLASSIFICATION.md
- 004.mapping-and-normalization/015_ERP_DUMP_TO_CANONICAL_TABLE_MAPPING.md

## 3.3 If designing workflow / approval / governance

read_in_order:
- 000_COMMON_DESIGN_OVERVIEW.md
- 003.control-and-workflow/025_ERP_CANONICAL_WORKFLOW_MODEL.md
- 003.control-and-workflow/026_ERP_CANONICAL_APPROVAL_ROUTE_MODEL.md
- 003.control-and-workflow/027_ERP_CANONICAL_GOVERNANCE_EXCEPTION_MODEL.md
- 003.control-and-workflow/028_ERP_CANONICAL_ACCOUNTING_CLOSURE_CONTROL_MODEL.md
- 003.control-and-workflow/029_ERP_CANONICAL_STATE_TRANSITION_MATRIX.md

## 3.4 If reviewing exact payload semantics

read_in_order:
- 001.core-principles/007_ERP_CANONICAL_STATE_MODEL.md
- 001.core-principles/008_ERP_CANONICAL_EVENT_MODEL.md
- 001.core-principles/009_ERP_CANONICAL_REQUEST_MODEL.md
- 001.core-principles/010_ERP_CANONICAL_ACTION_MODEL.md
- 002.interface-and-contract/014_ERP_EXACT_PAYLOAD_NAMING_STANDARD.md
- 002.interface-and-contract/015_ERP_EXACT_RESPONSE_FIELD_STANDARD.md

# ============================================================
# 4. FOLDER NAVIGATION RULE
# ============================================================

folder_navigation_rule:
Each common design folder should always have:
- one index
- one overview
- categorized canonical documents beneath them

rule:
Future additions should preserve this navigation pattern.

# ============================================================
# 5. LINKING RULE
# ============================================================

linking_rule:
When a new shared canonical document is added:
- it should be added to the proper folder index
- the folder overview should remain conceptually accurate
- root common design index should still remain a valid entry point

# ============================================================
# 6. ROOT NAVIGATION RULE
# ============================================================

root_navigation_rule:
The common design set should be discoverable from:
- ERP_SYSTEM_MASTER_INDEX.md
- DESIGN_MASTER_INDEX.md

It should not require users to guess the folder structure manually.

# ============================================================
# 7. MAINTENANCE RULE
# ============================================================

maintenance_rule:
When moving or renaming common design files:
- update folder index
- update root common design index
- preserve stable navigation path as much as possible

# ============================================================
# 8. CONCLUSION
# ============================================================

conclusion:
The ERP common design set must be navigable by:
- root entry
- folder entry
- task-based reading order

This rule becomes the formal basis for:
- shared design discoverability
- future common design maintenance
- practical use of the ERP common design pack
