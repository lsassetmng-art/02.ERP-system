# ERP LOGIN / SESSION / COMPANY CONTEXT FLOW

document_status: canonical
canonical_owner: 00.foundation

## 1. Unauthenticated entry

When an unauthenticated user requests a protected ERP screen:

1. retain a validated internal return target
2. redirect to /login
3. display localized login UI
4. do not expose whether a specific account exists

External/untrusted return URLs must not be accepted as open redirects.

## 2. Login

1. user submits login identifier and credential
2. server validates request controls
3. authentication provider verifies credential
4. provider subject is mapped to ERP Login Account
5. account lifecycle is validated
6. authenticated session is established
7. active company memberships are resolved

Failure at any step denies business access.

## 3. Company resolution

If active membership count is zero:

- state = authenticated_no_company
- business module access = denied

If active membership count is one:

- that company may become current company context

If active membership count is greater than one:

- state = company_selection_required
- user selects one permitted company
- server revalidates membership
- selected company becomes current context

## 4. Ready state

Before entering a company-scoped business module:

- session must be active
- account must be active
- current company must be valid
- membership must be active
- required permission must resolve to allowed

## 5. Company switch

Company switch flow:

1. request available active memberships
2. select target company
3. server validates membership
4. clear prior company-scoped authorization cache
5. establish new company context
6. audit the switch
7. reload company-scoped ERP state

Company switch while offline is prohibited.

## 6. Session expiry

When session expires:

- protected API requests fail authentication
- local UI enters session_expired state
- new authoritative sync/write is blocked
- user must authenticate again

## 7. Logout

Logout must:

- revoke/end the current session
- remove server-recognized login authority
- clear local session material
- clear current company context
- prevent reuse of the revoked session
- write security audit evidence

## 8. Account disable/revocation

When an account becomes disabled, suspended, or security-revoked:

- future login is denied as applicable
- active sessions are invalidated according to security policy
- company access is denied
- security event is audited

## 9. Offline transition

If connectivity is lost after authentication:

- already-open UI may retain permitted local state
- queued writes remain intents only
- privilege checks are not broadened
- company switch is blocked
- login/logout/account-management mutations are unavailable
- sync requires server-side revalidation after reconnection

## Canonical extension: human role resolution flow

After Login Account authentication and Company Membership validation:

1. establish the selected authorized company context
2. load all effective company-scoped role assignments for that membership
3. resolve role permissions
4. apply module permission semantics
5. deny any operation without an explicit authorization path

A user may hold multiple module roles in the same company.

Example shape:

Company Membership
-> accounting role
-> finance role
-> purchasing approval role

The role set is evaluated together; COMPANY_STAFF is not a substitute for
module-specific role assignment.

## Canonical extension: AI Worker execution flow

AI Worker execution flow:

1. authenticate Service Identity
2. validate Service Identity status
3. validate explicit Service Company Access
4. resolve effective Service Role Assignment
5. resolve shared permission definitions
6. construct trusted execution_actor_context
7. preserve requested_by Login Account when human-initiated
8. execute ERP operation
9. emit auditable actor/company/authorization evidence

Failure of any authentication, company-access, role, permission, or actor
validation denies the operation.

AI Worker must never be converted into a fake human Login Account merely to
satisfy an existing business-table actor field.

# USER, ROLE, PREFERENCE AND SECURITY FLOWS

canonical_extension: ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1

## COMPANY BOOTSTRAP ADMIN FLOW

Company creation or separately governed bootstrap
→ bootstrap provisioning request
→ provider identity established
→ Login Account created or bound
→ Company Membership ACTIVE
→ COMPANY_SYSTEM_ADMIN assigned
→ bootstrap completion audited.

Bootstrap must not become an unrestricted permanent bypass.

## APPLICATION FLOW

Applicant identifies the intended company through an approved application
entry path.

Public enumeration of arbitrary companies for unrestricted signup is not
required and must not be assumed.

Flow:

provider identity may be established
→ application submitted
→ company administrator reviews
→ approve or reject
→ on approval, Login Account binding is established as required
→ Company Membership becomes effective
→ initial permitted roles are assigned
→ ERP access becomes available.

Applicant must not self-approve.

Provider UID alone grants no access.

## INVITATION FLOW

Company administrator
→ creates invitation for own company
→ user_provisioning_request=PENDING
→ provider invitation initiated
→ invited user completes provider authentication setup
→ provider UID verified
→ Login Account binding established
→ Company Membership activated
→ approved roles assigned
→ invitation marked COMPLETED.

Invitation may expire, be cancelled, or be resent through a governed flow.

Raw provider invitation secret/token must not be stored in ERP.

## LOGIN FLOW

login identifier
→ Supabase Auth
→ provider authentication success
→ provider UID resolution
→ active login_identity_binding resolution
→ Login Account status validation
→ provider/MFA policy validation
→ active Company Membership discovery
→ company context resolution
→ Role/Permission resolution
→ preference resolution
→ ERP authenticated session
→ ERP entry.

Zero active companies:

business access denied.

One active company:

automatic selection may occur if policy permits.

Multiple active companies:

explicit company selection is required unless a valid
last_selected_company preference can be revalidated and policy permits
automatic reuse.

## LAST SELECTED COMPANY FLOW

last_selected_company_id
→ treat as preference only
→ verify active Company Membership
→ verify current company authentication policy
→ if valid, may select
→ otherwise require company selection.

Stale preference never creates access.

## LANGUAGE RESOLUTION FLOW

Current explicit UI selection
→ stored user preferred language when available
→ company default language when defined
→ ERP system default.

Language change does not require re-login.

The resolved UI language may be refreshed in the active session.

UI language does not change document language or currency.

## TIME-ZONE RESOLUTION FLOW

User preferred display time zone
→ company/default display fallback
→ ERP system display default.

Business dates, accounting periods, cutoffs, and company batch boundaries
must use the applicable company business time zone rather than merely the
user display time zone.

## USER PROFILE CHANGE FLOW

User or authorized administrator
→ validate field ownership
→ update permitted ERP account/profile/preference fields
→ audit change.

Provider credential or provider-verified login identifier changes follow
the provider's verified security flow.

A company administrator must not directly rewrite provider credentials.

## COMPANY MEMBERSHIP CHANGE FLOW

Authorized company administrator
→ select own-company membership
→ activate, suspend, or end membership
→ recompute company access
→ invalidate stale selected-company context where required
→ audit.

Membership change must not mutate unrelated company memberships.

## COMPANY USER REMOVAL FLOW

Authorized company administrator
→ end effective own-company role assignments
→ end/suspend own-company membership
→ invalidate selected own-company context
→ retain Login Account
→ retain other company memberships
→ audit.

## GLOBAL ACCOUNT DISABLE FLOW

Authorized global/security authority
→ Login Account DISABLED
→ ERP sessions revoked/invalidated
→ new ERP session establishment denied
→ historical records preserved.

Company-local user removal alone does not execute this flow.

## ROLE DEFINITION FLOW

For allowed company custom roles:

authorized company administrator
→ create/update/disable company-scoped custom Role Definition
→ validate role ownership and grant boundary
→ audit.

Built-in system/module role definitions are protected.

## ROLE ASSIGNMENT FLOW

authorized administrator
→ select valid target membership or system account
→ select assignable role
→ validate scope/category/company/grant boundary
→ grant/change/end assignment
→ refresh/invalidate authorization state
→ audit.

## LAST COMPANY SYSTEM ADMIN FLOW

Before ending the final active COMPANY_SYSTEM_ADMIN:

check replacement
→ replacement exists: transition may continue
→ no replacement: reject and fail closed.

## MFA STEP-UP FLOW

Company context requested
→ company_auth_policy evaluated
→ current provider assurance evaluated
→ if sufficient: continue
→ if insufficient: provider MFA/step-up required
→ on success: company context may activate
→ on failure: deny.

ERP does not handle raw MFA factor secrets.

## ACCOUNT RECOVERY FLOW

Password reset, email verification, provider credential recovery,
and MFA recovery occur through provider-governed mechanisms.

Recovery success does not bypass ERP account, membership, or role checks.

## AI WORKER PROVISIONING FLOW

authorized service administrator
→ Service Identity created
→ Service Credential reference established
→ explicit Service Company Access granted
→ service Role Assignment granted
→ authentication tested
→ AI Worker becomes usable.

No human Login Account or human Company Membership is fabricated.

# ERP LOGIN / AUTH EXACT DATABASE FLOW V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_CANONICAL_V1

## LOGIN

After trusted provider authentication:

1. obtain provider subject;
2. obtain trusted provider session_id;
3. resolve ACTIVE login_identity_binding;
4. resolve ACTIVE Login Account;
5. create or refresh ERP authenticated_session;
6. copy login_account.authorization_version;
7. resolve effective Company Memberships;
8. select or request Company context;
9. verify company required AAL;
10. expose trusted ERP authorization context.

Provider authentication does not create Company Membership automatically.

## COMPANY CONTEXT

Company selection transaction:

1. resolve current ERP authenticated_session;
2. lock/revalidate target Membership;
3. require ACTIVE effective Membership;
4. verify current AAL against company_auth_policy;
5. update authenticated_session.selected_company_id;
6. update last_selected_company_id preference;
7. expose trusted context.

Preference is updated only after successful authorization.

## APPLICATION / INVITATION

Provisioning completion performs atomically where ERP-owned:

- lock provisioning request;
- validate request status;
- validate approving actor;
- create or resolve Login Account;
- create verified Provider Binding;
- create/activate Membership;
- create explicitly approved initial Role Assignments;
- mark provisioning complete;
- increment authorization_version where required;
- emit security/audit event.

Provider invitation secrets are never persisted.

## MEMBERSHIP CHANGE

Suspension/end of a Membership:

- locks Membership;
- validates grant boundary;
- validates final COMPANY_SYSTEM_ADMIN invariant;
- updates status/effective period;
- ends invalidated Role Assignments;
- increments Login Account authorization_version;
- invalidates unusable selected Company contexts;
- emits security/audit event.

Memberships in other Companies are unaffected.

## ROLE CHANGE

Human role grant requires:

- valid grant actor;
- valid target Login Account or Membership;
- correct role scope;
- non-service role category;
- correct COMPANY_CUSTOM owner Company;
- no duplicate/open overlap.

Affected human authorization_version increments.

## ROLE-PERMISSION CHANGE

A Role-Permission change invalidates authorization_version for affected
effective human and service assignees.

## LAST COMPANY SYSTEM ADMIN

Removal, suspension, end, disable, deprecation, or retirement that would
remove the final effective COMPANY_SYSTEM_ADMIN is rejected unless an
effective replacement/recovery transition occurs in the same governed
transaction.

## SERVICE

Service setup uses:

- Service Identity;
- non-secret Service Credential reference;
- Service Company Access where required;
- service-category Role Assignment.

No human Login Account, human session, or human Company Membership is
fabricated.

## LEGACY ACTOR CUTOVER

The fourteen accepted core.app_user actor FK source columns currently have
zero rows.

This reduces data migration risk but does not authorize automatic FK
repointing.

Production writes must not mix:

- provider UID;
- ERP Login Account UUID;
- Service Identity UUID

inside one legacy actor field.
