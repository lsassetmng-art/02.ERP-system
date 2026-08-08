# ============================================================
# AUDIT SUBMODULE EXECUTION ORDER
# ============================================================

status: generated
module: 51.audit
owner: Boss
prepared_by: Zero

recommended_use_order:
1. 01.store-audit
2. 02.system-audit
3. 03.business-audit
4. 04.internal-control
5. 05.compliance-audit
6. 06.remediation-tracking

rule:
- audit/review submodules raise findings or control results
- remediation-tracking follows and closes the actions
