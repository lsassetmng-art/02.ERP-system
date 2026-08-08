# ============================================================
# ERP AUTHORITY NEXT VERIFICATION QUEUE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the next targeted verification queue
for authority hardening.

verification_queue:
1. runtime truth competition verification
2. settlement header/base truth verification
3. AR/AP feeder/base ledger verification
4. approval workflow-vs-system authority verification
5. residual writable-view / unusual sync path verification

expected_output:
- hardened entries promoted to frozen_candidate where justified
- unresolved entries narrowed further
- authority registry draft becomes more stable
- final frozen registry planning becomes feasible

conclusion:
This queue is the shortest path
from current draft registry
to a narrower frozen-candidate registry.
