# ============================================================
# CRM RELATIONSHIP CONTINUITY FLOW
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. Relationship onboarding flow
1. customer reference is selected
2. CRM relationship profile is created
3. owner/contact context is assigned
4. baseline relationship status is established

## 2. Interaction recording flow
1. user records call / email / meeting / visit / support touchpoint
2. interaction is appended to timeline
3. relationship profile last_interaction_at is refreshed
4. optional follow-up plan is created

## 3. Follow-up continuity flow
1. follow-up is registered with due date and owner
2. queue surfaces show upcoming and overdue actions
3. completion updates plan status
4. overdue plans influence engagement health

## 4. Health monitoring flow
1. recent interaction counts and overdue follow-ups are aggregated
2. relationship health is recalculated/reviewed
3. at-risk customers are surfaced to dashboard
4. recovery actions may be scheduled

## 5. Cross-module context flow
1. CRM timeline may include SFA / Sales references for display context
2. SFA / Sales consume CRM summaries for display
3. no external module rewrites CRM canon

## 6. Exception flow
- mistaken interaction registration -> corrected through audit-safe correction path
- overdue follow-up -> escalated queue
- customer closure -> relationship closed but history preserved
