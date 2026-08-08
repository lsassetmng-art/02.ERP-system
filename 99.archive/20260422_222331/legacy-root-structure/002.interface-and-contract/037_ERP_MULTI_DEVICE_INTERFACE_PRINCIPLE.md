# ============================================================
# ERP MULTI DEVICE INTERFACE PRINCIPLE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the ERP-wide principle for multi-device usability.

core_rule:
ERP must be usable on:
- PC
- iPhone
- Android
- tablet

meaning:
Device variation changes presentation and interaction patterns,
but must not change source-of-truth semantics.

required_interface_consequences:
- same core contracts must remain valid across supported device classes
- responsive/adaptive UI is allowed
- screen layout may differ by device
- semantic meaning, ownership, and authorization must remain consistent

required_design_consequences:
- dashboard and list/detail patterns should degrade gracefully by device size
- touch-first interaction must be considered for phone/tablet
- keyboard/mouse efficiency must be considered for PC
- authentication and security controls must remain equivalent in policy level

non_goals:
- identical UI layout on all devices
- device-specific hidden business rules
- mobile-only or PC-only semantic divergence

conclusion:
Multi-device support is a canonical ERP interface principle.
Supported device classes are PC, iPhone, Android, and tablet.
