# ============================================================
# SOURCE TO ANALYTICS PROJECTION FLOW
# ============================================================

status: draft-exact-design
module: 60.business-intelligence

## 1. KPI setup flow
1. KPI definition is created
2. source calculation rule summary is defined
3. KPI becomes active for dataset refresh

## 2. Dataset refresh flow
1. refresh run is triggered
2. source references are collected
3. analytical dataset snapshot is created
4. snapshot status becomes ready
5. refresh evidence is stored

## 3. Dashboard publish flow
1. ready snapshot is attached to dashboard view
2. dashboard is reviewed
3. dashboard is published
4. drill-down links are attached or refreshed

## 4. Executive summary flow
1. cross-domain snapshots are selected
2. executive summary projection is generated
3. summary becomes published

## 5. Exception flow
- failed refresh stays historically visible
- broken drill-down links become broken, not silently removed
- superseded snapshots remain historically available
