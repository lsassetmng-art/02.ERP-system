# ============================================================
# SFA INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. API surfaces

### 1.1 Create lead
POST /sfa/leads

request example:
{
  "lead_source": "web_form",
  "person_name": "Taro Sample",
  "organization_name": "Sample Trading",
  "email": "taro@example.com",
  "phone": "+81-90-0000-0000",
  "territory_code": "JP-EAST",
  "assigned_salesperson_id": "uuid"
}

response example:
{
  "sfa_lead_id": "uuid",
  "lead_number": "LD-2026-000001",
  "lead_status": "new"
}

### 1.2 Convert lead to opportunity
POST /sfa/leads/{sfa_lead_id}/convert

response example:
{
  "sfa_lead_id": "uuid",
  "converted_opportunity_id": "uuid",
  "lead_status": "converted",
  "opportunity_number": "OP-2026-000031"
}

### 1.3 Update opportunity stage
POST /sfa/opportunities/{sfa_opportunity_id}/stage

request example:
{
  "stage_to": "propose",
  "change_reason": "proposal preparation started"
}

### 1.4 Record activity
POST /sfa/activities

request example:
{
  "sfa_opportunity_id": "uuid",
  "activity_type": "meeting",
  "activity_channel": "online",
  "subject": "proposal briefing",
  "activity_note": "customer requested formal quote",
  "activity_at": "2026-04-22T14:00:00+09:00"
}

### 1.5 Request quote creation in Sales
POST /sfa/opportunities/{sfa_opportunity_id}/quote-request

response example:
{
  "sfa_quote_request_id": "uuid",
  "quote_request_status": "sent",
  "target_sales_quote_id": null
}

## 2. Quote request payload to Sales
{
  "source_module": "02.sfa",
  "sfa_opportunity_id": "uuid",
  "opportunity_number": "OP-2026-000031",
  "customer_id": "uuid",
  "opportunity_title": "FY26 supply proposal",
  "owner_salesperson_id": "uuid",
  "amount_estimate": 1200000,
  "currency_code": "JPY",
  "expected_close_date": "2026-05-31",
  "context_summary": "customer asked for formal quotation after proposal meeting"
}

## 3. Integration rule
- SFA emits quote request payload
- Sales may accept request and create quote canon
- SFA stores request status and sales quote reference only
- no shared mutable quote object between modules
