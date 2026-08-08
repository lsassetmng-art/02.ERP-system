# ============================================================
# ERP DESIGN TRANSITION DISTRIBUTION RULE
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero

purpose:
Distribute transition inbox contents into canonical CivilizationOS-style design layers.

# 1. Scope

Design only:
- ~/02.ERP-system/<nn.module>
- ~/02.ERP-system/<nn.module>/<nn.submodule>

Implementation is not touched.

# 2. Distribution sources

- 900.meta/910.transition-inbox/legacy-root-dirs
- 900.meta/910.transition-inbox/legacy-root-files

# 3. Legacy root dir mapping

- architecture -> 020.architecture
- model -> 030.model
- flow -> 050.flow
- api -> 060.integration
- screen -> 120.implementation
- security -> 100.security
- implementation -> 120.implementation
- frontend -> 130.development/frontend
- backend -> 130.development/backend
- db -> 130.development/db
- test -> 130.development/test
- _commonos -> 130.development/_commonos

# 4. File-name heuristic mapping

Representative examples:
- *architecture* -> 020.architecture
- *model* / *schema* / *ddl* -> 030.model
- *flow* / *workflow* / *stateflow* -> 050.flow
- *api* / *payload* / *contract* -> 060.integration
- *policy* / *rule* -> 080.policy
- *security* / *auth* / *permission* -> 100.security
- *screen* / *ui* / *form* / *implementation* -> 120.implementation
- *development* / *runner* / *migration* / *test* -> 130.development

# 5. Archive and quarantine

Successful distribution archive:
- 900.meta/911.transition-distributed-archive

Conflict or unknown classification quarantine:
- 900.meta/912.transition-unclassified
