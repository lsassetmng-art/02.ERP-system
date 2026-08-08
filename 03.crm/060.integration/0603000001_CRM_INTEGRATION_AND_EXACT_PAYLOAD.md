# ============================================================
# CRM INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. API surfaces

### 1.1 Create relationship profile
POST /crm/relationships

request example:
{
  "customer_id": "uuid",
  "relationship_owner_id": "uuid",
  "primary_contact_id": "uuid",
  "relationship_status": "active"
}

response example:
{
  "crm_relationship_profile_id": "uuid",
  "customer_id": "uuid",
  "relationship_status": "active",
  "relationship_health": "stable"
}

### 1.2 Record interaction
POST /crm/interactions

request example:
{
  "customer_id": "uuid",
  "contact_id": "uuid",
  "interaction_type": "meeting",
  "interaction_channel": "online",
  "subject": "quarterly check-in",
  "interaction_note": "customer asked for roadmap update",
  "interaction_at": "2026-04-22T15:00:00+09:00"
}

response example:
{
  "crm_interaction_id": "uuid",
  "customer_id": "uuid",
  "interaction_type": "meeting"
}

### 1.3 Create follow-up
POST /crm/followups

request example:
{
  "customer_id": "uuid",
  "plan_title": "share updated roadmap",
  "plan_purpose": "relationship maintenance",
  "due_at": "2026-04-30T18:00:00+09:00",
  "owner_id": "uuid"
}

### 1.4 Relationship context surface for SFA/Sales
GET /crm/customers/{customer_id}/context-summary

response example:
{
  "customer_id": "uuid",
  "relationship_status": "active",
  "relationship_health": "watch",
  "last_interaction_at": "2026-04-22T15:00:00+09:00",
  "next_followup_due_at": "2026-04-30T18:00:00+09:00",
  "risk_flag": false,
  "summary_note": "recent interaction active, follow-up pending"
}

## 2. Integration rule
- CRM exposes relationship context surfaces
- SFA and Sales consume these as read/display context only
- Master Data remains customer identity/reference canon
- no external module mutates CRM relationship canon
