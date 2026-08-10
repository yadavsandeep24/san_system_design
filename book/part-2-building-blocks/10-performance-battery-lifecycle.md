# 10 — Performance, Battery, and Lifecycle

## Goal

Budget for cold start, scroll jank, background work, and battery—and speak about them quantitatively enough for senior interviews.

## Cold start

```mermaid
flowchart LR
  process[Process_Start] --> init[DI_and_Config]
  init --> first[First_Frame]
  first --> content[First_Meaningful_Content]
```

| Phase | Tactics |
|-------|---------|
| Process start | Defer non-critical init; avoid disk on main |
| First frame | Minimal home shell; async hydrate |
| Content | Show cached data immediately; refresh |

Targets (interview-reasonable): warm content <1s when cached; cold uncached honest about network.

## Runtime UI performance

- Main thread: no network, no large JSON parse, no heavy image decode
- Lists: recycling, stable IDs, diffing
- Overdraw and nested layouts—mention if UI-heavy prompt
- Cap concurrent work (thread pools)

## Memory

- Leak awareness: listeners, static Context, abandoned players
- On trim: release memory caches, shrink decode pools
- Large bitmaps: downsample; recycle carefully per platform norms

## Battery

| Drain source | Mitigation |
|--------------|------------|
| Wakelocks / foreground services | Use sparingly; justify UX |
| Location | Adaptive accuracy; batch |
| Network radio | Coalesce; prefer unmetered for bulky sync |
| CPU polling loops | Event-driven; OS schedulers |

## Background work

| Job type | Scheduler |
|----------|-----------|
| Opportunistic sync | WorkManager / BGAppRefresh |
| User-initiated download | Foreground notification when required |
| Exact timing | Rare; alarm with care |

Respect OS deferral—design sync to be **restartable** and idempotent.

## App lifecycle hooks to mention

- Enter background: flush logs, persist drafts, disconnect expensive sockets if policy says so
- Return foreground: reconnect, delta sync
- Low memory / trim: drop caches
- Locale / theme changes: recreate safely

```mermaid
sequenceDiagram
  participant App
  participant OS
  App->>App: Persist_drafts_and_outbox
  OS->>App: Background
  OS->>App: Process_Death
  OS->>App: Cold_Start
  App->>App: Restore_plus_delta_sync
```

## Checkpoint

Tie each expensive feature to a **budget** (start time, fps, battery) and a **deferral strategy**.
