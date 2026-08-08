# ============================================================
# SFA MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 02.sfa
owner: Boss
prepared_by: Zero

## 1. Purpose
The SFA module governs pipeline-oriented sales execution before quote canon
and before operational order execution.
It is the canonical module for lead, account opportunity, sales activity,
pipeline stage, forecasted close expectation, and next-action management.

## 2. Canonical scope
The SFA module owns:
- lead canon
- opportunity canon
- pipeline stage canon
- sales activity canon
- next action canon
- opportunity forecast canon
- opportunity-to-quote request surface
- salesperson work queue projection

## 3. Non-scope
The SFA module does not own:
- quote canon -> 01.sales
- customer relationship canon -> 03.crm
- sales order canon -> 04.order-management
- invoice canon -> 05.billing
- customer master canon -> 52.master-data
- approval decision core -> 50.approval
- accounting canon -> 30.accounting
- shared UI canon -> 00.foundation / CommonOS

## 4. Core business intent
The module must allow a sales organization to:
- register and qualify a lead
- convert a qualified lead into an opportunity
- move an opportunity through pipeline stages
- record meetings, calls, visits, emails, and next actions
- estimate close timing and probability
- request quote creation in Sales when commercial offer work begins

## 5. Canonical lifecycle
Lead
-> Qualified Lead
-> Opportunity Open
-> Opportunity Working
-> Quote Requested
-> Won / Lost / Disqualified / Archived

## 6. Boundary rule
SFA owns selling activity and commercial pursuit progression.
Sales owns the actual quote canon.
CRM owns relationship continuity and customer interaction history beyond pure pipeline operation.

## 7. CommonOS usage
SFA uses shared UI for:
- lead list
- opportunity list
- kanban / pipeline board
- activity list
- search / filter
- offline queue presentation
The business canon remains inside 02.sfa.
