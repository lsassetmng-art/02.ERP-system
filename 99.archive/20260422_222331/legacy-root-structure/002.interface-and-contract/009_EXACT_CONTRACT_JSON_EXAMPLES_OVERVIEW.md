# ============================================================
# EXACT CONTRACT JSON EXAMPLES OVERVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains the role of the ERP exact contract JSON example set.

summary:
This document set provides concrete JSON request and response examples
for major ERP endpoints.

It complements:
- abstract contract placement rules
- payload naming standards
- response field standards
- action/query/request semantic rules

main_use_cases:
- checking concrete request payload shape
- checking concrete response payload shape
- comparing request scope vs action scope vs state scope
- reviewing how warnings/errors are exposed
- reviewing multi-currency and localization-aware examples

sections:

  intake_examples:
    meaning:
    - JSON examples for business intake endpoints
    examples:
    - expense claim intake
    - payment request intake

  approval_examples:
    meaning:
    - JSON examples for approval action endpoints
    examples:
    - approve
    - reject
    - return

  accounting_and_runtime_examples:
    meaning:
    - JSON examples for accounting and runtime actions
    examples:
    - settlement create
    - period close
    - period reopen-request
    - execution retry related examples when added

  query_examples:
    meaning:
    - JSON examples for read-only endpoints
    examples:
    - AR detail
    - dashboard control tower
    - documents list/detail/history
    - journals list/detail
    - periods list

important_rules:
- examples are canonical illustrations, not implementation-only mockups
- response examples must keep scope explicit
- action_result is not the same as resulting state
- request acceptance is not the same as business completion
- dashboard summaries are not source-of-truth replacements
- localized display fields are display support only
- currency_code must be explicit where money meaning exists

recommended_reading_order:
- first read exact payload/response standards
- then read this overview
- then open the specific JSON example file you need
- then cross-check ownership with contract ownership docs if needed

related_files:
- 009_EXACT_CONTRACT_JSON_EXAMPLES_INDEX.md
- 014_ERP_EXACT_PAYLOAD_NAMING_STANDARD.md
- 015_ERP_EXACT_RESPONSE_FIELD_STANDARD.md
- 016_ERP_EXACT_REQUEST_PAYLOAD_STANDARD.md
- 017_ERP_EXACT_QUERY_RESPONSE_STANDARD.md
- 018_ERP_EXACT_ACTION_RESPONSE_STANDARD.md
- 019_ERP_EXACT_ERROR_RESPONSE_STANDARD.md

conclusion:
The JSON example set is the concrete practical layer
of the ERP exact contract design pack.

Use it when a reviewer or implementer needs
an explicit payload/response image rather than only abstract rules.
