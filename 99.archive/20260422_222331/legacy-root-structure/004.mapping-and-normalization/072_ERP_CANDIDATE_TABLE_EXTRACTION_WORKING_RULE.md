# ============================================================
# ERP CANDIDATE TABLE EXTRACTION WORKING RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the common working rule for extracting unresolved family candidates
from the real ERP table inventory.

core_rule:
Candidate extraction is a narrowing step, not a final ownership decision.

working_steps:
1. choose unresolved family
2. define search name patterns
3. define priority schemas
4. extract candidate table names
5. bucket candidates by likely role
6. perform table-level classification next

mandatory_output_per_family:
- search patterns used
- priority schemas used
- extracted candidate tables
- initial bucket grouping
- next classification questions

warning_rule:
Do not treat pattern match alone as proof of ownership.
Pattern match only creates a candidate set.

quality_rule:
Prefer:
- explicit semantic names
- accounting/runtime/document-context names
- family-consistent naming clusters

over:
- isolated vague names with no family context

conclusion:
Candidate extraction is the formal bridge
from unresolved-family review to actual table-level classification.
