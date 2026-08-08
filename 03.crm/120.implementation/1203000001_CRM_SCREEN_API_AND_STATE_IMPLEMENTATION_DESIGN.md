# ============================================================
# CRM SCREEN API AND STATE IMPLEMENTATION DESIGN
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. Screens
- CrmCustomerListScreen
- CrmCustomerDetailScreen
- CrmInteractionTimelineScreen
- CrmFollowupQueueScreen
- CrmAccountNoteScreen
- CrmRelationshipHealthDashboardScreen
- CrmContextSummaryScreen

## 2. Screen states
- loading
- loaded
- empty
- validation_error
- sync_pending
- overdue_followup
- risk_customer
- dormant_customer

## 3. CommonOS use
- list / detail / form / timeline / dialog / search / filter / queue status
- dense ERP input variant may be used where needed

## 4. API integration points
- create relationship profile
- record interaction
- create/update follow-up
- get context summary
- list / detail / search / dashboard

## 5. Exact frontend modules
- presenter/customer-list
- presenter/customer-detail
- presenter/interaction-timeline
- presenter/followup-queue
- presenter/health-dashboard
- mapper/customer-summary
- bridge/crm-api
- sync/crm-command-queue
