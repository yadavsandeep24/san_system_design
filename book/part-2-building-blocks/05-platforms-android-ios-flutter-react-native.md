# 05 — Platforms: Android, iOS, Flutter and React Native

## Goal

Answer any mobile design question on **any of the four stacks** without changing the architecture: same layers, same data flow, same failure handling. Only the names of the building blocks change. This chapter is the translation table that every later chapter's **Platform implementation** section points back to.

## How to handle "which platform?"

1. **Ask once:** "Native iOS and Android, or a cross-platform stack?" If the interviewer says "your choice", pick the one you know best and say you'll call out where the others differ.
2. **Design platform-neutral first:** UI → state holder → repository → local store / network. Those boxes are the same everywhere (Ch 04).
3. **Go platform-specific only where it changes the design:** background execution, push delivery, secure storage, process lifecycle, list virtualization, and what must stay native in Flutter or React Native.
4. **Close with one difference that matters:** e.g. "On iOS this sync can't run on a schedule, so we lean on silent push plus background refresh; on Android WorkManager gives us a periodic job."

## Equivalence map

| Concern | Android (Kotlin) | iOS (Swift) | Flutter (Dart) | React Native (TypeScript) |
|---------|------------------|-------------|----------------|---------------------------|
| UI toolkit | Views (XML) / Jetpack Compose | UIKit / SwiftUI | Widgets (Material / Cupertino); Impeller renderer | React components → native views (Fabric renderer) |
| State holder | `ViewModel` + `StateFlow` | `@Observable` model (iOS 17+) / `ObservableObject`; TCA reducers | `ChangeNotifier`, Riverpod `Notifier`, Bloc / Cubit | Hooks + store: Zustand, Redux Toolkit; server state in TanStack Query |
| Async | Coroutines, `Flow` | `async`/`await`, actors, `AsyncSequence`; Combine (legacy) | `Future`, `Stream`, isolates for CPU work | Promises / `async`; JS is single-threaded, native modules for heavy work |
| DI | Hilt / Koin / manual | Initializer injection, Factory, swift-dependencies | Riverpod providers, `get_it` | Context / module singletons |
| Navigation | Navigation component / Navigation Compose | `UINavigationController` / `NavigationStack` (iOS 16+) | `go_router`, Navigator 2.0 | React Navigation, Expo Router |
| Lists | `RecyclerView` / `LazyColumn` | `UICollectionView` + diffable data source / `List`, `LazyVStack` | `ListView.builder`, slivers | `FlatList`, Shopify `FlashList` |
| Relational DB | Room (SQLite) | Core Data, SwiftData (iOS 17+), GRDB | drift, sqflite | op-sqlite / expo-sqlite, WatermelonDB |
| Key-value | DataStore (Preferences / Proto) | `UserDefaults` | `shared_preferences` | MMKV, AsyncStorage |
| Secrets | Keystore-backed keys, EncryptedSharedPreferences (deprecated: use Keystore + Tink) | Keychain (`kSecAttrAccessible…`), Secure Enclave keys | `flutter_secure_storage` → Keychain / Keystore | `react-native-keychain`, `expo-secure-store` |
| HTTP | OkHttp + Retrofit / Ktor | `URLSession` | `dio`, `http` | `fetch`, axios (native networking underneath) |
| Images | Coil, Glide | Nuke, Kingfisher, `AsyncImage` | `cached_network_image` | `expo-image`, FastImage |
| Deferrable background work | WorkManager | `BGTaskScheduler` (`BGAppRefreshTask`, `BGProcessingTask`) | `workmanager` plugin (delegates to both) | `react-native-background-fetch`, `expo-background-task` |
| Long transfers | WorkManager + foreground service / user-initiated data transfer job (Android 14+) | Background `URLSession` | Plugin over the native APIs (`background_downloader`) | Native module over the native APIs |
| Push | FCM (data + notification messages) | APNs (alert, background `content-available`); Notification Service Extension | `firebase_messaging` (FCM → APNs on iOS) | `@react-native-firebase/messaging`, `expo-notifications` |
| Deep links | App Links (verified), intent filters | Universal Links (`apple-app-site-association`) | `go_router` + `app_links` | React Navigation linking config |
| Crash / analytics | Firebase Crashlytics, Play vitals | Crashlytics, MetricKit, Xcode Organizer | Crashlytics / Sentry plugins | Sentry, Crashlytics; symbolicate Hermes bytecode |
| Feature flags | Firebase Remote Config, in-house SDK (Ch 34) | Same | Same via plugin | Same via SDK |
| Tests | JUnit, Espresso, Compose UI test, Robolectric | XCTest, Swift Testing, XCUITest | `flutter_test`, `integration_test`, golden tests | Jest, React Native Testing Library, Detox / Maestro |
| Profiling | Android Studio profilers, Perfetto, Macrobenchmark | Instruments (Time Profiler, Allocations, Hangs) | DevTools (frame chart, memory) | Hermes profiler, Flipper (legacy), React DevTools, Perfetto on Android |

## Lifecycle and process death

| Event | Android | iOS | Flutter | React Native |
|-------|---------|-----|---------|--------------|
| App backgrounded | `onStop`; process may be killed later to reclaim memory | Suspended within seconds; may be terminated (jetsam) without a callback | `AppLifecycleState.paused` / `hidden` | `AppState` → `background` |
| Restore after kill | `SavedStateHandle`, `rememberSaveable`, Navigation back stack restored | State restoration (`NSUserActivity`, `@SceneStorage`) — opt-in | `RestorationMixin` / restorable properties (opt-in); usually persist to disk instead | Nothing automatic: persist navigation and drafts yourself |
| Finish work on background | WorkManager | `beginBackgroundTask` (~30 s), then `BGTaskScheduler` | Native APIs via plugin | Native APIs via module |
| Memory warning | `onTrimMemory(level)` | `didReceiveMemoryWarning` / `UIApplication.didReceiveMemoryWarningNotification` | `didHaveMemoryPressure` (`WidgetsBindingObserver`) | Native event → JS; clear image caches natively |

Say aloud: *"Assume the process dies whenever the app is in the background. Anything the user can't afford to lose — a draft, a payment attempt, an upload — is written to disk before we leave the foreground, and on launch we reconcile with the server."*

## Background execution (where designs really differ)

| Need | Android | iOS |
|------|---------|-----|
| Periodic sync | `PeriodicWorkRequest` (≥ 15 min, inexact; Doze and standby buckets defer it) | No guaranteed schedule. `BGAppRefreshTask` runs when the system decides (~30 s budget, based on usage) |
| Heavy maintenance (DB vacuum, ML) | `OneTimeWorkRequest` with `setRequiresCharging` / `setRequiresDeviceIdle` | `BGProcessingTask` (minutes; can require power / network) |
| Big upload / download | WorkManager with `setForeground` (foreground-service type `dataSync`) or user-initiated data transfer job (Android 14+) | Background `URLSession`: the OS performs the transfer even while the app is suspended or terminated by the system (not after a user force-quit) |
| User-started long task (export, upload) | Foreground service with a visible notification | `BGContinuedProcessingTask` (iOS 26+) with system progress UI; earlier: background `URLSession` or finish within `beginBackgroundTask` |
| Exact-time alarm | `AlarmManager` exact alarms need `SCHEDULE_EXACT_ALARM` / `USE_EXACT_ALARM` (Android 12+) | Local notification at a time; your code doesn't run |
| Server wants the app to fetch | High-priority FCM data message → enqueue expedited work | Silent push (`content-available: 1`) — throttled, not delivered after force-quit, ~30 s to run |
| Location in background | Foreground service type `location` + background location permission | "Always" authorization, significant-change / region monitoring, or `CLBackgroundActivitySession` (iOS 17+) |

**Flutter and React Native don't get extra background powers.** Their plugins wrap exactly these APIs, and the Dart / JS runtime has to be started headless to run your code. For anything critical (transfers, payment-status polling while backgrounded), keep the logic in a small native module or use the OS transfer service, and let the shared code read the result on the next launch.

## Push differences that change designs

- **Android (FCM):** *data* messages wake your code (high priority is rate-limited per app); *notification* messages are shown by the system when the app is backgrounded. You can render any notification locally.
- **iOS (APNs):** alert pushes are shown by the OS. To change the content (decrypt, attach an image, localize) use a **Notification Service Extension** (~30 s, separate process, shares data through an App Group). Silent pushes are best-effort and throttled.
- **Rule for every stack:** a push is a hint to fetch. Never treat its payload as the source of truth for money, message order or read state (Ch 10).

## iOS architecture in an interview

- **UI:** SwiftUI for new screens; UIKit where you need fine control (complex collection layouts, text input, mature components). Mix with `UIHostingController` (SwiftUI inside UIKit) and `UIViewRepresentable` / `UIViewControllerRepresentable` (UIKit inside SwiftUI).
- **State:** an `@Observable` view model per screen (or a TCA store), exposing immutable view state; views call intents.
- **Concurrency:** `async`/`await` with structured tasks tied to the view (`.task {}` cancels on disappear); `actor` for shared mutable caches; `@MainActor` on UI-facing types.
- **Storage:** Core Data / SwiftData / GRDB for relational data, files in `Application Support` (excluded from backup when re-downloadable), Keychain for tokens, **App Groups** to share with widgets and extensions.
- **Extensions are separate processes:** widgets, Notification Service, Share, keyboard. They have tight memory limits (tens of MB) and can't call into your running app, so shared state lives in the App Group container.

## Flutter architecture in an interview

- **One codebase, one renderer:** Flutter draws every pixel itself (Impeller), so UI looks the same everywhere. Platform look comes from Cupertino / adaptive widgets.
- **Layers:** widgets → state (Riverpod or Bloc) → repository → data sources (drift, `dio`). Same boxes as native.
- **Threads:** UI and platform threads plus one Dart isolate by default. CPU-heavy work (JSON parsing of big payloads, image processing, crypto) goes to `Isolate.run` / `compute`, or the frame budget is blown.
- **Native access:** platform channels / Pigeon (type-safe codegen) for calling Kotlin / Swift; `dart:ffi` for C libraries. Every plugin is a channel underneath.
- **When to drop to native:** payment SDKs that need an `Activity` / `UIViewController`, widgets and extensions (must be native), background transfers, advanced camera / media pipelines, and anything that has to run while the Dart VM isn't started.
- **Watch:** app size (engine adds several MB), jank on first-run shader paths (much reduced with Impeller), plugin quality and maintenance.

## React Native architecture in an interview

- **New Architecture** (default since RN 0.76): **Fabric** renderer, **TurboModules** (lazy, typed native modules) and **JSI** (direct JS ↔ C++ calls, no JSON bridge). Bridgeless mode. Hermes is the default JS engine (bytecode, faster startup).
- **Threads:** a JS thread runs React and your logic; the UI (main) thread renders native views. A slow JS thread means taps and lists lag even though rendering is native. Animations and gestures run on the UI thread via Reanimated worklets / Gesture Handler.
- **Layers:** screens → hooks → server-state cache (TanStack Query) + client store (Zustand / Redux Toolkit) → API client / local DB (op-sqlite, WatermelonDB, MMKV).
- **Lists:** `FlatList` virtualizes but re-renders easily. Use stable `keyExtractor`, memoized rows, `getItemLayout` for fixed heights, or `FlashList` (recycles views).
- **Native access:** TurboModules / Expo Modules API in Kotlin and Swift. The same "drop to native" list as Flutter applies.
- **Over-the-air updates:** JS bundle updates (Expo EAS Update; Microsoft CodePush was retired with App Center in 2025) can ship fixes without a store review, but only for JS / assets — native changes need a store release. Store rules allow interpreted-code updates that don't change the app's purpose. Version bundles against the native binary they need.

## Choosing a stack (if asked)

| Factor | Native ×2 | Flutter | React Native |
|--------|-----------|---------|--------------|
| Team | Separate iOS / Android skills | Dart; one team | Web / React skills reuse |
| UI fidelity | Best, platform-native | Pixel-identical custom UI | Native components, platform feel |
| Platform APIs on day one | Yes | Via plugins / channels | Via modules |
| Performance ceiling | Highest | High (own renderer) | High with New Architecture; watch the JS thread |
| Shared logic without shared UI | Kotlin Multiplatform | — | — |
| Brownfield (add to an existing app) | — | Add-to-app modules | Integrate RN screens into native apps |

Staff answer: *"For a payments or media-heavy app I'd keep the money and transfer paths native and share UI where it pays off. Kotlin Multiplatform for shared business logic is the low-risk middle ground: UI stays native, the state machine and API client are written once."*

## Same screen on each stack

The profile screen from Ch 04 (name + follow button), with state held outside the view.

=== "SwiftUI"

    ```swift
    @Observable @MainActor
    final class ProfileModel {
        private(set) var name = ""
        private(set) var following = false
        func onFollowTap() { following.toggle() }   // call the repository in real code
    }

    struct ProfileScreen: View {
        @State private var model = ProfileModel()
        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text(model.name).font(.title2)
                Button(model.following ? "Unfollow" : "Follow") { model.onFollowTap() }
            }
            .padding()
        }
    }
    ```

=== "Flutter (Riverpod)"

    ```dart
    class ProfileState {
      const ProfileState({this.name = '', this.following = false});
      final String name;
      final bool following;
      ProfileState copyWith({bool? following}) =>
          ProfileState(name: name, following: following ?? this.following);
    }

    class ProfileNotifier extends Notifier<ProfileState> {
      @override
      ProfileState build() => const ProfileState();
      void onFollowTap() => state = state.copyWith(following: !state.following);
    }

    final profileProvider = NotifierProvider<ProfileNotifier, ProfileState>(ProfileNotifier.new);

    class ProfileScreen extends ConsumerWidget {
      const ProfileScreen({super.key});
      @override
      Widget build(BuildContext context, WidgetRef ref) {
        final s = ref.watch(profileProvider);
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.name, style: Theme.of(context).textTheme.titleLarge),
          FilledButton(
            onPressed: ref.read(profileProvider.notifier).onFollowTap,
            child: Text(s.following ? 'Unfollow' : 'Follow'),
          ),
        ]);
      }
    }
    ```

=== "React Native (Zustand)"

    ```tsx
    import { create } from 'zustand';
    import { Button, Text, View } from 'react-native';

    type ProfileState = { name: string; following: boolean; onFollowTap: () => void };

    const useProfile = create<ProfileState>((set) => ({
      name: '',
      following: false,
      onFollowTap: () => set((s) => ({ following: !s.following })),
    }));

    export function ProfileScreen() {
      const { name, following, onFollowTap } = useProfile();
      return (
        <View style={{ padding: 16, gap: 12 }}>
          <Text style={{ fontSize: 22 }}>{name}</Text>
          <Button title={following ? 'Unfollow' : 'Follow'} onPress={onFollowTap} />
        </View>
      );
    }
    ```

In every version the view only renders state and forwards intents. That's what makes the screen testable and lets you swap the UI toolkit without touching the data layer.

## Say it in the interview

> "The architecture is the same on every platform: UI, a state holder, a repository, a local store and the network. Where the platforms really differ is background work and push. On Android, WorkManager gives us guaranteed deferred work; on iOS nothing runs on a schedule, so large transfers go through a background URLSession and freshness comes from silent push plus background refresh. If we were on Flutter or React Native, I'd keep those two pieces in thin native modules and keep everything else shared."

## Checkpoint

For any feature, name: **the state holder**, **where data persists**, **what runs in the background and which OS API runs it**, and **what has to stay native** on Flutter / React Native.

## Exercises

1. A notes app must sync edits made offline. Write the background-sync plan for Android and iOS in two sentences each. What changes if the app is written in Flutter?
2. A React Native chat app drops frames while a large conversation loads. Name two causes on the JS thread and the fix for each.
3. Your Flutter checkout must open a card issuer's 3-D Secure SDK that only ships as native iOS / Android libraries. Sketch the boundary: what's in Dart, what's native, and how results flow back.
4. List three things a widget or Notification Service Extension can't do that the main app can, and how the design works around each.
