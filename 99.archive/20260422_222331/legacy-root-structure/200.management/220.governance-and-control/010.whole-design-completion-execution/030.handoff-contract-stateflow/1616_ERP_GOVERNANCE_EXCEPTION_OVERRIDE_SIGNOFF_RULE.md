# ============================================================
# ERP GOVERNANCE EXCEPTION OVERRIDE SIGNOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1616
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.exception_override_signoff.rule
component: governance-exception-override-signoff-rule


# RULE

Exception, override, and signoff semantics must remain distinct.

Representative distinctions:
- exception case is not override approval
- override approval is not signoff record
- signoff record is not audit conclusion

# CONSEQUENCE

Every exception-class, override-class, or signoff-class action must preserve:
- original governance object reference
- reason
- actor
- timestamp
- downstream visibility

