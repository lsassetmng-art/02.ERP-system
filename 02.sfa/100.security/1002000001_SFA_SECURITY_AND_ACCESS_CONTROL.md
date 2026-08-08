# ============================================================
# SFA SECURITY AND ACCESS CONTROL
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. Access scopes
- sfa.lead.read
- sfa.lead.write
- sfa.opportunity.read
- sfa.opportunity.write
- sfa.activity.write
- sfa.quote_request.execute
- sfa.forecast.read
- sfa.admin.correct

## 2. Sensitive surfaces
- lead personal information
- forecast and probability data
- lost reason data
- salesperson performance signals

## 3. Audit requirements
- lead conversion logged
- opportunity stage changes logged
- quote request emission logged
- owner reassignment logged
