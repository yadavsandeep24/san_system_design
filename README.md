# Mobile System Design Interview Study Book

Original senior/staff prep for **iOS + Android** system design interviews, with a dedicated **fintech / payments** track.

---

## How to access this

### 1. Open the repo

| Where | What to do |
|-------|------------|
| **Cursor / VS Code** | File → Open Folder → this repo root (`san_system_design` / your clone path) |
| **GitHub / GitLab** | Browse files in the web UI; click any `.md` link |
| **GitHub Pages (mobile)** | Open your published site — see [Publish to GitHub](#publish-to-github-first-time) |
| **Terminal** | `cd` into the repo, then `open README.md` or open files in your editor |
| **Finder / Explorer** | Open the `book/` folder and open chapters in any Markdown viewer |

You do **not** need to build or install anything. Everything is plain Markdown.

### 2. Start here

| Goal | Open this first |
|------|-----------------|
| New to the book | [book/00-preface.md](book/00-preface.md) |
| Generalist interview prep | [Ch 01 — Interview Framework](book/part-1-foundations/01-interview-framework.md) |
| Fintech / payments / UPI | [Ch 25 — Top Fintech SD](book/part-3-model-solutions/25-top-fintech-system-design.md) |
| **1 day before interviews** | [Top fintech mock day](#top-fintech-mock-day-1-day-intensive) (timed prompts + scoring) |
| Day-of cheat sheet | [Appendix A](book/appendix/A-cheat-sheet.md) |
| Score a mock | [Appendix C](book/appendix/C-rubric.md) |
| Architect skills / 90-day plan | [Appendix D](book/appendix/D-mobile-architect-skills-90-day.md) |

### 3. Folder map

```text
README.md                 ← you are here (access + TOC + study paths)
book/
  00-preface.md
  part-1-foundations/     ← Ch 01–03  how to run the interview
  part-2-building-blocks/ ← Ch 04–12  reusable patterns
  part-3-model-solutions/ ← Ch 13–42  timed answers (+ fintech)
  appendix/               ← cheat sheet, follow-ups, rubric, architect 90-day plan
```

### 4. How to read a chapter

1. Open the `.md` file in the editor preview (Cursor/VS Code: open file → Markdown preview).
2. **Mermaid diagrams** render in GitHub and in most IDE Markdown previews. If a diagram shows as code, enable Markdown preview or view on GitHub.
3. Part 3 chapters are meant to be **spoken aloud** in 45–60 minutes (except Ch 25, which is a ranked catalog).

**Cursor tip:** `Cmd+Shift+V` (macOS) or `Ctrl+Shift+V` (Windows/Linux) often toggles Markdown preview.

### 5. Pick a path

- **Generalist (2 weeks)** — foundations → building blocks → consumer app solutions → mocks  
- **Fintech (2 weeks)** — Ch 05/07/11/12 → Ch 25 → Ch 21–31 → stretch 32–42 → [mock day](#top-fintech-mock-day-1-day-intensive)  

Details are in [Study paths](#study-paths) and [Top fintech mock day](#top-fintech-mock-day-1-day-intensive).

### 6. Fintech rule (memorize)

Client proposes intent → **server / PSP is source of truth** for money → never optimistic-complete “Paid.” Use `pending` / `unknown` + poll (see Ch 21–24).

---

## Publish to GitHub (first time)

This folder is not a git repo yet. Run these from the **repo root** (the folder that contains `README.md` and `book/`).

**Before push:** `mkdocs.yml` is set for personal account **`yadavsandeep24`**. Change `site_url` / `repo_url` if you use a different username.

**Use personal account (not SanNimbbl):** switch GitHub CLI before push:

```bash
gh auth switch -u yadavsandeep24
```

**Option A — GitHub CLI (recommended)**

```bash
git init
git add README.md pages-index.md book .gitignore mkdocs.yml requirements.txt stylesheets scripts .github
git commit -m "Add mobile system design interview study book"

# Public repo required for free GitHub Pages on personal accounts
gh repo create san_system_design --source=. --public --push
```

If `gh` asks you to log in: `gh auth login`, then re-run the `gh repo create` line.

**Option B — GitHub website**

1. Open [https://github.com/new](https://github.com/new).
2. Name the repo (e.g. `san_system_design`), choose **Public** (required for GitHub Pages on free personal accounts), **do not** add a README (you already have one).
3. Create the repository, then run:

```bash
git init
git add README.md pages-index.md book .gitignore mkdocs.yml requirements.txt stylesheets scripts .github
git commit -m "Add mobile system design interview study book"
git branch -M main
git remote add origin https://github.com/yadavsandeep24/san_system_design.git
git push -u origin main
```

Replace `<YOUR_USERNAME>` with your GitHub username (or org).

### Enable GitHub Pages (mobile-friendly site)

After the first push to `main`:

1. Open your repo on GitHub → **Settings** → **Pages**.
2. Under **Build and deployment**, set **Source** to **GitHub Actions** (not “Deploy from branch”).
3. Wait for the **Deploy GitHub Pages** workflow to finish (Actions tab). First run starts automatically on push.
4. Open the site URL shown on the Pages settings screen:

```text
https://yadavsandeep24.github.io/san_system_design/
```

**On mobile:** bookmark that URL. Use the **menu (☰)** in the top-left for the chapter sidebar, and **Search** for quick jumps. Mermaid diagrams render in the browser.

**Preview locally before push:**

```bash
python3 -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
bash scripts/prepare-docs.sh
mkdocs serve
```

Open [http://127.0.0.1:8000/san_system_design/](http://127.0.0.1:8000/san_system_design/) (MkDocs shows the exact URL in the terminal).

**Later updates**

```bash
git add -A
git commit -m "Describe your change"
git push
```

GitHub Actions rebuilds the site automatically (usually ~1–2 minutes).

**Clone elsewhere**

```bash
git clone https://github.com/<YOUR_USERNAME>/san_system_design.git
cd san_system_design
```

Then open the GitHub Pages URL or run `mkdocs serve` locally.

---

## How to read (structure)

1. **Part 1** — interview framework, requirements, mobile constraints  
2. **Part 2** — networking, cache, offline, media, push, perf, security, observability  
3. **Part 3** — full model solutions (consumer + fintech)  
4. **Appendix** — cheat sheet, follow-ups, scoring rubric, architect skills / 90-day plan  

---

## Study paths

### 2-week intensive (generalist)

| Days | Focus |
|------|--------|
| 1–2 | Part 1 + skim Part 2 decision tables |
| 3–5 | Part 2 deep read (networking, cache, offline, media, push) |
| 6–10 | Part 3: one model solution per day (speak aloud, 45–60 min) |
| 11–12 | Remaining Part 3 + Appendix A/B |
| 13–14 | Mock interviews using Appendix C rubric |

### 4-week paced (generalist)

| Week | Focus |
|------|--------|
| 1 | Part 1 + Part 2 Ch 04–07 |
| 2 | Part 2 Ch 08–12 + Part 3 solutions 13–14 |
| 3 | Part 3 solutions 15–18 |
| 4 | Part 3 solutions 19–20 + appendix + 3 full mocks |

### 4-week paced (fintech)

| Week | Focus |
|------|--------|
| 1 | Part 1 + Ch 05, 06 (money cache), 07 (fintech exception), 11, 12 + Ch 25 |
| 2 | Ch 21–24 (checkout, UPI, wallet, recovery) |
| 3 | Ch 26–31 (KYC, QR, auth, saved cards, bill pay, fraud) |
| 4 | Ch 32–42 stretch picks + cross-rail kill-mid-pay + Appendix C |

### 2-week fintech / payments track

| Days | Focus |
|------|--------|
| 1 | Part 1 + Ch 05, 07, 11, 12 + [Ch 25](book/part-3-model-solutions/25-top-fintech-system-design.md) |
| 2–3 | Ch 21 Checkout SDK |
| 4–5 | Ch 22 UPI intent/collect |
| 6 | Ch 23 Wallet transfer |
| 7 | Ch 24 History + pending recovery |
| 8 | Ch 26 KYC + Ch 27 QR |
| 9 | Ch 28 Auth/bind + Ch 29 Saved cards |
| 10 | Ch 30 Bill pay + Ch 31 Fraud challenge |
| 11–12 | Stretch: pick 2 from Ch 32–42 + kill-mid-pay drill |
| 13–14 | [Top fintech mock day](#top-fintech-mock-day-1-day-intensive) + Appendix C |

---

## Top fintech mock day (1 day intensive)

Use this when you are **1–2 weeks from interviews** at top fintechs (PhonePe, Razorpay, Paytm, neobanks, checkout SDK teams). Total time: **~4 hours** + scoring. Do it on paper/whiteboard; **speak aloud**.

**Prep:** skim [Appendix A](book/appendix/A-cheat-sheet.md) fintech snaps + [Ch 25 checklist](book/part-3-model-solutions/25-top-fintech-system-design.md). Have [Appendix C](book/appendix/C-rubric.md) open to score each block.

### Schedule

| Block | Time | Prompt | Reference chapter |
|-------|------|--------|-------------------|
| **1 — Core rail** | 45 min | “Design a mobile checkout / payment SDK for merchant apps (card + UPI + wallet).” | [Ch 21](book/part-3-model-solutions/21-checkout-payment-sdk.md) |
| *Break* | 10 min | — | — |
| **2 — India rail** | 45 min | “Design UPI intent pay + collect in a payer app.” | [Ch 22](book/part-3-model-solutions/22-upi-intent-collect.md) |
| *Lunch* | — | — | — |
| **3 — Cross-rail capstone** | 60 min | See script below | [Ch 27→22→24→38](book/part-3-model-solutions/27-qr-payments.md) |
| *Break* | 10 min | — | — |
| **4 — Staff rapid-fire** | 20 min | Interviewer asks 6 probes (below) | Ch 25 + weakest block |
| **Score & debrief** | 30 min | Fill Appendix C for blocks 1–3 | [Appendix C](book/appendix/C-rubric.md) |

**Optional swap (Razorpay / global checkout focus):** replace Block 2 with **Apple Pay / Google Pay** — “Design wallet pay with server confirm before OS sheet success” ([Ch 41](book/part-3-model-solutions/41-apple-google-pay.md)), or **saved cards** ([Ch 29](book/part-3-model-solutions/29-saved-cards-tokenization.md)).

---

### Block 1 — Core rail (45 min): Checkout SDK

**Prompt (read aloud):**  
*“You are designing a mobile Payment SDK embedded in merchant apps. Support tokenized card, UPI handoff, and wallet pay. The host app must handle success, failure, cancel, and pending.”*

**Suggested clock**

| Min | You should deliver |
|-----|-------------------|
| 0–7 | MVP rails; PCI scope; out of scope (ledger/settlement) |
| 7–18 | Boxes: host → SDK → state machine → local store → API/PSP |
| 18–35 | Start pay, idempotency key, txn states, 3DS/WebView path |
| 35–42 | Kill mid-3DS; double-tap Pay; `unknown` + poll |
| 42–45 | Summary + one trade-off (hosted fields vs native PAN) |

**Interviewer interrupts (pick 2 if practicing with a partner)**

1. “User double-taps Pay — what guarantees one charge?”
2. “WebView 3DS killed — what happens on cold start?”
3. “Why is `pending` a valid SDK callback?”

**Scoring anchors (Block 1)**

| Signal | Strong hire (4–5) | Weak (1–2) |
|--------|-------------------|------------|
| Money truth | Server/PSP decides; client renders status | Shows “Paid” from WebView or local guess |
| Idempotency | Same key on retry; UI single-flight | New request per tap |
| States | `requires_action`, `processing`, `unknown` | Binary success/fail only |
| PCI | Hosted fields; no PAN in app | Native card form in merchant process |
| Mobile | Process death + resume pending | Happy path only |

**Block 1 pass bar:** Fintech correctness ≥4; no dimension below 3. **Strong hire:** average ≥4.2 across all 11 dimensions.

---

### Block 2 — India rail (45 min): UPI intent + collect

**Prompt:**  
*“Design UPI payments in a consumer app: intent pay to external UPI apps and collect-request approval. Flaky networks and process death are common.”*

**Suggested clock**

| Min | You should deliver |
|-----|-------------------|
| 0–6 | MVP both flows; Android vs iOS handoff caveat |
| 6–15 | Orchestrator + durable `PaymentAttempt` store |
| 15–30 | Intent: server-built URI, chooser, return = hint only, poll |
| 30–40 | Collect: create → user approves in UPI app → poll until terminal |
| 40–45 | No UPI app installed; extras say SUCCESS but API pending |

**Interviewer interrupts**

1. “Intent extras say success; API says pending — UI?”
2. “User kills app while in GPay — reopen behavior?”
3. “Polling backoff — when do you stop?”

**Scoring anchors (Block 2)**

| Must mention unprompted | If missing → cap Fintech at 3 |
|-------------------------|-------------------------------|
| Intent result is **hint only** | Shows success from extras |
| Poll + idempotent create | Retries without same key |
| `unknown` after timeout/kill | Gives up or duplicates charge |
| No-app fallback path | Crashes or blank screen |

**Block 2 pass bar:** Same as Block 1. **Strong hire:** you proactively draw the sequence diagram with “Treat extras as hint only” note.

---

### Block 3 — Cross-rail capstone (60 min)

This is the **differentiator** for top fintech senior loops. One continuous story across modules.

**Prompt:**  
*“Design QR pay at a shop: scan merchant QR, confirm amount, pay via UPI, handle app kill mid-flow, show result in transaction history, and let the user raise a dispute if needed.”*

**Act it as one design (not four separate answers).**

| Min | Segment | Must cover |
|-----|---------|------------|
| 0–8 | Scope | Payer scan MVP; static vs dynamic QR; defer merchant POS deep dive |
| 8–20 | Scan → confirm | Parse; dynamic QR server resolve; **confirm before** UPI launch |
| 20–35 | Pay | Create payment idempotent → UPI intent (Ch 22) → persist `launched/processing` |
| 35–45 | Kill mid-pay | Cold start → pending rows → poll (Ch 24 backoff) |
| 45–52 | History | Merge local attempt + server row; show UTR/RRN refs |
| 52–58 | Dispute entry | Prefill from history; no optimistic “refunded” (Ch 38) |
| 58–60 | Staff close | Metrics: funnel to terminal, unknown age p95, kill switch per rail |

**Capstone “strong hire” checklist (tick ≥8/10)**

- [ ] Integer minor units on confirm screen  
- [ ] Dynamic QR validated server-side  
- [ ] Never auto-pay on scan alone  
- [ ] Idempotency key on create  
- [ ] UPI return ≠ terminal success  
- [ ] Durable attempt survives kill  
- [ ] Poll strategy with backoff  
- [ ] Push wakes fetch, not truth  
- [ ] History shows pending → terminal merge  
- [ ] Dispute prefills paymentId + refs  

**Capstone pass bar:** ≥7/10 checklist + Fintech ≥4. **Staff lean:** 9/10 + metrics + remote kill switch mentioned in last 2 min.

---

### Block 4 — Staff rapid-fire (20 min)

Answer out loud in **2–3 min each**. Use [Appendix B](book/appendix/B-follow-up-questions.md) to grade yourself.

| # | Probe |
|---|--------|
| 1 | PSP error rate spikes — what does mobile do in the next hour? |
| 2 | New payment schema migration with 10M installs — client plan? |
| 3 | Fraud wants step-up on every new beneficiary for 24h — UX? ([Ch 37](book/part-3-model-solutions/37-beneficiary-cool-off.md)) |
| 4 | Bill pay: directory cached 7 days, due fetched now — what breaks if you skip due refresh? ([Ch 30](book/part-3-model-solutions/30-bill-pay.md)) |
| 5 | BNPL approved in WebView but capture API times out — merchant callback? ([Ch 36](book/part-3-model-solutions/36-bnpl-checkout.md)) |
| 6 | Which Ch 25 top-12 prompt fits PhonePe vs Razorpay vs Jupiter — and why? |

**Rapid-fire pass:** clear answer on ≥5/6 without reading notes. **Strong:** each answer names a **client behavior**, not “backend will handle it.”

---

### End-of-day hire signals

Score Blocks 1–3 with [Appendix C](book/appendix/C-rubric.md) (include Fintech row). Use this summary:

| Overall | Signal |
|---------|--------|
| **Strong hire (senior)** | All three blocks: avg ≥4.0, Fintech ≥4 each, no 1s; capstone ≥7/10 |
| **Hire** | Avg ≥3.5, Fintech ≥3 each, capstone ≥5/10 |
| **Hold / redo** | Any Fintech ≤2, or capstone below 5/10, or optimistic-paid in any block |
| **Staff lean** | Capstone ≥9/10 + Block 4 ≥5/6 + Observability ≥4 on every block |

**Same-day debrief (15 min)**

1. Photo whiteboards; note which block had lowest Fintech score.  
2. Re-read that chapter’s **Failures** + **Trade-offs** sections only.  
3. Re-run **only the weakest 15 minutes** of the capstone tomorrow.  
4. Log scores in a table — redo mock day when all three Fintech scores ≥4 two days in a row.

### Company-specific emphasis (pick one stretch mock next day)

| Company type | Extra 45-min mock | Chapter |
|--------------|-------------------|---------|
| PhonePe / GPay / Paytm | UPI Autopay + Lite | [32](book/part-3-model-solutions/32-upi-autopay-mandates.md), [33](book/part-3-model-solutions/33-upi-lite.md) |
| Razorpay / Cashfree | SoftPOS or BNPL host SDK | [34](book/part-3-model-solutions/34-softpos-tap-to-phone.md), [36](book/part-3-model-solutions/36-bnpl-checkout.md) |
| Neobank | KYC + cool-off + lending | [26](book/part-3-model-solutions/26-kyc-onboarding.md), [37](book/part-3-model-solutions/37-beneficiary-cool-off.md), [40](book/part-3-model-solutions/40-lending-apply-esign.md) |
| Global checkout | Saved cards + Apple/Google Pay + fraud | [29](book/part-3-model-solutions/29-saved-cards-tokenization.md), [41](book/part-3-model-solutions/41-apple-google-pay.md), [31](book/part-3-model-solutions/31-fraud-challenge-step-up.md) |
| Auth modernization | Passkeys + device bind | [42](book/part-3-model-solutions/42-passkeys-webauthn.md), [28](book/part-3-model-solutions/28-secure-auth-device-binding.md) |

---

## Contents

- [Preface](book/00-preface.md)
- **Part 1 — Foundations**
  - [01 Interview Framework](book/part-1-foundations/01-interview-framework.md)
  - [02 Requirements and Scope](book/part-1-foundations/02-requirements-and-scope.md)
  - [03 Mobile Constraints](book/part-1-foundations/03-mobile-constraints.md)
- **Part 2 — Building Blocks**
  - [04 Client Architecture](book/part-2-building-blocks/04-client-architecture.md)
  - [05 Networking and APIs](book/part-2-building-blocks/05-networking-and-apis.md)
  - [06 Caching and Storage](book/part-2-building-blocks/06-caching-and-storage.md)
  - [07 Offline and Sync](book/part-2-building-blocks/07-offline-and-sync.md)
  - [08 Media: Images and Video](book/part-2-building-blocks/08-media-images-video.md)
  - [09 Realtime and Push](book/part-2-building-blocks/09-realtime-and-push.md)
  - [10 Performance, Battery, Lifecycle](book/part-2-building-blocks/10-performance-battery-lifecycle.md)
  - [11 Security and Privacy](book/part-2-building-blocks/11-security-and-privacy.md)
  - [12 Observability and Quality](book/part-2-building-blocks/12-observability-and-quality.md)
- **Part 3 — Model Solutions**
  - [13 Social Feed](book/part-3-model-solutions/13-social-feed.md)
  - [14 Messaging / Chat](book/part-3-model-solutions/14-messaging-chat.md)
  - [15 Ride Hailing](book/part-3-model-solutions/15-ride-hailing.md)
  - [16 Video Player](book/part-3-model-solutions/16-video-player.md)
  - [17 Offline Notes](book/part-3-model-solutions/17-offline-notes.md)
  - [18 Maps / Location](book/part-3-model-solutions/18-maps-location.md)
  - [19 News Reader](book/part-3-model-solutions/19-news-reader.md)
  - [20 Photo Capture and Upload](book/part-3-model-solutions/20-photo-camera-upload.md)
  - **Fintech**
    - [21 Checkout / Payment SDK](book/part-3-model-solutions/21-checkout-payment-sdk.md)
    - [22 UPI Intent and Collect](book/part-3-model-solutions/22-upi-intent-collect.md)
    - [23 Wallet Transfer](book/part-3-model-solutions/23-wallet-transfer.md)
    - [24 Transaction History and Pending Recovery](book/part-3-model-solutions/24-txn-history-pending-recovery.md)
    - [25 Top Fintech System Design Problems](book/part-3-model-solutions/25-top-fintech-system-design.md)
    - [26 KYC / Identity Onboarding](book/part-3-model-solutions/26-kyc-onboarding.md)
    - [27 QR Payments](book/part-3-model-solutions/27-qr-payments.md)
    - [28 Secure Auth and Device Binding](book/part-3-model-solutions/28-secure-auth-device-binding.md)
    - [29 Saved Cards / Tokenization](book/part-3-model-solutions/29-saved-cards-tokenization.md)
    - [30 Bill Pay](book/part-3-model-solutions/30-bill-pay.md)
    - [31 Fraud Challenge / Step-up](book/part-3-model-solutions/31-fraud-challenge-step-up.md)
    - [32 UPI Autopay / Mandates](book/part-3-model-solutions/32-upi-autopay-mandates.md)
    - [33 UPI Lite](book/part-3-model-solutions/33-upi-lite.md)
    - [34 SoftPOS / Tap-to-Phone](book/part-3-model-solutions/34-softpos-tap-to-phone.md)
    - [35 Cross-border Remittance](book/part-3-model-solutions/35-cross-border-remittance.md)
    - [36 BNPL at Checkout](book/part-3-model-solutions/36-bnpl-checkout.md)
    - [37 Beneficiary Cool-off](book/part-3-model-solutions/37-beneficiary-cool-off.md)
    - [38 Payment Disputes / Support](book/part-3-model-solutions/38-payment-disputes-support.md)
    - [39 Trading Watchlist + Orders](book/part-3-model-solutions/39-trading-watchlist-orders.md)
    - [40 Lending Apply + E-sign](book/part-3-model-solutions/40-lending-apply-esign.md)
    - [41 Apple Pay / Google Pay](book/part-3-model-solutions/41-apple-google-pay.md)
    - [42 Passkeys (WebAuthn)](book/part-3-model-solutions/42-passkeys-webauthn.md)
- **Appendix**
  - [A Cheat Sheet](book/appendix/A-cheat-sheet.md)
  - [B Follow-up Questions](book/appendix/B-follow-up-questions.md)
  - [C Evaluation Rubric](book/appendix/C-rubric.md)
  - [D Mobile Architect Skills & 90-Day Plan](book/appendix/D-mobile-architect-skills-90-day.md)

---

## Conventions

- Cache sizes, timeouts, and budgets are **interview-reasonable defaults**, not product SLAs.
- `iOS:` / `Android:` callouts mark platform differences.
- Backend appears only as **contracts** the client depends on.
- Money uses **integer minor units** (e.g. paise); UI status follows **server verification**.
- This material is **original**; it is not a copy of any commercial interview book.

## Modern platform practices (2025–2026)

The book is **pattern-first** (not a library changelog). In live interviews, align with these current defaults:

| Area | Current lean |
|------|----------------|
| **Architecture** | Layered MVVM/MVI; repositories; unidirectional state (`StateFlow` / Swift `@Observable`) |
| **Concurrency** | Kotlin coroutines + Flow; Swift `async`/`await` + MainActor; cancel on screen leave |
| **Networking** | HTTPS/TLS; cursor pagination; idempotency keys; single-flight token refresh |
| **Android storage** | Room + DataStore; **Encrypted DataStore + Keystore/Tink** for secrets (EncryptedSharedPreferences is deprecated) |
| **iOS storage** | Keychain with access control; Core Data / GRDB / SwiftData for app state |
| **Security** | Play Integrity / DeviceCheck as soft signals; cert pinning only with rotation plan |
| **Privacy** | Photo Picker / PHPicker; notification permission (Android 13+); minimize PII in logs |
| **Payments** | Hosted fields / PSP SDK; 3DS2; server confirm before wallet sheet success; passkeys for auth (Ch 42) |
| **Background** | WorkManager (Android); BGAppRefresh/BGProcessing (iOS); restartable idempotent jobs |
| **UI** | SwiftUI or Compose acceptable—interviewers care about layers and data flow, not widget trivia |

If a chapter names a library (Coil, WorkManager, etc.), treat it as an **example**—the underlying pattern is what you score on.

## Quick mock loop

1. Pick a Part 3 chapter (or a row from [Ch 25](book/part-3-model-solutions/25-top-fintech-system-design.md)).
2. Timer **45–60 min**; whiteboard or paper; speak aloud.
3. Score with [Appendix C](book/appendix/C-rubric.md).
4. Drill gaps using [Appendix B](book/appendix/B-follow-up-questions.md).
