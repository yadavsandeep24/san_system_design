# Appendix D — Mobile Architect Skills & 90-Day Plan

Career-survival skills for the next ~5 years, plus a concrete enhancement list and a **90-day practice plan**. Tuned for **payment / checkout SDK** work (Core API → WebView/Checkout → iOS / Android / React Native), but useful for any senior/staff mobile architect track.

**Related book chapters:** [Ch 04 Client architecture](../part-2-building-blocks/04-client-architecture.md) · [Ch 05 Networking](../part-2-building-blocks/05-networking-and-apis.md) · [Ch 11 Security](../part-2-building-blocks/11-security-and-privacy.md) · [Ch 12 Observability](../part-2-building-blocks/12-observability-and-quality.md) · [Ch 21 Checkout SDK](../part-3-model-solutions/21-checkout-payment-sdk.md) · [Ch 25 Fintech SD](../part-3-model-solutions/25-top-fintech-system-design.md)

---

## 1. Core skill to survive the next 5 years

A mobile architect who stays valuable won’t win on “knowing Swift/Kotlin alone.” The durable core is **system design across devices, platforms, and teams**.

### 1.1 Non-negotiable core

1. **Cross-platform architecture judgment**  
   Decide when native, Flutter, RN, KMP, or hybrid is right — and design boundaries so platform choice doesn’t trap the product.

2. **Modular / SDK-first design**  
   Feature modules, clean public APIs, versioning, binary size, backward compatibility. Mobile is a **distribution surface** (apps + SDKs + WebViews + mini-apps), not just UI screens.

3. **Performance & reliability as product features**  
   Cold start, memory, battery, network resilience, crash-free sessions, offline/sync. If you can’t measure and budget these, you’re a senior engineer with a title — not an architect.

4. **Security & trust by design**  
   Auth, secrets, certificate pinning, secure storage, fraud signals, privacy (consent, data minimization). Critical in payments, identity, and anything touching PII.

5. **Backend-for-frontend & API contracts**  
   GraphQL/REST/gRPC, pagination, idempotency, retries, schema evolution. Architects who ignore the API layer get replaced by platform + backend pairs.

### 1.2 Skills that separate survivors

| Skill | Why it matters next 5 years |
|--------|-----------------------------|
| **AI-assisted product surfaces** | On-device + cloud models, privacy, latency, fallback UX — not just “call an LLM API” |
| **Observability** | Tracing, session-replay tradeoffs, release health, experiment readout |
| **CI/CD & release engineering** | Staged rollouts, feature flags, store review risk, multi-flavor builds |
| **Cost & platform economics** | Build time, binary size, cloud spend, team velocity — architecture as business constraint |
| **People / decision leadership** | ADRs, tradeoff docs, mentoring, stopping over-engineering |

### 1.3 What fades (don’t bet the career on it)

- Framework trivia as identity (“I’m a pure SwiftUI / Compose person”)
- Pixel-pushing without system ownership
- “We’ll rewrite the app” as a strategy
- Ignoring web / edge / WebView as part of the mobile system

### 1.4 Practical survival stack (2026–2031)

- Deep in **one native** (iOS *or* Android) + credible on the **other**
- Strong on **one cross-platform** path (RN / Flutter / KMP) and when *not* to use it
- Solid **distributed systems basics** (consistency, queues, caching, failure modes)
- Comfortable with **security, payments/identity patterns**, and **SDK packaging**
- Able to write a one-page architecture decision that a CTO and a junior both understand

**Bottom line:** Design resilient mobile **systems** — platforms, APIs, security, release, and org constraints — not just screens.

---

## 2. Skills to enhance (priority order)

Ranked for a **mobile architect in payments / SDK** work.

### Priority 1 — strengthen now

1. **System design for mobile + backend**  
   Idempotent payments, retries, timeouts, webhook/callback races, offline failure modes, order/state machines.

2. **Multi-platform SDK architecture**  
   Shared contracts, versioning, breaking-change policy, bridge layers (RN ↔ native), binary size, public API design.

3. **Security for mobile finance**  
   Keychain/Keystore, attestation, pin/biometrics, PCI-aware boundaries, secret handling, WebView trust boundaries.

4. **Observability & release health**  
   Crash analytics, breadcrumbs, funnel metrics (checkout start → success), feature flags, staged rollouts.

5. **Architecture communication**  
   ADRs, sequence diagrams, tradeoff docs, RFCs that engineers and PMs can act on.

### Priority 2 — differentiate in 1–2 years

6. **Cross-platform strategy** — when native vs RN vs KMP vs WebView; module boundaries.  
7. **Performance budgeting** — cold start, memory, ANR/jank, network waterfalls, SDK init cost.  
8. **API / BFF design** — contract-first APIs, pagination, error taxonomies, schema evolution.  
9. **CI/CD & packaging** — CocoaPods / Maven / NPM, XCFrameworks, signing, reproducible builds.  
10. **Fraud & risk signals (mobile)** — device integrity, session binding, replay protection, safe logging.

### Priority 3 — future-proof

11. **AI in product flows** — assistive UX, on-device vs cloud, latency/privacy, safe failure paths.  
12. **Platform economics** — team cost, build time, store/review risk, architecture ROI.  
13. **Leadership craft** — mentoring, tech-debt prioritization, saying no with data, hiring bar.

### How to level up (quick map)

| Skill | How to level up |
|--------|------------------|
| System design | Design 1 payment flow end-to-end weekly (diagram + failure cases) |
| SDK architecture | Own versioning + migration notes for one release |
| Security | Threat-model checkout + WebView bridge once per quarter |
| Observability | Define 5 golden metrics for checkout and track them |
| Communication | Write ADRs for every non-trivial platform decision |
| Cross-platform | Build one shared core (models/API) used by iOS + Android + RN |
| Performance | Set budgets (init &lt; X ms, SDK size &lt; Y MB) and enforce in CI |
| Release eng | Automate one full publish path (pod / npm / maven) |

### Skip / don’t over-invest

- Framework fashion (newest UI toolkit every year)
- Pixel-perfect UI craft as main identity
- Rewrites without measurable pain

**Focus order:** SDK/system design → payment security → observability/releases → cross-platform judgment → leadership docs.

---

## 3. 90-day learning plan

### Goal after 90 days

Own an architecture decision **end-to-end**: threat model, API/SDK contracts, failure modes, metrics, release plan, and a short ADR others can execute.

### Cadence

| Rhythm | What |
|--------|------|
| **Daily** | 30–45 min deep work (no meetings) |
| **Weekly** | 1 deliverable (doc, diagram, or small spike) |
| **Biweekly** | 30-min review: what shipped, what was weak |
| **Rule** | Prefer real SDK/checkout work over courses |

---

### Days 1–30 — Foundations (system + SDK + security)

**Theme:** Think in systems, not screens.

#### Week 1 — Payment state machine

- **Skill:** System design  
- **Exercise:** Draw the full checkout lifecycle (order create → checkout open → pay → callback → success / fail / cancel / timeout).  
- **Deliverable:** 1 sequence diagram + list of **all failure modes** (network drop, double tap, app kill, WebView close, duplicate webhook).  
- **Pass bar:** Every failure has a defined app/SDK behavior.  
- **Book tie-in:** Ch 21, Ch 24.

#### Week 2 — SDK boundaries

- **Skill:** Modular / SDK architecture  
- **Exercise:** Map Core API vs WebView vs RN bridge: what each owns, what must never cross.  
- **Deliverable:** 1-page “layering rules” (allowed imports, public vs internal APIs).  
- **Pass bar:** You can explain why WebView types must not leak into Core.  
- **Book tie-in:** Ch 04, Ch 21.

#### Week 3 — Versioning & contracts

- **Skill:** Public API design  
- **Exercise:** Pick one public method/event in RN or iOS SDK. Document breaking vs non-breaking change rules.  
- **Deliverable:** SemVer policy + migration note template for next release.  
- **Pass bar:** A junior could bump a version using only your doc.

#### Week 4 — Threat model checkout

- **Skill:** Mobile payment security  
- **Exercise:** Threat-model: token storage, WebView bridge messages, deep links, logging.  
- **Deliverable:** STRIDE-lite table (asset → threat → mitigation → residual risk).  
- **Pass bar:** At least 5 concrete mitigations you can verify in code.  
- **Book tie-in:** Ch 11, Ch 28.

**Month 1 checkpoint:** One ADR — “How we handle checkout cancellation + timeout.”

---

### Days 31–60 — Reliability (observability + performance + APIs)

**Theme:** If you can’t measure it, you don’t own it.

#### Week 5 — Golden metrics

- **Skill:** Observability  
- **Exercise:** Define 5 checkout metrics (e.g. `checkout_started`, `payment_submitted`, `success`, `fail_by_reason`, `time_to_result`).  
- **Deliverable:** Metric dictionary (name, when emitted, properties, PII rules).  
- **Pass bar:** No PII in events; each metric maps to a dashboard question.  
- **Book tie-in:** Ch 12.

#### Week 6 — Resilience patterns

- **Skill:** Distributed systems on mobile  
- **Exercise:** Design retries / idempotency for order fetch + payment status poll.  
- **Deliverable:** Pseudocode + rules (max retries, backoff, when *not* to retry).  
- **Pass bar:** Clear answer for “user taps Pay twice.”  
- **Book tie-in:** Ch 05, Ch 24. Fintech rule: server/PSP is source of truth — never optimistic-complete “Paid.”

#### Week 7 — Performance budget

- **Skill:** Performance architecture  
- **Exercise:** Measure SDK init + first checkout paint on a sample app (rough is fine).  
- **Deliverable:** Budgets (e.g. init &lt; X ms, SDK size &lt; Y) + top 3 suspects if over.  
- **Pass bar:** Numbers exist; not vibes.  
- **Book tie-in:** Ch 10.

#### Week 8 — API / BFF contract

- **Skill:** API evolution  
- **Exercise:** Document error taxonomy for one endpoint family (auth, order, payment status).  
- **Deliverable:** Error code → UX/SDK mapping table.  
- **Pass bar:** Client never needs to parse free-text errors for control flow.  
- **Book tie-in:** Ch 05.

**Month 2 checkpoint:** One ADR — “Retry + polling policy for payment status” + a metrics stub in sample/SDK if possible.

---

### Days 61–90 — Leverage (release + cross-platform + leadership)

**Theme:** Make decisions that scale the team.

#### Week 9 — Release engineering

- **Skill:** CI/CD & packaging  
- **Exercise:** Walk one publish path end-to-end (pod / npm / maven) and list failure points.  
- **Deliverable:** Release checklist (version bump, changelog, artifact, smoke test, rollback).  
- **Pass bar:** Someone else could release with your checklist.

#### Week 10 — Cross-platform decision

- **Skill:** Platform judgment  
- **Exercise:** Pick a real feature (e.g. UPI intent, new callback field). Decide native-only vs shared vs RN-only.  
- **Deliverable:** Options matrix (cost, risk, time, maintainability) + recommendation.  
- **Pass bar:** Explicit “why not the other options.”  
- **Book tie-in:** Ch 22 (UPI).

#### Week 11 — Fraud / trust signals (mobile)

- **Skill:** Risk-aware architecture  
- **Exercise:** List device/session signals safe to send; list what you must never log.  
- **Deliverable:** Data classification sheet (public / internal / sensitive / forbidden).  
- **Pass bar:** Aligns with Week 4 threat model.  
- **Book tie-in:** Ch 11, Ch 28.

#### Week 12 — Capstone

- **Skill:** Architecture leadership  
- **Exercise:** Full mini-architecture for one upcoming change (or hypothetical: “add payment method X”).  
- **Deliverable package:**
  1. Problem statement  
  2. Sequence diagram  
  3. API/SDK changes  
  4. Security notes  
  5. Metrics  
  6. Rollout / rollback  
  7. ADR (1 page)  
- **Pass bar:** A tech lead could approve or reject with one read.

**Month 3 checkpoint:** Capstone reviewed by a peer/manager; revise once based on feedback.

---

## 4. Weekly log template

Copy for each week:

```text
Week #:
Focus skill:
Exercise:
Deliverable:
What I learned:
What I’d do differently:
Open questions for backend/product:
Book chapters read:
```

---

## 5. Week 1 starter worksheet (checkout)

Use on day 1–2 against real Core + WebView + sample code.

### State transitions to find in code

- [ ] Order / session created  
- [ ] Checkout UI opened  
- [ ] Payment method selected  
- [ ] Payment submitted  
- [ ] Pending / processing  
- [ ] Success  
- [ ] Failed (user-visible reason)  
- [ ] Cancelled (user / back / close)  
- [ ] Timeout / unknown  
- [ ] App backgrounded / killed mid-flow  
- [ ] Deep link / intent return (e.g. UPI)  
- [ ] Host app callback / event emitted  

### Failure checklist (each needs defined behavior)

| Failure | Expected SDK / app behavior | Source of truth |
|---------|----------------------------|-----------------|
| Network drop after Pay | | Server / PSP |
| Double tap Pay | | |
| User closes WebView | | |
| App process death | | |
| Duplicate webhook / callback | | |
| Status poll returns unknown | | |
| Token expired mid-checkout | | |
| Deep link returns with no order id | | |

### Layering reminder

```text
Sample Apps (iOS / RN / Android)
        ↓
WebView / Checkout SDKs  ← payment UI, checkout flow
        ↓
Core API SDKs            ← order, API, UPI detect, events
        ↓
Backend (QA / Prod APIs)
```

Never import WebView SDK types into Core API SDK code.

---

## 6. Success metrics (day 90)

On track if you have:

- [ ] **3 ADRs** (cancel/timeout, retry/poll, capstone)  
- [ ] **1 threat model**  
- [ ] **1 metrics dictionary**  
- [ ] **1 release checklist**  
- [ ] **1 options matrix** for a cross-platform choice  

---

## 7. Resources (only what you’ll use)

- Your own SDKs + sample apps (primary textbook)
- This book’s Part 2 + fintech Part 3 chapters linked above
- [ADR template](https://github.com/joelparkerhenderson/architecture-decision-record) — keep to 1 page
- OWASP MASVS — skim; apply to checkout
- Your API error/status docs — turn into client mapping tables

Skip long course binges unless a week’s exercise is blocked.

---

## 8. One-line focus order

**SDK/system design → payment security → observability/releases → cross-platform judgment → leadership docs.**

Start tomorrow: list every checkout state transition you can find in code → turn it into the Week 1 sequence diagram.
