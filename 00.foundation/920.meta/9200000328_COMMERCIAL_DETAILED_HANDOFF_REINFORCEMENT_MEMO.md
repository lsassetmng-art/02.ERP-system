# ============================================================
# ERP COMMERCIAL DETAILED HANDOFF REINFORCEMENT MEMO
# CRM / SFA / SALES / DEMAND / ORDER / BILLING
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track C
scope:
- 03.crm
- 02.sfa
- 01.sales
- 06.demand-forecasting
- 04.order-management
- 05.billing
- 52.master-data
- 60.business-intelligence

purpose:
Reinforce detailed handoff boundaries from CRM/SFA/Sales to demand forecasting,
order management, and billing so relationship, pipeline, quote, order, invoice,
and forecast truth do not drift.

# ============================================================
# 1. CORE PRINCIPLE
# ============================================================

core_principle:
- 52.master-data owns shared customer / business partner identity.
- 03.crm owns relationship / account / contact / interaction truth.
- 02.sfa owns lead / opportunity / activity / pipeline truth.
- 01.sales owns quote / price / discount / promotion / commercial pre-order truth.
- 06.demand-forecasting owns demand forecast truth.
- 04.order-management owns accepted order / fulfillment orchestration truth.
- 05.billing owns invoice / billing truth.
- 60.business-intelligence owns analytical projection only.

# ============================================================
# 2. DETAILED HANDOFFS COVERED
# ============================================================

handoffs:
- crm_to_sfa_lead_candidate
- crm_to_demand_forecasting_customer_signal
- sfa_to_sales_quote_request_basis
- sfa_to_demand_forecasting_pipeline_signal
- sales_to_demand_forecasting_promotion_signal
- sales_to_order_authorized_order_basis
- order_to_sales_conversion_feedback
- order_to_sfa_win_loss_feedback
- billing_to_sales_invoice_feedback
- billing_to_crm_customer_billing_signal
- source_modules_to_bi_snapshot

# ============================================================
# 3. HANDOFF MEANING
# ============================================================

handoff_meaning:
- CRM-to-SFA candidate is not SFA lead until SFA accepts it.
- SFA-to-Sales quote request is not a quote until Sales accepts it and creates quote.
- Sales-to-Order authorized order basis is not an accepted order until Order Management accepts it.
- CRM/SFA/Sales forecast signals are not demand forecast truth until 06 processes them.
- Billing feedback may update commercial visibility, but it does not rewrite quote/opportunity/CRM truth directly.
- BI snapshots do not mutate source states.

# ============================================================
# 4. OWNERSHIP MATRIX
# ============================================================

| object / meaning | owner_module | note |
|---|---|---|
| CRM account / contact / interaction | 03.crm | relationship truth |
| lead / opportunity / pipeline | 02.sfa | SFA truth |
| quote / price / discount / promotion | 01.sales | commercial pre-order truth |
| demand forecast | 06.demand-forecasting | forecast truth |
| accepted order | 04.order-management | order truth |
| invoice / billing adjustment | 05.billing | billing truth |
| customer identity | 52.master-data | shared identity |
| dashboard / KPI | 60.business-intelligence | projection only |

# ============================================================
# 5. FORECAST SIGNAL RULE
# ============================================================

forecast_signal_rule:
- A signal is source evidence, not forecast truth.
- 06 may accept, reject, weight, transform, or ignore commercial signals.
- 06 must preserve source lineage.
- 06 must not rewrite CRM/SFA/Sales source objects.
- Source modules may receive forecast feedback only as insight, not forced source correction.

# ============================================================
# 6. ORDER / BILLING FEEDBACK RULE
# ============================================================

order_billing_feedback_rule:
- Order conversion feedback may update quote conversion status in 01.sales.
- Order conversion feedback may update opportunity stage in 02.sfa.
- Order conversion feedback may update CRM relationship context in 03.crm.
- Billing feedback may update commercial visibility and customer lifecycle signals.
- Feedback does not rewrite historical quote, opportunity, or interaction records in place.

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM candidate treated as SFA lead without SFA intake
- SFA quote request treated as sales quote without Sales intake
- quote treated as sales order without 04.order-management intake
- CRM/SFA/Sales signal treated as demand forecast truth
- demand forecast rewriting opportunity amount
- invoice rewriting quote price condition
- billing feedback directly changing opportunity won/lost without SFA workflow
- order feedback directly changing CRM interaction history in place
- BI dashboard changing CRM/SFA/Sales/Demand/Order/Billing truth

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- commercial detailed handoff reinforcement fixed
- CRM/SFA/Sales to demand forecasting signal boundaries fixed
- quote-to-order feedback boundaries fixed
- billing feedback boundaries fixed
- BI projection boundary preserved

# ============================================================
