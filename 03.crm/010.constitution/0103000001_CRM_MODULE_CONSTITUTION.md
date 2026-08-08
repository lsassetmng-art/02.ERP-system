# ============================================================
# CRM MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 03.crm
owner: Boss
prepared_by: Zero

## 1. Purpose
The CRM module governs customer relationship continuity after and around sales pursuit.
It is the canonical module for relationship context, contact history, account profile notes,
engagement health, follow-up continuity, and non-transactional customer interaction records.

## 2. Canonical scope
The CRM module owns:
- customer relationship profile
- relationship status and health canon
- contact interaction history canon
- follow-up plan canon
- account note canon
- customer engagement snapshot
- relationship risk / opportunity note canon
- customer timeline projection canon

## 3. Non-scope
The CRM module does not own:
- lead / opportunity / pipeline canon -> 02.sfa
- quote canon -> 01.sales
- order lifecycle canon -> 04.order-management
- invoice canon -> 05.billing
- customer master legal/base identity canon -> 52.master-data
- approval decision core -> 50.approval
- accounting canon -> 30.accounting
- shared UI canon -> 00.foundation / CommonOS

## 4. Core business intent
The module must allow teams to:
- maintain a durable customer relationship profile
- record customer interactions across channels
- plan and track follow-up continuity
- assess relationship health and risk
- maintain a customer timeline that survives specific deal cycles
- hand over non-canonical contextual references to SFA and Sales for display/use

## 5. Canonical lifecycle
Prospective Relationship
-> Active Relationship
-> Monitored Relationship
-> At Risk / Recovering
-> Stable / Dormant / Closed

## 6. Boundary rule
CRM owns relationship continuity and customer engagement context.
SFA owns active selling pursuit and opportunity canon.
Sales owns quote canon.
Master Data owns customer identity/reference canon.

## 7. CommonOS usage
CRM uses shared UI for:
- customer list
- customer detail
- interaction timeline
- note entry form
- follow-up queue
- search / filter
- offline queue presentation
The business canon remains inside 03.crm.
