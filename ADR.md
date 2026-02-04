# Architecture Decision Record (ADR)

## ADR-001: Technology Stack Selection

**Date:** February 2026
**Status:** Accepted

---

### Context

Build a production-ready To-do App with four modules: To Call, To Buy, To Sell, and Sync. The app requires remote API calls, local database storage, and offline-first sync capabilities.

---

### Decisions

#### 1. State Management: Cubit (flutter_bloc)

**Choice:** Cubit over full BLoC or Provider

**Rationale:**
- Simpler syntax than BLoC (no events, just methods)
- Built-in state immutability and predictable state flow
- Easy to test with `bloc_test`
- Sufficient for this app's complexity level

---

#### 2. Dependency Injection: get_it

**Choice:** get_it as service locator

**Rationale:**
- Lightweight, no code generation required
- Simple API: `getIt<T>()` to resolve dependencies
- Supports lazy singletons and factories
- Easy setup for Clean Architecture layers

---

#### 3. Local Database: Drift (SQLite)

**Choice:** Drift over sqflite, Hive, or Isar

**Rationale:**
- Type-safe queries with Dart code generation
- Reactive streams for real-time UI updates
- Built-in migration support
- Native SQLite performance (required for `ItemToSell` table)

---

#### 4. HTTP Client: Retrofit + Dio

**Choice:** Retrofit with Dio as underlying client

**Rationale:**
- Type-safe API definitions with annotations
- Automatic JSON serialization via `json_serializable`
- Dio provides interceptors for retry logic, logging, auth
- Clean separation of API contracts

---

### Architecture Overview

```
lib/
├── application/                    # Shared utilities, constants, DI setup
├── data/                    # Data layer
│   ├── datasources/         # Remote API & Local DB implementations
│   ├── models/              # DTOs, database entities
│   └── repositories/        # Repository implementations
├── domain/                  # Domain layer
│   ├── entities/            # Business objects
│   ├── repositories/        # Repository interfaces
│   └── usecases/            # Business logic
└── presentation/            # UI layer
    ├── cubits/              # State management
    ├── screens/               # Screens
    └── widgets/             # Reusable components
```

**Layer Dependencies:**
- Presentation → Domain → Data
- Data implements Domain interfaces
- DI wires everything together

---

### Consequences

**Positive:**
- Clear separation of concerns
- Testable at each layer
- Scalable for future features

**Trade-offs:**
- Initial boilerplate for small features
- Code generation step required (`build_runner`)

---

## ADR-002: Sync Strategy

**Status:** Accepted

### Decision

Implement **offline-first** with manual + background sync:

1. Local DB is source of truth for To-Sell items
2. Changes marked with `syncStatus` (pending/synced/failed)
3. Manual sync via Sync button
4. Background sync on connectivity restore

### Sync Flow

```
User Action → Update Local DB → Queue for Sync → Network Available → Push to API → Update syncStatus
```
