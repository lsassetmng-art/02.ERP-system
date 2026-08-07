# ============================================================
# ERP FOLDER BOUNDARY AND TRANSITION RULE
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero

# Naming rule
- use numbered lowercase kebab-case
- root format:
  - nn.module
- submodule format:
  - nn.submodule

# Canonical examples
- 01.sales
- 16.production-planning
- 16.production-planning/01.mrp
- 41.labor-management/04.overtime

# Transition rule
- keep existing unnumbered folders as transitional only
- do not treat unnumbered folders as new canonical targets
- new design and implementation work must target numbered folders

# ERP implementation root
- ~/04.ERP-development

# ERP design root
- ~/02.ERP-system

# CommonOS provider
- ~/03.civilization-development/12.common-os

# ERP CommonOS consumer rule
- each numbered module or submodule may have _commonos
