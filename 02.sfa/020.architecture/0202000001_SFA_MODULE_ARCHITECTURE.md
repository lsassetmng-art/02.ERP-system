# ============================================================
# SFA MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. Logical components
1. Lead Management Service
2. Opportunity Pipeline Service
3. Sales Activity Service
4. Forecast Service
5. Quote Request Bridge Service
6. Dashboard / Work Queue Projection Service
7. Search / Filter Projection Service

## 2. Main aggregates
- sfa_lead
- sfa_opportunity
- sfa_opportunity_stage_history
- sfa_activity
- sfa_next_action
- sfa_quote_request

## 3. Inbound dependencies
From 52.master-data:
- customer reference
- contact reference
- salesperson reference
- territory reference
- product / item reference
- competitor reference candidate list

From 03.crm:
- relationship context reference surfaces if needed for display only

From 00.foundation / CommonOS:
- list/detail/form/kanban/search presentation base
- sync presentation base

## 4. Outbound surfaces
To 01.sales:
- quote request payload from opportunity
- opportunity context snapshot for quote preparation

To 03.crm:
- optional activity summary projection only
- no canon sharing

To analytics consumers:
- pipeline aging projection
- win/loss trend projection

## 5. User surfaces
- Lead List
- Lead Detail
- Opportunity List
- Opportunity Kanban Board
- Opportunity Detail
- Activity Timeline
- Next Action Queue
- Forecast Dashboard
- Quote Request Screen

## 6. Architecture rule
- command side updates lead/opportunity/activity canon
- query side serves pipeline board, work queue, dashboard, and timeline
- quote request is payload/event based, not shared mutable canon
- stage movement and forecast updates are audited

## 7. CommonOS boundary
UI shell, kanban/list/table/form/dialog/queue UI use Foundation.
Pipeline progression rules, qualification rules, and quote-request canon remain inside 02.sfa.
