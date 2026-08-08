# ============================================================
# CRM SECURITY AND ACCESS CONTROL
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. Access scopes
- crm.relationship.read
- crm.relationship.write
- crm.interaction.write
- crm.followup.write
- crm.context.read
- crm.admin.correct

## 2. Sensitive surfaces
- personal contact details linked through context
- internal account notes
- risk/health evaluations
- customer timeline details

## 3. Audit requirements
- interaction creation logged
- interaction correction logged
- follow-up reassignment logged
- health/risk adjustment logged
