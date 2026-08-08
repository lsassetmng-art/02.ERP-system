# ============================================================
# ERP BUSINESS DESIGN SCOPE AND BOUNDARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the scope and boundary for ERP business architecture expansion.

inside_business_scope:
- sales
- purchase
- inventory
- manufacturing
- customer-facing business master and document families
- billing-side and invoice-side business flows
- document lifecycle and business state transitions
- cross-domain business handoffs

outside_business_scope:
- audit-domain truth as audit-domain truth
- notification delivery truth
- pure runtime control truth
- export/delivery queue truth
- pure analytics aggregation layers

boundary_questions:
- where business truth ends and audit truth begins
- where business documents end and runtime control begins
- where business states end and projection/view layers begin
- where cross-domain handoff becomes integration boundary

conclusion:
Business design must be modeled as domain architecture,
not as a leftover bucket of operational tables.
