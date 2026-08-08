# ============================================================
# ERP SHIFTMANAGER DISABLED AND SUSPENDED SCREEN RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-827
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.disabled_and_suspended_screen.rules
component: shiftmanager-disabled-and-suspended-screen-rules


# OPTION DISABLED SCREEN

Recommended meanings:
- ShiftManager not contracted or not enabled
- rich shift operations unavailable
- ERP core and LaborManager may still continue separately


# OPTION SUSPENDED SCREEN

Recommended meanings:
- ShiftManager contract or usage temporarily blocked
- writes generally unavailable
- reads may be policy-restricted


# RULE

disabled and suspended must not be conflated.

