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

PHYSICAL_AUTH_PROVIDER=SUPABASE_AUTH
PHYSICAL_AUTH_SCHEMA=security

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

# 23. Human company role taxonomy

ROLE_TAXONOMY_CANONICAL_EXTENSION=DEFINED

HUMAN_COMPANY_ROLE_ASSIGNMENT_CARDINALITY=MANY

ROLE_SCOPE_VALUES=system,company

ROLE_CATEGORY_VALUES=administrative,business,approval,audit,system,service

ROLE_MODULE_ASSOCIATION=module_code_or_null

COMMON_COMPANY_ROLE_CODES=
COMPANY_SYSTEM_ADMIN,COMPANY_ADMIN,COMPANY_STAFF

COMPANY_SYSTEM_ADMIN_SCOPE=company
COMPANY_SYSTEM_ADMIN_CATEGORY=administrative

COMPANY_ADMIN_SCOPE=company
COMPANY_ADMIN_CATEGORY=administrative

COMPANY_STAFF_SCOPE=company
COMPANY_STAFF_MODULE_PRIVILEGE=NONE_BY_DEFAULT

MODULE_SPECIFIC_ROLE_OWNER=SOURCE_MODULE
MODULE_PERMISSION_SEMANTICS_OWNER=SOURCE_MODULE

MULTIPLE_MODULE_ROLES_PER_MEMBERSHIP=ALLOWED
BUSINESS_AND_APPROVAL_ROLE_COMBINATION=ALLOWED
DUPLICATE_OVERLAPPING_ROLE_ASSIGNMENT=PROHIBITED

ROLE_NAME_ALONE_IS_PERMISSION_AUTHORITY=NO

# 24. AI Worker and Service Identity

AI_WORKER_SERVICE_IDENTITY_CANONICAL_EXTENSION=DEFINED

AI_WORKER_AUTHENTICATION=REQUIRED
AI_WORKER_HUMAN_LOGIN=PROHIBITED
AI_WORKER_HUMAN_SESSION_REUSE=PROHIBITED

SERVICE_IDENTITY_MODEL=REQUIRED
SERVICE_CREDENTIAL_MODEL=REQUIRED
SERVICE_COMPANY_ACCESS_MODEL=REQUIRED
SERVICE_ROLE_ASSIGNMENT_MODEL=REQUIRED

SERVICE_COMPANY_ACCESS=EXPLICIT_ONLY
SERVICE_AUTHORIZATION=LEAST_PRIVILEGE

SERVICE_ROLE_CATEGORY=service
SERVICE_PERMISSION_CATALOG=SHARED_COMMON_PERMISSION_DEFINITION

SERVICE_IDENTITY_TO_MEMBERSHIP_ROLE_ASSIGNMENT=PROHIBITED
HUMAN_LOGIN_ACCOUNT_TO_SERVICE_ROLE_ASSIGNMENT=PROHIBITED

SERVICE_PLAINTEXT_CREDENTIAL_STORAGE=PROHIBITED
SERVICE_CREDENTIAL_LOGGING=PROHIBITED

# 25. Trusted execution actor attribution

ACTOR_ATTRIBUTION_CANONICAL_EXTENSION=DEFINED

ACTOR_TYPE_VALUES=HUMAN,SERVICE

HUMAN_ACTOR_IDENTITY=login_account_id
SERVICE_ACTOR_IDENTITY=service_identity_id

HUMAN_INITIATED_SERVICE_REQUESTED_BY=REQUIRED
AUTONOMOUS_SERVICE_REQUESTED_BY=NULL_ALLOWED

TRUSTED_COMPANY_CONTEXT=REQUIRED
CLIENT_ASSERTED_COMPANY_AUTHORITY=PROHIBITED

SERVICE_AS_FAKE_HUMAN_USER=PROHIBITED

integration.my_company_id() must consume trusted authenticated and authorized
company context and must not arbitrarily choose one membership/company.

# 26. Physical implementation gate


PHYSICAL_SERVICE_IDENTITY_SCHEMA=security
PHYSICAL_SERVICE_CREDENTIAL_STORE=UNDECIDED

LIVE_DB_EXISTING_OBJECTS_DO_NOT_DEFINE_CANONICAL_AUTHORITY=YES

04_IMPLEMENTATION=NOT_STARTED
DB_IMPLEMENTATION=NOT_STARTED

# ERP LOGIN AUTH PHYSICAL AUTHORITY + USER ROLE LIFECYCLE EXACT EXTENSION

ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1=DEFINED

PROVIDER_MANAGED_AUTH_SCHEMA=auth
PROVIDER_USER_AUTHORITY=auth.users
PROVIDER_IDENTITY_AUTHORITY=auth.identities
PROVIDER_SESSION_AUTHORITY=auth.sessions
PROVIDER_REFRESH_TOKEN_AUTHORITY=auth.refresh_tokens

ERP_SECURITY_SCHEMA=security
ERP_LOGIN_ACCOUNT_AUTHORITY=security.login_account
ERP_LOGIN_IDENTITY_BINDING_AUTHORITY=security.login_identity_binding
ERP_USER_PROVISIONING_REQUEST_AUTHORITY=security.user_provisioning_request
ERP_AUTHENTICATED_SESSION_AUTHORITY=security.authenticated_session
ERP_COMPANY_MEMBERSHIP_AUTHORITY=security.company_membership
ERP_LOGIN_ACCOUNT_PREFERENCE_AUTHORITY=security.login_account_preference
ERP_COMPANY_AUTH_POLICY_AUTHORITY=security.company_auth_policy

ERP_ROLE_DEFINITION_AUTHORITY=security.role_definition
ERP_PERMISSION_DEFINITION_AUTHORITY=security.permission_definition
ERP_ROLE_PERMISSION_AUTHORITY=security.role_permission
ERP_SYSTEM_ROLE_ASSIGNMENT_AUTHORITY=security.login_account_role_assignment
ERP_COMPANY_ROLE_ASSIGNMENT_AUTHORITY=security.membership_role_assignment

ERP_SERVICE_IDENTITY_AUTHORITY=security.service_identity
ERP_SERVICE_CREDENTIAL_METADATA_AUTHORITY=security.service_credential
ERP_SERVICE_COMPANY_ACCESS_AUTHORITY=security.service_company_access
ERP_SERVICE_ROLE_ASSIGNMENT_AUTHORITY=security.service_role_assignment

COMPANY_AUTHORITY=core.company
COMPANY_LINKAGE_AUTHORITY=security.company_membership

USER_PROVISIONING_METHOD=APPLICATION_OR_INVITATION
INITIAL_COMPANY_ADMIN_PROVISIONING=BOOTSTRAP
PUBLIC_SELF_SIGNUP=PROHIBITED
COMPANY_ADMIN_APPROVAL=REQUIRED
AUTH_UID_ISSUER=AUTH_PROVIDER
ERP_UID_BINDING=REQUIRED
UID_ALONE_GRANTS_ACCESS=NO

LOGIN_ACCOUNT_LIFECYCLE=INVITED_ACTIVE_SUSPENDED_DISABLED
COMPANY_MEMBERSHIP_LIFECYCLE=INVITED_ACTIVE_SUSPENDED_ENDED
ONE_LOGIN_ACCOUNT_MULTIPLE_COMPANIES=ALLOWED
COMPANY_REMOVAL_DOES_NOT_DISABLE_GLOBAL_ACCOUNT=YES
USER_HARD_DELETE_DEFAULT=PROHIBITED
USER_EMPLOYEE_LINKAGE=OPTIONAL

ROLE_DEFINITION_LIFECYCLE=CREATE_UPDATE_DISABLE_DEPRECATE
ROLE_DEFINITION_HARD_DELETE_DEFAULT=PROHIBITED
ROLE_ASSIGNMENT_LIFECYCLE=GRANT_CHANGE_END
ROLE_ASSIGNMENT_HISTORY_REQUIRED=YES
ROLE_ORIGIN=SYSTEM_BUILTIN_MODULE_BUILTIN_COMPANY_CUSTOM
COMPANY_CUSTOM_ROLE=SUPPORTED
BUILTIN_ROLE_MUTATION=PROHIBITED
COMPANY_ADMIN_ROLE_SCOPE=OWN_COMPANY_ONLY
COMPANY_ADMIN_SYSTEM_ROLE_MANAGEMENT=PROHIBITED
UNAUTHORIZED_SELF_ELEVATION=PROHIBITED
LAST_ACTIVE_COMPANY_SYSTEM_ADMIN_REMOVAL=PROHIBITED_WITHOUT_REPLACEMENT

PREFERRED_UI_LANGUAGE=SUPPORTED
PREFERRED_DISPLAY_TIME_ZONE=SUPPORTED
LAST_SELECTED_COMPANY=USER_PREFERENCE_ONLY
LAST_SELECTED_COMPANY_REVALIDATION=REQUIRED
LANGUAGE_CODE_STANDARD=BCP47
TIME_ZONE_STANDARD=IANA
INITIAL_UI_LANGUAGES=ja-jp_en-us
LANGUAGE_CHANGE_REQUIRES_RELOGIN=NO
USER_UI_LANGUAGE_AND_DOCUMENT_LANGUAGE=SEPARATE
USER_TIME_ZONE_AND_COMPANY_BUSINESS_TIME_ZONE=SEPARATE
LOCALE_DOES_NOT_DEFINE_CURRENCY=YES

MFA_AUTHORITY=AUTH_PROVIDER
MFA_POLICY=SUPPORTED
PASSWORD_RECOVERY_AUTHORITY=AUTH_PROVIDER
EMAIL_VERIFICATION_AUTHORITY=AUTH_PROVIDER
PROVIDER_CREDENTIAL_STORAGE_IN_ERP=PROHIBITED
RAW_INVITATION_SECRET_STORAGE=PROHIBITED

CURRENT_COMPANY_RESOLUTION=TRUSTED_SESSION_CONTEXT
ARBITRARY_COMPANY_LIMIT_1=PROHIBITED
PREFERENCE_GRANTS_AUTHORIZATION=NO

AI_WORKER_PROVISIONING=SERVICE_IDENTITY_FLOW
AI_WORKER_SUPABASE_SERVICE_ROLE_AS_IDENTITY=PROHIBITED

PHYSICAL_SERVICE_CREDENTIAL_METADATA_AUTHORITY=security.service_credential
EXECUTION_ACTOR_CONTEXT_PERSISTENCE=DERIVED_RUNTIME_CONTEXT

LEGACY_CORE_APP_USER_AUTHORITY=NO
LEGACY_CORE_COMPANY_USERS_AUTHORITY=NO
LEGACY_ROLE_TABLES_AUTHORITY=NO
LEGACY_INTEGRATION_API_CREDENTIAL_SERVICE_IDENTITY_AUTHORITY=NO
DUAL_AUTHORITY=PROHIBITED

PUBLIC_AUTH_OBJECTS=PROHIBITED
PUBLIC_ORDINARY_READ_ONLY_VIEWS_ONLY=YES
