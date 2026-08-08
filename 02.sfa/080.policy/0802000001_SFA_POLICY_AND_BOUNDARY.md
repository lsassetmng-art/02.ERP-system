# ============================================================
# SFA POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. Boundary policy
- SFA owns selling activity and pursuit progression
- Sales owns quote canon
- CRM owns long-term relationship canon
- Order Management owns operational order canon
- Billing owns invoice canon

## 2. Lead policy
- every lead must have source
- qualification must be explicit before conversion
- disqualified lead keeps reason trace

## 3. Opportunity policy
- stage progression is auditable
- close probability is owned by SFA forecast logic
- won/lost/disqualified are terminal statuses

## 4. Quote-request policy
- SFA can request quote generation
- Sales decides actual quote creation
- SFA never mutates Sales quote canon

## 5. Forecast policy
- forecast is projection based on opportunity canon
- forecast changes do not rewrite historical stage logs
