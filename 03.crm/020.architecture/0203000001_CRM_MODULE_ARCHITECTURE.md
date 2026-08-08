# ============================================================
# CRM MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. Logical components
1. Relationship Profile Service
2. Customer Interaction Service
3. Follow-up Planning Service
4. Engagement Health Service
5. Customer Timeline Projection Service
6. Search / Filter Projection Service
7. Cross-module Context Reference Service

## 2. Main aggregates
- crm_relationship_profile
- crm_interaction
- crm_followup_plan
- crm_account_note
- crm_engagement_snapshot
- crm_timeline_projection_source

## 3. Inbound dependencies
From 52.master-data:
- customer reference
- contact reference
- account owner reference
- territory reference

From 02.sfa:
- optional opportunity reference for timeline display only
- no canon mutation

From 01.sales:
- optional quote reference for contextual display only
- no quote canon ownership

From 00.foundation / CommonOS:
- list/detail/form/timeline/search presentation base
- sync presentation base

## 4. Outbound surfaces
To 02.sfa:
- relationship context display surface
- latest interaction summary
- customer health summary for pursuit context

To 01.sales:
- customer context summary for quote preparation display only

To analytics consumers:
- engagement trend projection
- dormant account detection projection

## 5. User surfaces
- Customer List
- Customer Detail
- Interaction Timeline
- Follow-up Queue
- Account Note Panel
- Relationship Health Dashboard
- Contact Summary View

## 6. Architecture rule
- command side updates relationship and interaction canon
- query side serves timeline, customer detail, dashboard, and work queue
- SFA/Sales may read CRM context surfaces but do not own CRM canon
- timeline is append-oriented, with controlled correction path

## 7. CommonOS boundary
UI shell, list, timeline, form, dialog, queue UI use Foundation.
Relationship health rules, follow-up canon, and interaction canon remain inside 03.crm.
