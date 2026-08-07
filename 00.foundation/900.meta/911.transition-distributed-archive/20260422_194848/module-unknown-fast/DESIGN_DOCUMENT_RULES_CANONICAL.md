# ============================================================
# DESIGN DOCUMENT RULES
# Civilization System Canonical Standard
# ============================================================

status: canonical
version: 1.1
scope: global
component: design-document-standard

owner: Boss
prepared_by: Zero


# ============================================================
# PURPOSE
# ============================================================

Define the official rules for all design documents
within the Civilization ecosystem.


# ============================================================
# CORE PRINCIPLES
# ============================================================

Structure over description  
Explicit over implicit  
Deterministic over narrative  
Architecture before implementation  


# ============================================================
# LANGUAGE RULE
# ============================================================

All design documents must be written in English.

Exception:

Bible documents may contain Japanese narrative.


# ============================================================
# FILE NAMING RULE
# ============================================================

All files must follow this format.

NUMBER_NAME_SCOPE.md

Examples:

10_CIVILIZATION_CONSTITUTION.md  
21_EVENT_PIPELINE_ARCHITECTURE.md  
31_EVENT_PIPELINE_RUNTIME.md  
41_EVENT_DISPATCH_FLOW.md  


# ============================================================
# DOCUMENT HEADER RULE
# ============================================================

All design documents must declare a header.

Required header fields:

status
version
compatibility
scope
component
document_id
owner
prepared_by
last_updated


Example header:

status: canonical  
version: 1.0  
compatibility: STRICT  
scope: civilization.runtime.dispatcher  
component: dispatcher-runtime  
document_id: CIV-RUNTIME-032  
owner: Boss  
prepared_by: Zero  
last_updated: 2026-03-10  


# ============================================================
# SECTION ORDER RULE
# ============================================================

Design documents must use the following order.

HEADER  
ABSTRACT  
STRUCTURE  
IMPLEMENTATION  
CONSTRAINTS  


Optional sections may appear between STRUCTURE
and IMPLEMENTATION.


# ============================================================
# DOCUMENT STRUCTURE RULE
# ============================================================

Required sections:

ABSTRACT  
STRUCTURE  
IMPLEMENTATION  
CONSTRAINTS  


Optional sections:

FLOW  
DATA MODEL  
EVENT CONTRACT  
STATE MODEL  
FAILURE MODEL  
SECURITY MODEL  
OBSERVABILITY  
OPERATIONS  
PERFORMANCE  
DEPENDENCIES  
COMPATIBILITY  
CHANGELOG  


# ============================================================
# DESIGN LAYER MODEL
# ============================================================

Civilization uses a ten-layer design structure.


00 Charter  
10 Constitution  
20 Architecture  
30 Runtime  
40 Flow  
50 Model  
60 Operations  
70 Policy  
80 Bible  
90 Meta  


Each document must belong to exactly one layer.


# ============================================================
# LAYER DEPENDENCY RULE
# ============================================================

Design layers must follow strict dependency direction.


Charter
↓
Constitution
↓
Architecture
↓
Runtime
↓
Flow
↓
Model


Operations and Policy may reference
all technical layers.


Bible and Meta are informational layers
and must not define technical behavior.


Reverse dependency is prohibited.


# ============================================================
# FLOW RULE
# ============================================================

Flow documents define execution order.

Flow must describe:

event propagation  
runtime execution order  
system interaction sequence  
state mutation points  
failure propagation order  

Flow must not redefine architecture
or runtime rules.


# ============================================================
# MODEL RULE
# ============================================================

Model documents define structural data models.

Models may define:

schemas  
tables  
objects  
state machines  
relationships  
identifiers  


Models must not define runtime behavior.


# ============================================================
# EVENT CONTRACT RULE
# ============================================================

All cross-system communication must occur through events.

Events must include:

event_id  
event_type  
event_version  
schema_hash  
occurred_at  
payload  


Optional event metadata:

signature  
key_id  
producer_world  
target_world  
trace_id  


Direct cross-system mutation is prohibited.


# ============================================================
# STATE MUTATION RULE
# ============================================================

State mutation must only occur in apply phases.

Producer stages must not mutate target state.

Dispatchers must not mutate domain state.

Consumers must perform deterministic mutation only.


# ============================================================
# TRUST MODEL RULE
# ============================================================

Events crossing trust boundaries must be signed.

Signature verification must occur before apply.

Unsigned events must not be treated as verified.


# ============================================================
# FAILURE MODEL RULE
# ============================================================

Systems must fail closed.

Failure states must be explicit.

Retry must be bounded.

Silent failure is prohibited.


# ============================================================
# OBSERVABILITY RULE
# ============================================================

All runtime operations must produce structured logs.

Trace identifiers must propagate across event execution.

Observability must not mutate runtime state.


# ============================================================
# IMMUTABILITY RULE
# ============================================================

Events must be immutable.

Historical records must not be rewritten.

Corrections must be recorded as new events.


# ============================================================
# SCOPE RULE
# ============================================================

Scope must follow hierarchical format.

system.layer.component

Examples:

civilization.runtime.dispatcher  
civilization.architecture.event-system  
erp.runtime.transaction  


# ============================================================
# COMPONENT RULE
# ============================================================

Component names must describe a system module.

Examples:

event-pipeline  
dispatcher  
persona-state  
inventory  
audit-log  


# ============================================================
# VERSION RULE
# ============================================================

All design documents must declare a version.

Version format:

MAJOR.MINOR


MAJOR

Structural meaning changes.


MINOR

Clarifications or compatible additions.


# ============================================================
# COMPATIBILITY RULE
# ============================================================

Design changes must declare compatibility.

Compatibility categories:

STRICT  
BACKWARD_COMPATIBLE  
FORWARD_COMPATIBLE  
BREAKING  


Breaking changes must include migration instructions.


# ============================================================
# INDEX RULE
# ============================================================

Each layer must include an index file.


CHARTER_INDEX.md  
CONSTITUTION_INDEX.md  
ARCHITECTURE_INDEX.md  
RUNTIME_INDEX.md  
FLOW_INDEX.md  
MODEL_INDEX.md  
OPERATIONS_INDEX.md  
POLICY_INDEX.md  
BIBLE_INDEX.md  
META_INDEX.md  


Index files must describe:

document list  
document purpose  
dependency order  
reading order  


# ============================================================
# CHANGELOG RULE
# ============================================================

Canonical documents should maintain a changelog.

Entries should include:

version  
date  
change summary  


# ============================================================
# FINAL PRINCIPLE
# ============================================================

Design must make the system:

predictable  
auditable  
implementable  
maintainable  
governable  

