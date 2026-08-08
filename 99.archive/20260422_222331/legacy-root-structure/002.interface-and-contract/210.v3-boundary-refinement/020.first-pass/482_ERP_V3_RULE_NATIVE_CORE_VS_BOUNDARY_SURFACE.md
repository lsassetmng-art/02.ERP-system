# ============================================================
# ERP V3 RULE NATIVE CORE VS BOUNDARY SURFACE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first draft rule
for native core versus boundary surface.

stable_rule_statement:
A native-core object belongs to the internal architectural core
of its domain and carries domain-owned responsibility.
A boundary surface exists at the edge of a domain
to expose, connect, translate, or bridge information
toward another domain or consumer layer.

implications:
- native core should hold domain-owned structural responsibility
- boundary surfaces should be treated as edge layers
- edge usefulness does not promote a boundary surface into native core
- cross-domain confusion should be resolved in favor of native-core ownership

example_direction:
- analytics native tables remain analytics core
- public analytical views remain boundary or exposure surfaces
- cross-domain read models remain edge layers unless explicitly promoted otherwise

conclusion:
Native core and boundary surface must remain distinct
to avoid domain ownership confusion.
