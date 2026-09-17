# ERP LOGIN / AUTH CONSTITUTION

document_status: canonical
canonical_owner: 00.foundation
scope: ERP human-user authentication and authorization foundation

## 1. Purpose

This document defines the constitutional ownership and non-negotiable
boundaries for ERP login, authentication, session, authorization,
and company access context.

## 2. Canonical ownership

00.foundation owns:

- ERP login account identity
- authentication contract
- authenticated session contract
- logout and session termination
- company membership used for ERP access
- authorization role and permission framework
- current authenticated user context
- current authorized company context
- login security policy
- login UI and authentication API contract

Business modules consume this authority and must not create competing
login or authorization truth.

## 3. Identity separation

The following objects are distinct:

- ERP login account
- human person
- HR employee
- business partner
- master-data record
- company
- service/API client

Canonical rules:

- LOGIN_ACCOUNT != PERSON
- LOGIN_ACCOUNT != EMPLOYEE
- LOGIN_ACCOUNT != MASTER_DATA_RECORD
- LOGIN_ACCOUNT != BUSINESS_PARTNER
- LOGIN_ACCOUNT != SERVICE_CLIENT

A login account may reference a person or employee where required,
but such a reference does not transfer ownership of person or employee truth.

## 4. Master Data boundary

52.master-data owns shared business identity and reference truth.

52.master-data does not own:

- login passwords
- login credentials
- authentication sessions
- login account lifecycle
- role assignment for ERP access
- company access membership

ERP login credentials must not be stored in master-data business tables.

## 5. Company boundary

Authentication does not own company business identity.

Authorization may reference the current accepted company authority through
company_id for:

- company membership
- company-scoped role assignment
- current company context

This change unit does not relocate or redesign company master authority.

## 6. Authentication before authorization

Authorization without authenticated identity is prohibited.

The sequence is:

1. establish login account identity
2. authenticate the account
3. establish an authenticated session
4. resolve active company membership
5. establish current company context where required
6. resolve role and permission
7. permit or deny the requested ERP operation

## 7. Default access posture

ERP authorization is deny-by-default.

Absence of an applicable active permission is denial.

Client-provided company_id, role, permission, or user identity must never be
accepted as authorization truth without server-side validation.

## 8. Offline boundary

New authentication while offline is prohibited.

If connectivity is lost after successful authentication:

- no new login may be established
- no company switch may be authorized
- no privilege elevation may occur
- no account or permission mutation may occur
- locally queued business writes remain non-authoritative intents
- queued work must be revalidated after connectivity returns

## 9. Provider neutrality

This canonical layer does not select a physical authentication provider.

The following remain implementation decisions until separately accepted:

- internal credential store
- external identity provider
- Supabase Auth or other provider
- physical auth schema
- physical token implementation

Logical contracts in this foundation remain authoritative regardless of provider.

## 10. Audit requirement

Security-significant events must be auditable, including:

- login success
- login failure
- logout
- session revocation
- account lock/suspension/disable
- credential change/reset
- company context switch
- membership change
- role assignment change
- permission change

## 11. Permission ownership boundary

00.foundation owns the common ERP security framework:

- authentication identity and session framework
- company membership framework
- role and permission framework
- role-assignment mechanics
- permission resolution contract
- authorization enforcement contract

Each business module owns its own business permission semantics, including:

- resource_code meaning
- action_code meaning
- module-specific permission meaning
- which business operations require which permissions

Business modules must not redefine Login Account, authenticated session,
company membership, or the common role-assignment framework.

Foundation must not take ownership of source-module business permission meaning.

## 12. Audit ownership boundary

00.foundation owns authentication/security operational source truth, including:

- occurrence of authentication and authorization security events
- required security event categories
- security-event emission contract

51.audit owns:

- audit evidence truth
- audit finding truth
- remediation/conclusion truth
- immutable historical audit evidence

51.audit must not replace current authentication/security operational truth.

00.foundation must not create competing audit-evidence authority.

## 13. Phase gate

P1 Procurement Quantity remains HOLD until the ERP login/authentication
foundation has been designed, implemented, validated, and accepted.

## Canonical extension: company roles and service actors

ROLE_TAXONOMY_CANONICAL_EXTENSION=DEFINED

A Company Membership may hold multiple simultaneously effective
company-scoped role assignments.

Company membership alone does not grant module business authority.

The common human company roles are:

- COMPANY_SYSTEM_ADMIN
- COMPANY_ADMIN
- COMPANY_STAFF

These roles do not replace module-specific business or approval roles.

COMPANY_SYSTEM_ADMIN is company-scoped administrative authority.
It is not a system-scope ERP platform role.

COMPANY_ADMIN is company-scoped management-side authority.
It does not automatically imply every module business permission.

COMPANY_STAFF is a minimal common company-user role.
It must not automatically grant accounting, finance, sales, purchasing,
inventory, HR, or other module business authority.

Module-specific business and approval roles are additive and may be assigned
in multiples to the same Company Membership.

00.foundation owns the common role/permission/assignment framework.

Each source business module owns:

- its module-specific business role catalog
- its module-specific approval role catalog
- its module-specific permission semantics
- its role-to-permission business meaning

A source business module must not redefine authentication, Login Account,
Company Membership, common role-assignment mechanics, or session truth.

AI Worker and other non-human ERP actors must not authenticate as a human
Login Account.

AI Worker ERP execution requires an explicit Service Identity,
explicit company access, explicit service role assignment, and auditable
actor attribution.

Human identity and service identity must remain distinguishable throughout
authentication, authorization, business execution, and audit evidence.

# ERP LOGIN / AUTH PHYSICAL AUTHORITY, USER AND ROLE LIFECYCLE EXTENSION

canonical_extension: ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1

This extension resolves the physical authentication authority and defines
the governed lifecycle for human users, company membership, roles,
preferences, authentication security, and AI Worker service identities.

Any earlier statement in this canonical set that leaves the physical
authentication provider, ERP authentication schema, or Service Identity
schema UNDECIDED is superseded by this extension.

## AUTHORITY PRINCIPLE

The authentication provider and ERP authorization authority are separate.

Supabase Auth owns provider-managed authentication identity and credential
mechanisms.

ERP Foundation Security owns ERP Login Account, company membership,
authorization, company context, role assignment, service identity,
and ERP authentication policy.

Provider authentication success alone must never grant ERP business access.

Required human access chain:

provider authentication
→ provider UID binding
→ active ERP Login Account
→ active Company Membership
→ effective Role Assignment
→ effective Permission
→ trusted selected company context.

## USER PROVISIONING PRINCIPLE

Normal human user provisioning is allowed only through:

- company access application; or
- company invitation.

Public unrestricted ERP self-signup is prohibited.

The authentication provider issues the provider UID.

A company administrator does not issue or fabricate the provider UID.

Company-side approval governs ERP membership and authorization.

UID possession alone grants no ERP access.

## MULTI-COMPANY PRINCIPLE

One Login Account may belong to multiple companies.

Company-to-user linkage is represented by Company Membership and must not
be collapsed into a single company_id on Login Account.

Removal from one company must end that company's membership and role
assignments only.

A company administrator must not disable the global Login Account merely
because the user is removed from that administrator's company.

## USER LIFECYCLE PRINCIPLE

Human Login Account lifecycle must support:

- invitation or approved application;
- provider UID binding;
- activation;
- profile/preference update;
- suspension;
- disablement.

Hard delete is prohibited by default.

Exceptional purge or anonymization requires a separately governed
retention/privacy process.

## ROLE PRINCIPLE

Role Definition and Role Assignment are separate governed concepts.

Built-in system and module roles are protected definitions.

Company-scoped custom roles may be supported within the owning company,
subject to grant boundaries and deny-by-default authorization.

Role assignment history must be retained.

Role hard delete is prohibited by default.

## USER PREFERENCE PRINCIPLE

User interface language and user display time zone are explicit preferences.

UI language must not define document language, accounting currency,
document currency, company legal language, or company business time zone.

Last selected company is a convenience preference only and must be
revalidated against current active membership at every use.

## AUTHENTICATION SECURITY PRINCIPLE

Password, provider credential, email verification, MFA factor material,
and provider recovery secrets remain provider-managed.

ERP must not store plaintext provider passwords, MFA secrets,
recovery secrets, or provider administrative secret keys.

## AI WORKER PRINCIPLE

AI Worker provisioning remains a Service Identity lifecycle.

AI Worker must not be provisioned as a human Login Account merely to obtain
access.

Human and Service authorization may share Permission Definitions but their
identity, credential, company-access, and assignment mechanisms remain
separate.
