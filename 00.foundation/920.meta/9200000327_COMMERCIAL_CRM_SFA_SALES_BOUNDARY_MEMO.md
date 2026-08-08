# ============================================================
# ERP COMMERCIAL / CRM / SFA / SALES BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track C
scope:
- 03.crm
- 02.sfa
- 01.sales
- 04.order-management
- 05.billing
- 06.demand-forecasting
- 52.master-data
- 60.business-intelligence

purpose:
Fix the commercial-side boundary between CRM customer relationship,
SFA lead/opportunity/pipeline, sales quote/price/promotion, accepted order,
billing, demand forecasting signals, master data, and BI projection.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 52.master-data
canonical_role:
- shared customer / business partner identity truth

owns_truth:
- business partner core identity
- customer core identity
- customer master identifier
- customer duplicate / merge / split
- customer common address / reference identity where common
- master publication package

does_not_own:
- CRM relationship state
- SFA opportunity state
- sales quote
- sales price condition
- sales order
- invoice
- demand forecast
- BI dashboard projection

## 1.2 03.crm
canonical_role:
- customer relationship / account / contact / interaction extension truth

owns_truth:
- CRM account profile extension
- contact relationship profile
- customer relationship status
- customer interaction history
- customer preference where relationship-side
- customer segment where CRM-owned
- customer issue / inquiry / case where CRM-side
- CRM-to-SFA lead/opportunity candidate handoff
- CRM customer extension linked to master customer identity

does_not_own:
- shared customer master identity
- SFA opportunity pipeline truth
- sales quote truth
- accepted sales order truth
- invoice truth
- demand forecast truth
- BI projection truth

## 1.3 02.sfa
canonical_role:
- lead / opportunity / sales activity / pipeline truth

owns_truth:
- lead
- lead qualification
- opportunity
- opportunity stage
- sales activity
- pipeline forecast
- opportunity amount/probability
- opportunity-to-quote request basis
- sales forecast signal where SFA-side

does_not_own:
- shared customer master identity
- CRM relationship master profile
- issued quote truth
- accepted sales order truth
- invoice truth
- demand forecast truth
- BI projection truth

## 1.4 01.sales
canonical_role:
- sales quote / price / discount / promotion / commercial pre-order truth

owns_truth:
- sales quote
- quote line
- sales price condition
- discount condition
- promotion condition
- sales commercial terms
- quote approval package
- quote revision
- sales-to-order authorized order basis
- sales promotion signal to demand forecasting

does_not_own:
- CRM relationship truth
- SFA opportunity truth
- accepted sales order truth
- invoice truth
- shared customer identity truth
- demand forecast truth
- BI projection truth

## 1.5 04.order-management
canonical_role:
- accepted customer order / fulfillment orchestration truth

relationship:
- consumes sales-to-order authorized basis from 01.sales
- owns accepted order after intake
- does not own quote or CRM/SFA truth

## 1.6 05.billing
canonical_role:
- invoice / billing truth

relationship:
- consumes order/billing basis according to billing policy
- does not own quote, opportunity, CRM relationship, or delivery truth

## 1.7 06.demand-forecasting
canonical_role:
- market-side demand forecast truth

relationship:
- may consume promotion signal, pipeline signal, opportunity signal, and sales history
- does not own CRM/SFA/sales source truth

## 1.8 60.business-intelligence
canonical_role:
- analytical projection truth only

relationship:
- may visualize CRM/SFA/sales pipeline/quote/order/billing signals
- may not mutate source truth

# ============================================================
# 2. CANONICAL COMMERCIAL FLOW
# ============================================================

canonical_flow:
- 52.master-data
- -> 03.crm
- -> 02.sfa
- -> 01.sales
- -> 04.order-management
- -> 05.billing
- -> 30.accounting
- -> 60.business-intelligence

signal_flow_to_forecast:
- 03.crm / 02.sfa / 01.sales / 04.order-management / 05.billing
- -> 06.demand-forecasting as input signals only

flow_meaning:
- 52 defines shared customer identity.
- 03 manages relationship and interaction.
- 02 manages lead/opportunity/pipeline.
- 01 creates quote, price, discount, promotion, and order basis.
- 04 accepts and orchestrates customer order.
- 05 invoices.
- 06 forecasts demand using approved source signals.
- 60 visualizes only.

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| customer core identity | 52.master-data | shared identity |
| CRM account profile | 03.crm | relationship extension |
| contact relationship | 03.crm | CRM-side contact truth |
| customer interaction | 03.crm | interaction truth |
| lead | 02.sfa | sales funnel truth |
| opportunity | 02.sfa | opportunity/pipeline truth |
| sales activity | 02.sfa | SFA activity truth |
| pipeline forecast signal | 02.sfa | SFA-side signal, not demand forecast truth |
| sales quote | 01.sales | pre-order commercial truth |
| sales price condition | 01.sales | quote/sales commercial truth |
| sales promotion condition | 01.sales | promotion condition truth |
| accepted sales order | 04.order-management | order truth |
| invoice | 05.billing | billing truth |
| demand forecast | 06.demand-forecasting | market-side forecast truth |
| dashboard projection | 60.business-intelligence | projection only |

# ============================================================
# 4. HANDOFF CHAIN
# ============================================================

handoff_chain:
- master_to_crm_customer_reference_publication
- crm_to_sfa_lead_or_opportunity_candidate
- sfa_to_sales_quote_request_basis
- sales_to_order_authorized_order_basis
- sales_to_demand_forecasting_promotion_signal
- sfa_to_demand_forecasting_pipeline_signal
- source_modules_to_bi_snapshot

rules:
- 52 to 03 transfers customer identity/reference, not CRM relationship ownership.
- 03 to 02 transfers candidate/signal, not SFA opportunity ownership.
- 02 to 01 transfers quote request basis, not quote ownership.
- 01 to 04 transfers authorized order basis, not order ownership.
- 01/02/03 may emit forecast input signals, but 06 owns demand forecast truth.
- 60 consumes snapshots only.

# ============================================================
# 5. FORECAST SIGNAL RULE
# ============================================================

forecast_signal_rule:
- CRM/SFA/Sales signals are inputs to demand forecasting.
- Signals do not become forecast truth until 06 processes them.
- Forecast output does not rewrite CRM/SFA/Sales source records.
- Promotion signal may affect forecast scenarios but does not change promotion truth.
- Pipeline signal may inform forecast but does not change opportunity truth.

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM account profile creating shared customer identity without 52 workflow
- SFA lead treated as customer master
- opportunity treated as quote
- quote treated as accepted order without 04 intake
- promotion signal treated as demand forecast truth
- pipeline probability treated as S&OP consensus truth
- billing invoice changing quote price condition directly
- BI dashboard changing CRM/SFA/Sales status
- demand forecast overwriting opportunity amount
- master merge silently rewriting CRM/SFA/Sales history without lineage

# ============================================================
# 7. DECISION TEST
# ============================================================

decision_tests:
- If it is shared customer/business partner identity, 52.master-data owns it.
- If it is relationship/account/contact/interaction, 03.crm owns it.
- If it is lead/opportunity/activity/pipeline, 02.sfa owns it.
- If it is quote/price/discount/promotion/pre-order condition, 01.sales owns it.
- If it is accepted order, 04.order-management owns it.
- If it is invoice, 05.billing owns it.
- If it is forecast, 06.demand-forecasting owns it.
- If it is dashboard projection, 60.business-intelligence owns it.

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- commercial-side boundary fixed
- CRM/SFA/Sales ownership separated
- customer master boundary preserved
- forecast signal boundary fixed
- BI projection boundary preserved

# ============================================================
