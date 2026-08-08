# ============================================================
# ERP COLUMN COMPARISON REVIEW RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the common rule for performing table-family column comparison
during canonical alignment review.

core_rule:
Column comparison must answer semantic role questions,
not just structural similarity questions.

mandatory_review_dimensions:
- identity structure
- lifecycle/finality structure
- relationship structure
- scope structure
- actor/audit structure
- specialization structure
- duplication similarity
- canonical ownership implication

review_output_per_table_family:
- compared tables
- major shared columns
- major distinguishing columns
- likely canonical class per table
- likely semantic owner
- duplicate/transitional judgment
- confidence
- next action

confidence_values:
- high
- medium
- low
- unresolved

important_warning:
Do not classify two tables as duplicates merely because names are similar.
Columns must support the duplicate/transitional claim.

recommended_next_actions_after_comparison:
- mark canonical source_of_truth
- mark staging/transitional
- mark duplicate_candidate
- mark support/bridge/history/audit
- escalate unresolved cases

conclusion:
Column comparison is the formal bridge between
schema-level suspicion and table-level classification.
