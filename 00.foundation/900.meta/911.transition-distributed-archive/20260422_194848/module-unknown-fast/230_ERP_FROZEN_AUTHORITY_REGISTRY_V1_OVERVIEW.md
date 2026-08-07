# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V1 OVERVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the role of the first frozen authority registry v1 draft.

summary:
Frozen authority registry v1 is the first narrowed registry
containing only entries that are strong enough
to be treated as frozen in the current phase.

included_scope:
- accounting core entries already strong enough to freeze
- runtime support/history entries already strong enough to freeze
- header truth families already strong enough to freeze
- public header projection/view families already strong enough to freeze

excluded_scope:
- unresolved runtime truth competition
- unresolved settlement base/header truth
- unresolved AR/AP base ledger truth
- unresolved approval workflow-vs-system final authority

conclusion:
Frozen authority registry v1 is intentionally partial.
It freezes the strong stable core first,
while deferring unresolved authority competitions.
