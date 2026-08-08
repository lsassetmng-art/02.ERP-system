# ============================================================
# ERP TRACK C COMMERCIAL-SIDE DEEPENING INDEX
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track C
track_name: CRM / SFA / Sales commercial-side deepening
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
Index the commercial-side exact design and detailed handoff documents added
during Track C so ERP design can continue without losing current state.

# ============================================================
# 1. TRACK C POSITION
# ============================================================

track_c_position:
- Track C started after Track B finance-side completion.
- Track C focuses on the customer-facing commercial core:
  - customer relationship
  - CRM account/contact/interaction
  - lead/opportunity/pipeline
  - quote/price/discount/promotion
  - commercial signals to demand forecasting
  - quote-to-order intake and feedback
  - billing commercial feedback
  - customer master boundary

current_state:
- Track C commercial-side exact design bundle created.
- Track C detailed commercial handoff reinforcement created.
- This index records coverage and remaining gaps.

# ============================================================
# 2. TRACK C CREATED DOCUMENTS
# ============================================================

## 2.1 Commercial-side boundary memo

docs:
- 00.foundation/920.meta/9200000327_COMMERCIAL_CRM_SFA_SALES_BOUNDARY_MEMO.md

fixed:
- customer master / CRM / SFA / Sales / Order / Billing / Demand / BI boundary
- commercial source ownership
- forecast signal rule
- CRM/SFA/Sales ownership separation
- forbidden shortcuts

## 2.2 CRM exact design

docs:
- 03.crm/920.meta/9203000001_CRM_CUSTOMER_ACCOUNT_CONTACT_INTERACTION_EXACT_DESIGN.md
- 03.crm/920.meta/9203000002_CRM_TO_SFA_FORECAST_BILLING_FEEDBACK_HANDOFF_EXACT.md

fixed:
- CRM customer master reference intake
- CRM account profile
- CRM contact profile
- account-contact relationship
- relationship status
- customer segment assignment
- customer preference
- CRM interaction
- CRM case / inquiry
- CRM-to-SFA lead candidate
- CRM-to-demand-forecasting customer signal
- billing-to-CRM customer billing signal intake

## 2.3 SFA exact design

docs:
- 02.sfa/920.meta/9202000001_SFA_LEAD_OPPORTUNITY_ACTIVITY_PIPELINE_EXACT_DESIGN.md
- 02.sfa/920.meta/9202000002_SFA_TO_SALES_DEMAND_ORDER_FEEDBACK_HANDOFF_EXACT.md

fixed:
- SFA lead
- lead qualification
- opportunity
- opportunity stage history
- sales activity
- pipeline forecast signal
- SFA-to-sales quote request basis
- SFA-to-demand-forecasting pipeline signal
- sales quote feedback to SFA
- order win/loss feedback to SFA

## 2.4 Sales exact design

docs:
- 01.sales/920.meta/9201000001_SALES_TO_ORDER_MANAGEMENT_BOUNDARY_EXACT.md
- 01.sales/920.meta/9201000002_SALES_PRICE_DISCOUNT_PROMOTION_QUOTE_EXACT_DESIGN.md
- 01.sales/920.meta/9201000003_SALES_TO_DEMAND_ORDER_BILLING_FEEDBACK_HANDOFF_EXACT.md

fixed:
- sales quote request intake
- sales price condition
- sales discount condition
- sales promotion
- sales promotion condition
- sales quote
- sales quote line
- quote revision
- quote approval package
- sales-to-order authorized order basis
- sales-to-demand-forecasting promotion signal
- sales-to-SFA quote feedback
- order/billing feedback to Sales

## 2.5 Commercial signal intake to Demand Forecasting

docs:
- 06.demand-forecasting/920.meta/9206000002_COMMERCIAL_SIGNAL_INTAKE_EXACT_DESIGN.md

fixed:
- CRM/SFA/Sales commercial signal intake
- signal validation / rejection
- signal normalization
- forecast run consumption
- forecast feedback to commercial source modules
- S&OP boundary preservation

## 2.6 Commercial order intake and feedback

docs:
- 04.order-management/920.meta/9204000002_COMMERCIAL_ORDER_INTAKE_AND_FEEDBACK_EXACT.md

fixed:
- sales authorized order basis intake
- order-to-sales conversion feedback
- order-to-SFA win/loss feedback
- order-to-CRM lifecycle feedback
- order-to-billing request boundary reinforcement

## 2.7 Billing commercial feedback

docs:
- 05.billing/920.meta/9205000003_BILLING_COMMERCIAL_FEEDBACK_EXACT.md

fixed:
- billing-to-sales invoice feedback
- billing-to-CRM customer billing signal
- billing-to-order billing status feedback
- invoice truth preservation

## 2.8 Detailed commercial handoff reinforcement

docs:
- 00.foundation/920.meta/9200000328_COMMERCIAL_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md

fixed:
- CRM/SFA/Sales signal/basis/feedback separation
- CRM/SFA/Sales to demand forecasting signal boundary
- quote-to-order feedback boundary
- billing feedback boundary
- BI projection boundary

# ============================================================
# 3. TRACK C FIXED OWNERSHIP SUMMARY
# ============================================================

ownership_summary:
- 52.master-data owns shared customer / business partner identity.
- 03.crm owns customer relationship, account, contact, interaction, case, preference, and relationship-side segment truth.
- 02.sfa owns lead, qualification, opportunity, opportunity stage, sales activity, and pipeline truth.
- 01.sales owns quote, price condition, discount condition, promotion, commercial terms, and pre-order commercial truth.
- 04.order-management owns accepted order and fulfillment orchestration truth.
- 05.billing owns invoice, billing, billing adjustment, and customer charge truth.
- 06.demand-forecasting owns demand forecast truth.
- 60.business-intelligence owns analytical projection only.

# ============================================================
# 4. TRACK C HANDOFF SUMMARY
# ============================================================

handoff_summary:
- 52.master-data -> 03.crm:
  - master_to_crm_customer_reference_publication
- 03.crm -> 02.sfa:
  - crm_to_sfa_lead_candidate
- 03.crm -> 06.demand-forecasting:
  - crm_to_demand_forecasting_customer_signal
- 02.sfa -> 01.sales:
  - sfa_to_sales_quote_request_basis
- 02.sfa -> 06.demand-forecasting:
  - sfa_to_demand_forecasting_pipeline_signal
- 01.sales -> 06.demand-forecasting:
  - sales_to_demand_forecasting_promotion_signal
- 01.sales -> 04.order-management:
  - sales_to_order_authorized_order_basis
- 01.sales -> 02.sfa:
  - sales_to_sfa_quote_feedback
- 04.order-management -> 01.sales:
  - order_to_sales_conversion_feedback
- 04.order-management -> 02.sfa:
  - order_to_sfa_win_loss_feedback
- 04.order-management -> 03.crm:
  - order_to_crm_customer_lifecycle_feedback
- 04.order-management -> 05.billing:
  - order_to_billing_invoice_request
- 05.billing -> 01.sales:
  - billing_to_sales_invoice_feedback
- 05.billing -> 03.crm:
  - billing_to_crm_customer_billing_signal
- 05.billing -> 04.order-management:
  - billing_to_order_billing_status_feedback
- commercial source modules -> 60.business-intelligence:
  - source snapshots / analytical projections only

# ============================================================
# 5. TRACK C GLOBAL FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM account profile creating shared customer identity without 52 workflow
- CRM candidate treated as SFA lead without SFA intake
- CRM interaction directly becoming opportunity
- SFA lead treated as customer master
- SFA opportunity treated as sales quote
- SFA quote request treated as quote
- quote treated as accepted order without 04.order-management intake
- promotion signal treated as demand forecast truth
- SFA pipeline probability treated as S&OP consensus truth
- demand forecast rewriting opportunity amount or promotion definition
- invoice rewriting quote price condition
- billing feedback directly changing opportunity stage without SFA workflow
- order feedback directly changing CRM relationship without CRM workflow
- BI dashboard changing CRM / SFA / Sales / Demand / Order / Billing truth

# ============================================================
# 6. TRACK C COMPLETION STATE
# ============================================================

completion_state:
- Track C commercial-side exact design indexed.
- CRM / SFA / Sales ownership fixed.
- Customer master boundary preserved.
- Commercial signal intake to demand forecasting fixed.
- Quote-to-order and order feedback boundaries fixed.
- Billing commercial feedback boundary fixed.
- BI projection boundary preserved.
- Track C can be treated as complete for boundary/exact-design layer.

# ============================================================
