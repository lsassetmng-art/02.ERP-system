# ============================================================
# MANUFACTURING DOMAIN BOUNDARY ALIGNMENT BUNDLE
# ============================================================

status: generated
scope:
- 15.manufacturing
- 16.production-planning
- 17.quality
- 18.costing
- 19.asset-management

owner: Boss
prepared_by: Zero

## 1. Canonical ownership summary
- 16.production-planning owns demand/supply plan, MRP, CRP, and scheduling plan canon
- 15.manufacturing owns production order and manufacturing execution canon
- 17.quality owns inspection, NCR, CAPA, and quality release canon
- 18.costing owns cost model, rollup, variance, and costing truth
- 19.asset-management owns equipment register, maintenance plan, and utilization canon

## 2. Explicit non-ownership
- Production Planning does not own production execution canon
- Manufacturing does not own cost truth
- Quality does not own accounting/audit truth
- Costing does not own journal truth
- Asset Management does not own fixed-asset accounting truth

## 3. Handoff chain
Planning
-> Manufacturing Order / Schedule Release
-> Manufacturing Execution
-> Quality Hold / Release
-> Cost Capture / Variance
-> Accounting / Fixed Asset / Maintenance reference consumers

## 4. Master data boundary
52.master-data remains canonical for:
- item identity
- BOM reference identity
- routing/work center identity
- machine/equipment reference identity
- inspection reference identity

## 5. Accounting boundary
30.accounting owns journal and financial truth.
33.fixed-assets owns asset accounting canon.
18.costing provides cost truth and accounting reference payloads only.
