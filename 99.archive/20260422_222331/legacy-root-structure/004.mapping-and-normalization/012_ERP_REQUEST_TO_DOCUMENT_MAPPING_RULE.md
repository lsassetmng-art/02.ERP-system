# ============================================================
# ERP REQUEST TO DOCUMENT MAPPING RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical rule for how requests map to documents or other target records in ERP.

goals:
- define when a request becomes a document
- define when a request maps to governance or approval records instead
- prevent request/document confusion
- support later table design and API exact payload design

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
A request may map to a document or control record,
but request and target are not automatically the same thing.

mapping_types:
- request -> business document
- request -> approval record
- request -> governance control record
- request -> analytics job record
- request -> no direct persistent target

# ============================================================
# 2. BUSINESS REQUEST MAPPING
# ============================================================

business_request_mapping:
- expense_claim_request -> expense_claim document
- payment_request -> payment_request document
- receipt_report_request -> receipt confirmation/report document
- purchase_request -> purchase_request document
- sales_order_request -> sales_order document
- invoice_generation_request -> invoice draft or generation target record

rule:
Mapped document_id must not imply finalization or approval completion.

# ============================================================
# 3. APPROVAL REQUEST MAPPING
# ============================================================

approval_request_mapping:
- approval request maps to approval_request record
- may reference a target business document
- does not become the business document itself

rule:
approval_request is a control record, not a transaction record.

# ============================================================
# 4. GOVERNANCE REQUEST MAPPING
# ============================================================

governance_request_mapping:
- reopen_request -> governance request record
- cancel_request -> governance request record
- high_risk_operation_request -> governance control record

rule:
Governance request does not directly mutate business truth at mapping time.

# ============================================================
# 5. ANALYTICS REQUEST MAPPING
# ============================================================

analytics_request_mapping:
- forecast_generation_request -> forecast run record
- dashboard_refresh_request -> dashboard refresh job
- ai_analytics_run_request -> analytics run record

# ============================================================
# 6. NO-DIRECT-DOCUMENT CASE
# ============================================================

no_direct_document_case:
Some requests may be accepted without immediately creating a canonical document.

examples:
- bridge exchange request
- background regeneration request
- internal maintenance request

rule:
In such cases, request and target remain distinct or target may be runtime-only.

# ============================================================
# 7. API CONSEQUENCES
# ============================================================

api_rules:
- expose mapped_document_id only when a true mapping exists
- expose mapped_record_type explicitly
- never imply that mapping equals completion

recommended_fields:
- request_status
- mapped_record_id
- mapped_record_type
- resulting_state
- warnings

# ============================================================
# 8. TABLE CONSEQUENCES
# ============================================================

table_rules:
- request table stores request truth
- document table stores document truth
- mapping may be explicit through request_id on target or dedicated mapping table
- approval/governance target records remain in their own modules

# ============================================================
# 9. VALIDATION RULES
# ============================================================

validation_rules:
- every major request family should define target mapping behavior
- request-to-document mapping must be explicit in contracts
- mapped target type must be canonical and not UI-derived

# ============================================================
# 10. CONCLUSION
# ============================================================

conclusion:
Request and document are distinct concepts.

Key rules:
- a request may map to a target record
- mapping must be explicit
- mapping does not imply approval/finalization/completion

This document becomes the formal basis for:
- request/document table design
- intake response design
- target record linkage design
