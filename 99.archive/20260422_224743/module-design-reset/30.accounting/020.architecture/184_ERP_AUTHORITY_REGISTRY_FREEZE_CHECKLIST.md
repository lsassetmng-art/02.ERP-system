# ============================================================
# ERP AUTHORITY REGISTRY FREEZE CHECKLIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the checklist for deciding whether a registry entry
can move from draft or hardened to frozen_candidate or frozen.

checklist:
- semantic owner stable?
- object type stable? (table / view / support / history)
- write authority identified?
- mirror/projection status identified where relevant?
- competing candidates reviewed?
- evidence pass completed?
- evidence contradicts nothing major?
- contract alignment impact understood?
- residual ambiguity low?
- change risk low?

interpretation:
- if several answers are no -> remain draft
- if most answers are yes but uncertainty remains -> hardened
- if nearly all answers are yes and ambiguity is small -> frozen_candidate
- if all critical answers are yes and conflict risk is low -> frozen

conclusion:
The freeze checklist is the operational gate
for promoting authority registry entries.
