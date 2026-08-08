# ============================================================
# AUDIT MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 51.audit

## 1. Logical components
1. Audit Package Service
2. Control Review Service
3. Finding / Issue Service
4. Remediation Tracking Service
5. Audit Conclusion Service

## 2. Main aggregates
- audit_package
- audit_control_test
- audit_finding
- audit_remediation_request
- audit_conclusion
- audit_evidence_link

## 3. Inbound dependencies
From all modules:
- evidence links / source references
- control review context

From 50.approval:
- approval evidence references

## 4. Outbound surfaces
To source modules:
- remediation request reference only

To reporting:
- finding / closure / control status projections

## 5. Rule
Audit findings do not overwrite source truth.
Source modules address remediation through their own canon changes.
