# ============================================================
# ERP UNCOVERED DOMAIN PRIORITY QUEUE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Prioritizes the next under-covered ERP design domains.

priority_queue:

  highest_priority:
  - sales business design full pass
  - audit architecture full pass

  high_priority:
  - purchase business design full pass
  - management / governance consolidation pass

  medium_priority:
  - inventory design full pass
  - billing operational design pass
  - analytics architecture pass

  later_priority:
  - manufacturing deep business pass
  - CRM / customer architecture pass

why_this_order:
- sales and audit have broad downstream impact
- purchase and governance affect major control boundaries
- inventory / billing / analytics need dedicated coverage but can follow
- manufacturing / CRM can be expanded after core business-control coverage improves

conclusion:
The next design expansion should not be random.
It should follow this priority queue.
