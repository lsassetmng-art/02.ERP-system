# ============================================================
# ERP EXACT REQUEST PAYLOAD STANDARD
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the common standard for exact ERP request payloads.

goals:
- standardize request payload structure
- separate request payloads from action results and current states
- make intake, action, and control payloads structurally consistent

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
A request payload must express desired handling only.

request_payload_must_not_directly_claim:
- final business completion
- authoritative resulting state
- guaranteed event completion
- guaranteed downstream external success

# ============================================================
# 2. COMMON REQUEST BLOCKS
# ============================================================

common_request_blocks:
- request_identity_block
- actor_block
- target_block
- business_payload_block
- control_block
- reason_block
- idempotency_block
- metadata_block

# ============================================================
# 3. COMMON REQUEST FIELDS
# ============================================================

common_request_fields:
- request_id optional when caller-generated
- correlation_id optional/requestable
- idempotency_key when needed
- company_id where applicable
- requested_by or actor context by auth boundary
- target_id or target_ref where applicable
- request_reason_code optional
- request_reason_text optional

# ============================================================
# 4. INTAKE REQUEST PAYLOAD RULE
# ============================================================

intake_request_payload_rule:
Business intake payloads should contain:
- target business content
- optional draft metadata
- optional submission intent
- no resulting state claims

examples:
- payment request intake
- purchase request intake
- sales order intake

# ============================================================
# 5. ACTION REQUEST PAYLOAD RULE
# ============================================================

action_request_payload_rule:
Action payloads should contain:
- action intent
- target reference
- required reason fields
- control flags only when canonical
- no resulting state assertions

examples:
- approve payload
- reject payload
- return payload
- retry payload
- close_period payload

# ============================================================
# 6. GOVERNANCE REQUEST PAYLOAD RULE
# ============================================================

governance_request_payload_rule:
Governance request payloads should contain:
- exception intent
- target reference
- justification
- risk/supporting context
- no direct business mutation claims

examples:
- reopen_request
- cancel_request
- high_risk_operation_request

# ============================================================
# 7. FORBIDDEN REQUEST FIELD PATTERNS
# ============================================================

forbidden_patterns:
- completed=true
- final_status=approved
- posted=true
- settled=true
inside request payloads unless the request is explicitly about asserting imported already-happened fact under a different canonical model

# ============================================================
# 8. CONCLUSION
# ============================================================

conclusion:
ERP exact request payloads must express desired handling only.

This document becomes the formal basis for:
- intake payload design
- action payload design
- governance payload design
