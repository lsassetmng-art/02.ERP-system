# ============================================================
# MANUFACTURING HANDOFF SEQUENCE BUNDLE
# ============================================================

status: generated
scope:
- manufacturing bundle
prepared_by: Zero

## 1. Sequence
1. Production Planning produces supply/capacity/schedule decisions
2. Manufacturing creates and executes production orders
3. Quality records inspection and release/hold decisions
4. Costing accumulates planned/actual/variance truth
5. Asset Management provides maintenance/utilization context
6. Accounting / Fixed Assets consume reference payloads

## 2. Design rule
Every handoff is payload/event based.
No module directly mutates another module's canon.

## 3. Shared UI rule
CommonOS may unify UI presentation across the bundle, but canon remains per module.
