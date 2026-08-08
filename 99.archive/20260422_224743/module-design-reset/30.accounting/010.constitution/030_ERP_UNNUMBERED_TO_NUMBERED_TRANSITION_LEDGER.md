# ============================================================
# ERP UNNUMBERED TO NUMBERED TRANSITION LEDGER
# ============================================================

status: canonical-inventory
owner: Boss
prepared_by: Zero
purpose:
Inventory unnumbered ERP folders and map them to numbered canonical targets without moving files.

## Roots
- design_root: /data/data/com.termux/files/home/02.ERP-system
- implementation_root: /data/data/com.termux/files/home/04.ERP-development
- numbered_rule_doc: /data/data/com.termux/files/home/02.ERP-system/00.foundation/000_ERP_NUMBERED_FOLDER_CANON.md

## Transition rule
- This ledger is additive only.
- Existing unnumbered folders remain transitional for now.
- New canonical work must target numbered folders.

## Inventory table

| scope | kind | old_path | canonical_target | action | status | note |
|---|---|---|---|---|---|---|
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/.evidence-harvest` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/000.platform` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/001.core-principles` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/002.interface-and-contract` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/003.control-and-workflow` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/004.mapping-and-normalization` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/100.business` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/200.management` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/300.analytics` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/300.audit` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/400.analytics` | `manual_classification_required` | no-target | not in current numbered canon |  |
| design | root-module | `/data/data/com.termux/files/home/02.ERP-system/900.meta` | `manual_classification_required` | no-target | not in current numbered canon |  |

## Status meaning
- ready: numbered target is already defined by canon
- review: likely ERP-related but not yet defined as numbered submodule
- no-target: not included in current numbered module canon

## Next migration order
1. ready
2. review
3. no-target
