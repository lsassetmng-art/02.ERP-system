# ============================================================
# ERP DESIGN COVERAGE CURRENT STATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains which ERP design areas are already deeply covered
and which areas remain under-covered.

deeply_covered_areas:
- common design
- exact contract base
- reconciliation
- authority registry
- frozen candidate / promotion / freeze-ready flow
- accounting core truth anchors
- runtime family
- header truth / projection split
- settlement and AR/AP first-pass review
- approval truth first-pass review

partially_covered_areas:
- sales business flow
- purchase business flow
- billing operational flow
- governance and ops support
- audit placement around approval and runtime

under_covered_areas:
- inventory business architecture
- manufacturing business architecture
- CRM / customer flow architecture
- audit full architecture
- analytics full architecture
- management full architecture
- domain-by-domain exact payload fixation

conclusion:
ERP design has become deep in authority/reconciliation layers,
but broad domain coverage is not yet complete.
