# ============================================================
# HUMAN RESOURCES HANDOFF SEQUENCE BUNDLE
# ============================================================

status: generated
scope:
- human resources bundle
prepared_by: Zero

## 1. Sequence
1. Human Resources manages employment and assignment lifecycle
2. Labor Management captures attendance / shift / leave / overtime / work records
3. Payroll consumes approved payroll basis and produces payroll result canon
4. Payroll emits accounting reference payloads
5. Accounting creates journal truth separately

## 2. Shared UI rule
CommonOS may unify UI presentation across the bundle, but canon remains per module.

## 3. Control rule
Payroll result must be reproducible from payroll basis and approved labor references.
