# ============================================================
# ERP AUTHORITY MATURITY MODEL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the maturity model for ERP authority judgments.

maturity_levels:

  draft:
    meaning:
    - initial structural hypothesis
    requirements:
    - semantic fit exists
    - initial classification exists
    - major ambiguity still expected

  hardened:
    meaning:
    - first-pass evidence materially supports the direction
    requirements:
    - evidence pass exists
    - competing candidates narrowed
    - role classification strengthened

  frozen_candidate:
    meaning:
    - strong enough to be treated as default working truth
    requirements:
    - evidence is consistent
    - dual-write or mirror ambiguity mostly resolved
    - contract and registry implications are known
    - remaining uncertainty is limited

  frozen:
    meaning:
    - stable authority decision suitable for canonical operational reference
    requirements:
    - no stronger competing candidate remains
    - evidence is repeated or independently corroborated
    - operational behavior is sufficiently understood
    - change risk is low

conclusion:
This maturity model separates
early structural interpretation
from truly stable authority decisions.
