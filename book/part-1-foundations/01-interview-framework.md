# 01 — Interview Framework

## Goal

Run a 45–60 minute mobile system design interview with a repeatable structure so you never “run out of time in the wrong place.”

## The loop

```mermaid
flowchart LR
  clarify[Clarify] --> scope[Scope_NFRs]
  scope --> hl[High_Level]
  hl --> data[Data_and_API]
  data --> deep[Deep_Dives]
  deep --> fail[Failures_Tradeoffs]
  fail --> wrap[Summary]
```

| Phase | Time | Deliverable |
|-------|------|-------------|
| Clarify | 5–7 min | Functional list + open questions answered |
| Scope & NFRs | 3–5 min | MVP vs later; scale, offline, latency budgets |
| High-level architecture | 8–10 min | Boxes: UI, domain, data, network, push |
| Data & API | 8–10 min | Entities, endpoints/events, local schema |
| Deep dives | 12–15 min | 2–3 mobile-critical areas |
| Failures & trade-offs | 5–7 min | Kill process, flaky net, token refresh |
| Summary | 1–2 min | Restate decisions |

## Communication habits

1. **Narrate the clock**: “I’ll spend ~5 minutes clarifying, then sketch architecture.”
2. **Write decisions**, not libraries: “disk cache with LRU 200 MB” beats “use Coil/Kingfisher.”
3. **Offer a fork**: “Two options—polling every 30s vs WebSocket. For chat I’d pick WebSocket because…”
4. **Invite focus**: “Happy to deep-dive offline sync or image pipeline—which do you care about?”

## What interviewers score

- Structured thinking under ambiguity
- Mobile-specific constraints (see [Ch 03](03-mobile-constraints.md))
- Correctness of data flow (read/write paths)
- Trade-off quality (cost of the alternative)
- Senior instincts: rollout, observability, migration

## Anti-patterns

| Anti-pattern | Fix |
|--------------|-----|
| Jumping to UI widgets | Start with data ownership and sync |
| Designing only backend | Stay client-primary; backend is a contract |
| Listing every feature | Explicitly cut scope |
| Silent drawing | Talk while you draw |
| Ignoring OS kill | Always walk “app killed mid-request” |

## Staff stretch (use in last 5 minutes)

- Feature flag for risky sync changes
- Metrics: cold start p95, scroll hitch rate, sync failure rate
- Migration plan if local schema changes
- Privacy: what leaves the device

## Checkpoint

Before deep dives, you should be able to point at the board and say: **who owns truth** (server vs local), **what is cached**, and **what happens offline**.
