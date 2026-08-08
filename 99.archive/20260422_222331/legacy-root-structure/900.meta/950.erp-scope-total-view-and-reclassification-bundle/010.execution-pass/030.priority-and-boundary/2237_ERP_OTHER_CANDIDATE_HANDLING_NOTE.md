# ============================================================
# ERP OTHER CANDIDATE HANDLING NOTE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2237
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.other_candidate.handling_note
component: other-candidate-handling-note


# NOTE

When a new candidate appears,
classify it in this order:

1. Is it required for baseline ERP operating truth?
   -> core

2. Is it official ERP-side but tenant-selective?
   -> paid option

3. Is it strongly industry / plant / warehouse dependent?
   -> industry dependent

4. Is it actually a BusinessOS app or other external app?
   -> external linked app boundary

5. If not yet stable:
   -> future extension candidate

