# 56 — Model Solution: Lending Apply + E-sign

## Timed outline (45–60 min)

| Min | Focus |
|-----|--------|
| 0–6 | MVP: apply → underwrite → e-sign → disburse track |
| 6–18 | Funnel state machine; resume; PII |
| 18–40 | Doc upload; offer; e-sign; mandates |
| 40–55 | Failures, compliance, metrics |

## Clarify and scope

**Prompt:** “Design personal loan / credit apply flow on mobile with e-sign.”

**MVP:** multi-step application; bureau/consent; offer presentation; e-sign agreement; track disbursement; optional Autopay setup for EMI.

**Defer:** underwriting model, legal PDF generation internals—client renders offers + signing session.

## NFRs

- Resume application after kill
- Consents explicit and versioned
- Offer TTL; no silent reprice after accept
- E-sign ceremony audited (server)
- PII minimized at rest post-submit

## Architecture

```mermaid
flowchart TB
  ui[Apply_Wizard]
  app[Application_Repo]
  docs[Doc_Uploader]
  offer[Offer_UI]
  sign[ESign_SDK_Web]
  api[Lending_BFF]
  ui --> app
  ui --> docs
  ui --> offer
  ui --> sign
  app --> api
  docs --> api
  offer --> api
  sign --> api
```

## Data model

```text
LoanApplication:
  applicationId?, localId, productCode,
  status (draft|submitted|underwriting|offered|
          declined|signing|signed|disbursing|
          disbursed|cancelled|unknown),
  stepId, consents[], updatedAt, clientMutationId

LoanOffer:
  offerId, principalMinor, apr, tenureMonths,
  emiMinor, expiresAt, disclosuresRef

SignSession:
  sessionId, provider, status, expiresAt
```

## Funnel

```mermaid
stateDiagram-v2
  [*] --> draft
  draft --> submitted: submit
  submitted --> underwriting
  underwriting --> offered
  underwriting --> declined
  offered --> signing: accept_offer
  signing --> signed
  signed --> disbursing
  disbursing --> disbursed
  offered --> cancelled: expire_or_reject
```

1. Wizard steps with local draft persistence (like Ch 42).
2. Consents: checkbox + linked policy version ids.
3. Submit → underwriting; poll/push for offered/declined.
4. Offer screen: APR, EMI, fees, total cost; countdown TTL.
5. Accept → e-sign session (SDK/WebView); on return verify API.
6. After signed: disbursement tracking; credit to bank/wallet.
7. Optional EMI Autopay mandate (Ch 48).

**Never** show “loan approved & money sent” from client-only signals.

## Docs & KYC reuse

- Reuse Ch 42 capture/upload; don’t duplicate PII if KYC already approved.
- Re-KYC triggers when policy requires.

## E-sign

| Concern | Approach |
|---------|----------|
| Provider | Hosted e-sign / certified SDK |
| Kill mid-sign | Resume session status from API |
| Success hint from WebView | Always `GET` application status |
| Decline to sign | Back to offered if not expired |

## Offline

- Edit draft fields OK.
- Submit/sign/disburse require network.
- Cached offer view only if not expired; else refresh.

## Failures

| Case | Behavior |
|------|----------|
| Offer expired at accept | New underwriting or refreshed offer |
| Sign session expired | New session |
| Disbursement unknown | Poll; support refs |
| Duplicate submit | Idempotency |
| Decline | Neutral UX + cooldown copy |

## Security & privacy

- PII encrypt-at-rest; delete local docs after ack.
- FLAG_SECURE on offer accept / sign.
- Step-up before accept/sign on new device.
- Analytics: funnel steps, not income values.

## Platform implementation

| Concern | Android | iOS | Flutter | React Native |
|---------|---------|-----|---------|--------------|
| Multi-step form resume | `SavedStateHandle` + server draft | Server draft + `@SceneStorage` for UI only | Server draft | Server draft |
| E-sign | Custom Tabs to provider or native PDF + signature (Ch 59–64) | `SFSafariViewController` / native PDFKit flow | Plugin / native view | Native module / WebView with care |
| Document viewing | `PdfRenderer` | PDFKit | `pdfx` / native view | `react-native-pdf` |

## Trade-offs

| Decision | Alternative | Why |
|----------|-------------|-----|
| Server offer TTL | Static cached offer | Fair lending / dispute avoidance |
| Hosted e-sign | Custom signature pad only | Evidence quality |
| Explicit EMI mandate opt-in | Forced autopay | Consent |

## Metrics

step_dropoff, time_in_underwriting, offer_accept_rate, sign_completion, disburse_latency, resume_after_kill_success.

## Staff stretch

- Pre-approved offers vs full apply
- Co-applicant flows
- Foreclosure / part-prepay later modules
- Accessibility for long disclosures

## Follow-ups

- BNPL contrast (Ch 52)
- Disputes on EMI debit (Ch 54)
- Device bind for borrower portal (Ch 44)

## See also

- [Ch 42 KYC](42-kyc-onboarding.md) · [Ch 48 Mandates](48-upi-autopay-mandates.md) · [Ch 47](47-fraud-challenge-step-up.md) · [Ch 25](../part-3-consumer-apps/25-photo-camera-upload.md)
