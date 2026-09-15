# ERP LOGIN / AUTH EXACT DESIGN

document_status: canonical_exact
canonical_owner: 00.foundation

# 1. Authority

DESIGN_AUTHORITY=02.ERP-system
LOGIN_AUTH_CANONICAL_OWNER=00.foundation

The following are separate canonical concepts:

LOGIN_ACCOUNT != PERSON
LOGIN_ACCOUNT != EMPLOYEE
LOGIN_ACCOUNT != MASTER_DATA_RECORD
LOGIN_ACCOUNT != BUSINESS_PARTNER
LOGIN_ACCOUNT != SERVICE_CLIENT

# 2. Canonical gap resolution

Before this change unit:

- active ERP login UI canonical: absent
- active ERP session canonical: absent
- active Login Account canonical: absent
- current 000.platform implementation-design authority: absent

This change unit establishes the missing logical authority.

Historical/archive 000.platform permission documents are not resurrected
as current authority.

# 3. Core objects

Required logical objects:

- login_account
- company_membership
- role_definition
- permission_definition
- role_permission
- membership_role_assignment
- authenticated_session

# 4. Model uniqueness and assignment invariants

NORMALIZED_LOGIN_IDENTIFIER_UNIQUENESS=REQUIRED

AUTH_PROVIDER_SUBJECT_UNIQUENESS=REQUIRED

Authentication subject uniqueness key:

(authentication_provider_code, authentication_subject_reference)

ACTIVE_COMPANY_MEMBERSHIP_UNIQUENESS=REQUIRED

For the same:

(login_account_id, company_id)

there may be at most one simultaneously effective Company Membership.

HISTORICAL_MEMBERSHIP_SUCCESSOR_ROWS=ALLOWED
OVERLAPPING_EFFECTIVE_MEMBERSHIP=PROHIBITED

System-scope role assignment:

SYSTEM_ROLE_ASSIGNMENT_OBJECT=login_account_role_assignment
SYSTEM_ROLE_TO_LOGIN_ACCOUNT=REQUIRED
SYSTEM_ROLE_TO_COMPANY_MEMBERSHIP=PROHIBITED

Company-scope role assignment:

COMPANY_ROLE_ASSIGNMENT_OBJECT=membership_role_assignment
COMPANY_ROLE_TO_COMPANY_MEMBERSHIP=REQUIRED
COMPANY_ROLE_DIRECT_TO_LOGIN_ACCOUNT=PROHIBITED

# 5. Authentication contract

Authentication establishes:

authenticated_provider_subject
-> ERP Login Account
-> authenticated session

Authentication does not itself grant company-scoped business access.

# 6. Authorization contract

Company-scoped authorization requires all of:

- valid authenticated session
- active Login Account
- valid current company
- active company membership
- applicable active role
- required permission

DEFAULT_AUTHORIZATION=DENY

# 7. Company authority boundary

Authentication/authorization does not own company business identity.

company_membership.company_id references the existing accepted ERP company authority.

COMPANY_MASTER_RELOCATION=OUT_OF_SCOPE

# 8. Current company exact rule

If active company membership count:

- 0 -> business ERP access denied
- 1 -> company may be selected automatically
- >1 -> explicit company selection required

Company selection must be server validated.

# 9. integration.my_company_id()

integration.my_company_id() remains the company-context interface.

Required semantic contract:

- source = trusted authenticated/authorized company context
- client company_id alone = insufficient
- missing valid company context = fail closed for company-scoped access
- function itself is not authentication authority

PHYSICAL_FUNCTION_MUTATION_IN_THIS_CHANGE_UNIT=NO

# 10. Login UI

Required route:

/login

Required states:

- unauthenticated
- authenticating
- authentication_failed
- authenticated_no_company
- company_selection_required
- authenticated_ready
- session_expired
- access_denied
- account_unavailable

PRIMARY_UI=HTML_COMMONOS
MULTILINGUAL=REQUIRED

# 11. Internal API contract

Required logical/internal endpoints:

POST /api/v1/auth/login
POST /api/v1/auth/logout
GET  /api/v1/auth/session
GET  /api/v1/auth/companies
POST /api/v1/auth/company-context

Provider-specific API remains behind the authentication boundary.

# 12. Credential rules

MASTER_DATA_CREDENTIAL_STORAGE=PROHIBITED
BUSINESS_MODULE_CREDENTIAL_STORAGE=PROHIBITED
RAW_PASSWORD_STORAGE=PROHIBITED
RAW_PASSWORD_LOGGING=PROHIBITED
RAW_SESSION_TOKEN_LOGGING=PROHIBITED

Physical authentication provider is not selected here.

PHYSICAL_AUTH_PROVIDER=UNDECIDED
PHYSICAL_AUTH_SCHEMA=UNDECIDED

# 13. Session rules

Session must support:

- issuance
- expiry
- revocation
- logout invalidation
- Login Account binding
- current company context where applicable

Permanent uncontrolled browser sessions are prohibited.

# 14. Offline rules

OFFLINE_NEW_AUTHENTICATION=PROHIBITED
OFFLINE_COMPANY_SWITCH=PROHIBITED
OFFLINE_PRIVILEGE_ELEVATION=PROHIBITED
OFFLINE_ACCOUNT_SECURITY_MUTATION=PROHIBITED

Existing locally queued business writes remain intents only and require
server-side revalidation before authoritative synchronization.

# 15. Human identity boundary

HR Employee truth remains in HR/organization domain.

Login Account may reference Employee but does not replace it.

Employment and login-account lifecycle must not be implicitly collapsed.

# 16. External credential boundary

Bank API credential references, connector credentials, external API clients,
and service accounts are not ERP human Login Accounts.

# 17. Audit exact requirements

Required event classes:

AUTH_LOGIN_SUCCESS
AUTH_LOGIN_FAILURE
AUTH_LOGOUT
AUTH_SESSION_REVOKED
AUTH_ACCOUNT_LOCKED
AUTH_ACCOUNT_SUSPENDED
AUTH_ACCOUNT_DISABLED
AUTH_CREDENTIAL_CHANGED
AUTH_CREDENTIAL_RESET
AUTH_COMPANY_CONTEXT_CHANGED
AUTH_MEMBERSHIP_CHANGED
AUTH_ROLE_CHANGED
AUTH_PERMISSION_CHANGED

Secrets must be excluded from audit payloads.

# 18. Security posture

AUTHORIZATION_DEFAULT=DENY
AUTHORIZATION_ENFORCEMENT=SERVER_SIDE
CLIENT_ROLE_AUTHORITY=PROHIBITED
CLIENT_PERMISSION_AUTHORITY=PROHIBITED
CLIENT_COMPANY_AUTHORITY=PROHIBITED

UI visibility does not constitute authorization.

# 19. Permission and audit ownership exact boundary

COMMON_AUTH_FRAMEWORK_OWNER=00.foundation
COMMON_ROLE_PERMISSION_FRAMEWORK_OWNER=00.foundation
COMMON_AUTHORIZATION_ENFORCEMENT_OWNER=00.foundation

BUSINESS_MODULE_PERMISSION_SEMANTICS_OWNER=SOURCE_MODULE

Source business modules own:

- resource_code meaning
- action_code meaning
- module-specific permission meaning
- mapping from business operation to required permission

Source business modules must consume the common Foundation security framework
and must not redefine login/session/company-membership authority.

SECURITY_OPERATIONAL_SOURCE_TRUTH_OWNER=00.foundation
SECURITY_EVENT_REQUIREMENT_OWNER=00.foundation
SECURITY_EVENT_EMISSION_CONTRACT_OWNER=00.foundation

AUDIT_EVIDENCE_TRUTH_OWNER=51.audit
AUDIT_FINDING_TRUTH_OWNER=51.audit
AUDIT_HISTORICAL_EVIDENCE_OWNER=51.audit

51.audit must not overwrite current authentication/security operational truth.

00.foundation must not establish competing audit-evidence truth.

# 20. Scope exclusions

This canonical design change unit does not:

- choose Supabase Auth or another provider
- create an auth schema
- create DB tables
- migrate credentials
- mutate integration.my_company_id()
- implement /login
- mutate 04
- execute DB changes
- stage
- commit
- push

# 21. Implementation gate

Next implementation sequence:

READ_ONLY existing-state review
-> physical design decision
-> explicit implementation GO
-> 04 implementation
-> explicit DB GO where required
-> authentication acceptance

# 22. P1 gate

P0_MASTER_PHASE=CLOSED

ERP_LOGIN_AUTH_CANONICAL_DESIGN_GATE=OPEN_FOR_ACCEPTANCE_AFTER_REVIEW

P1_PROCUREMENT_QUANTITY_GATE=HOLD_UNTIL_LOGIN_AUTH_IMPLEMENTATION_ACCEPTANCE
