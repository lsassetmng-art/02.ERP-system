# ============================================================
# SALES SECURITY AND ACCESS CONTROL
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. Access scopes
- sales.quote.read
- sales.quote.write
- sales.quote.issue
- sales.quote.acceptance.record
- sales.quote.handoff.execute
- sales.quote.admin.correct

## 2. Segregation of duties
- maker may draft
- reviewer/approver path handled through approval module
- issue permission may be narrower than draft permission
- handoff execution may be restricted

## 3. Sensitive surfaces
- discount information
- customer commercial conditions
- acceptance evidence attachments
- exported quote documents

## 4. Audit requirements
- every status change logged
- revision freeze logged
- acceptance record change logged
- handoff payload hash logged
