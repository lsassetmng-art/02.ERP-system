# ============================================================
# CRM POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. Boundary policy
- CRM owns relationship continuity and interaction canon
- SFA owns pursuit / opportunity canon
- Sales owns quote canon
- Master Data owns customer identity canon

## 2. Interaction policy
- every interaction must bind to customer_id
- interaction history is append-oriented
- correction must preserve auditability

## 3. Follow-up policy
- every open follow-up requires owner and due date
- overdue state is explicit in operational surfaces
- completed follow-up remains historically visible

## 4. Relationship-health policy
- health may use derived signals
- severe negative signals require risk surfacing
- health history should remain reviewable

## 5. Context-sharing policy
- CRM summaries may be exposed cross-module
- cross-module consumers treat CRM output as read-only context
