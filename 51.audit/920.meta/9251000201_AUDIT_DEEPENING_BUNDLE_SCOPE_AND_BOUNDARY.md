# ============================================================
# AUDIT DEEPENING BUNDLE SCOPE AND BOUNDARY
# ============================================================

status: generated
module: 51.audit
owner: Boss
prepared_by: Zero

canonical_submodules:
- 01.store-audit
- 02.system-audit
- 03.business-audit
- 04.internal-control
- 05.compliance-audit
- 06.remediation-tracking

scope_summary:
  01.store-audit:
    includes:
      - retail store inspection
      - food service / restaurant store inspection
      - store operation audit
      - register / closing procedure audit
      - local operating rule compliance review
  02.system-audit:
    includes:
      - access control audit
      - operation log audit
      - backup / restore review
      - change management audit
      - IT general control review
  03.business-audit:
    includes:
      - workflow audit
      - business procedure audit
      - approval operation audit
      - transaction handling process audit
  04.internal-control:
    includes:
      - control design review
      - control operation review
      - key control evaluation
      - control deficiency assessment
  05.compliance-audit:
    includes:
      - law/regulation compliance review
      - internal rule compliance review
      - labor/privacy/security compliance review
  06.remediation-tracking:
    includes:
      - corrective action registration
      - due-date tracking
      - follow-up review
      - closure judgment

boundary_note:
- product quality inspection belongs to 17.quality
- stock quantity truth belongs to 12.inventory / 13.warehouse
- business canon remains in source modules
- 51.audit owns audit/control/remediation truth
