# ============================================================
# ERP SCM LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2671
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm.lifecycle_and_statusflow.rule
component: scm-lifecycle-and-statusflow-rule


# NETWORK NODE STATUS SET

- active
- constrained
- inactive
- retired
- archived


# TRANSFER PLAN STATUS SET

- drafted
- planned
- released
- in_transit
- completed
- canceled
- archived


# SUPPLY COMMITMENT COORDINATION STATUS SET

- open
- aligned
- committed
- at_risk
- closed
- archived


# SERVICE-LEVEL EXCEPTION STATUS SET

- open
- acknowledged
- mitigating
- resolved
- dismissed
- archived


# SUPPLY RISK SNAPSHOT STATUS SET

- draft
- published
- superseded
- archived

