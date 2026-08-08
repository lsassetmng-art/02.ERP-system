# ============================================================
# ERP SYSTEM FOLDER STRUCTURE
# ============================================================

status: canonical
layer: architecture
component: erp-system-structure

owner: Boss
prepared_by: Zero


# ============================================================
# PURPOSE
# ============================================================

Define the canonical module structure of the ERP System.


# ============================================================
# ROOT STRUCTURE
# ============================================================

ERP-system

000.platform
100.business
200.management
300.analytics


# ============================================================
# PLATFORM LAYER
# ============================================================

000.platform

010.foundation
020.security
030.identity
040.permission
050.event
060.data
070.integration
080.workflow
090.audit
095.interface


# ============================================================
# BUSINESS LAYER
# ============================================================

100.business

110.sales
120.purchase
130.inventory
140.accounting
150.finance
160.hr
170.project
180.production
190.crm
195.asset
196.quality
197.legal


# ============================================================
# MANAGEMENT LAYER
# ============================================================

200.management

210.strategy
220.planning
230.performance
240.compliance
250.risk
260.governance
270.approval
280.ai-support
290.reporting


# ============================================================
# ANALYTICS LAYER
# ============================================================

300.analytics

310.kpi
320.bi
330.dashboard
340.forecast
350.ai-analytics


# ============================================================
# DEPENDENCY ORDER
# ============================================================

platform
   ↓
business
   ↓
management
   ↓
analytics


# ============================================================
# RULES
# ============================================================

Modules may only depend on lower layers.

analytics → management → business → platform

# ============================================================
# COMMON DESIGN SET FOLDERS
# ============================================================

COMMON DESIGN SET FOLDERS
At root level, the following shared canonical ERP design folders exist:

- 001.core-principles
- 002.interface-and-contract
- 003.control-and-workflow
- 004.mapping-and-normalization

These are shared design folders, not business domain folders.
They hold ERP-wide common rules and canonical standards.

