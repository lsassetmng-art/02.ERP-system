# ============================================================
# SALES SCREEN API AND STATE IMPLEMENTATION DESIGN
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. Screens
- SalesQuoteListScreen
- SalesQuoteDetailScreen
- SalesQuoteEditScreen
- SalesQuoteRevisionCompareScreen
- SalesQuoteIssueScreen
- SalesQuoteAcceptanceScreen
- SalesQuoteHandoffScreen

## 2. Screen states
- loading
- loaded
- empty
- validation_error
- sync_pending
- handoff_failed
- issue_completed
- accepted

## 3. CommonOS use
- list / table / form / attachment / dialog / queue status / conflict presentation
- dense ERP input variant may be used where needed

## 4. API integration points
- create quote
- update draft
- submit review
- issue
- record acceptance
- handoff request
- list / detail / search

## 5. Exact frontend modules
- presenter/list
- presenter/detail
- presenter/form
- mapper/quote-summary
- mapper/quote-detail
- bridge/sales-api
- sync/quote-command-queue
