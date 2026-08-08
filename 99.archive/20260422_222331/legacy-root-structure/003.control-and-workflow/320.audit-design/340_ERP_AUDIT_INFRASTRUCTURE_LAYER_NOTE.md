# ============================================================
# ERP AUDIT INFRASTRUCTURE LAYER NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains the role of shared audit infrastructure
outside the audit schema itself.

current_reading:
- core.trg_audit_iud() is a broad mutation-capture mechanism
- core.fn_audit_trail() is a broad audit-trail generation mechanism
- core.audit_trail* tables form a cross-cutting storage layer
- core.audit_impact_rule and core.audit_column_weight look like supporting audit-rule infrastructure

interpretation:
These objects are not the same as audit domain truth objects.
They are cross-cutting infrastructure supporting audit capture and storage.

conclusion:
Audit design must distinguish:
- audit domain objects
from
- cross-cutting audit infrastructure.
